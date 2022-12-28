<?php

ini_set('session.name', ini_get('session.name') . 'A');

define('VERSION', '1.5.6.4');
define('IS_HTTPS', true);
define('IS_ADMIN', true);
header('X-ENGINE-ENTRANCE: INDEX-ADMIN');

set_error_handler('error_handler');

function loadJsonConfig($config){
	if (defined('DIR_SYSTEM')){
		$json = file_get_contents(DIR_SYSTEM . 'config/' . $config . '.json');
	} else {
		$json = file_get_contents(dirname(__FILE__) . '/../system/config/' . $config . '.json');
	}

	return json_decode($json, true);
}	

function is_cli(){
	return (php_sapi_name() === 'cli');
}

function echoLine($line){
	if (is_cli()){
		echo $line . PHP_EOL;
	}
}

if (isset($_GET['hello']) && $_GET['hello'] == 'world'){
	define('IS_DEBUG', true);
} else {
	$ipsConfig = loadJsonConfig('ips');

	if (!empty($ipsConfig['debug']) && !empty($_SERVER['REMOTE_ADDR']) && in_array($_SERVER['REMOTE_ADDR'], $ipsConfig['debug'])){
		define('IS_DEBUG', true);
	} else {
		define('IS_DEBUG', false);
	}
}

$httpHost 		= str_replace('www.', '', $_SERVER['HTTP_HOST']);
$configFiles 	= loadJsonConfig('configs');	

if (isset($configFiles[$httpHost])){		
	if (file_exists($configFiles[$httpHost])) {
		$configFile = $configFiles[$httpHost];
		require_once($configFiles[$httpHost]);
	} else {
		die ('no config file!');
	}

} else {
	die ('ho config file assigned to host');
}	

if ($httpHost != parse_url(HTTPS_CATALOG, PHP_URL_HOST)){
	die('sorry');
}

require_once(DIR_SYSTEM . '../vendor/autoload.php');

require_once(DIR_SYSTEM . 'startup.php');	
require_once(DIR_SYSTEM . 'library/currency.php');
require_once(DIR_SYSTEM . 'library/customer.php');
require_once(DIR_SYSTEM . 'library/user.php');
require_once(DIR_SYSTEM . 'library/weight.php');
require_once(DIR_SYSTEM . 'library/length.php');
require_once(DIR_SYSTEM . 'library/cart.php');
require_once(DIR_SYSTEM . 'library/smsQueue.php');
require_once(DIR_SYSTEM . 'library/mAlert.php');
require_once(DIR_SYSTEM . 'library/pushQueue.php');
require_once(DIR_SYSTEM . 'library/Bitrix24.php');
require_once(DIR_SYSTEM . 'library/shortAlias.php');
require_once(DIR_SYSTEM . 'library/sessionDBHandler.php');
require_once(DIR_SYSTEM . 'library/PageCache.php');
require_once(DIR_SYSTEM . 'library/hobotix/EmailBlackList.php');
require_once(DIR_SYSTEM . 'library/hobotix/RainforestAmazon.php');
require_once(DIR_SYSTEM . 'library/hobotix/PricevaAdaptor.php');
require_once(DIR_SYSTEM . 'library/hobotix/simpleProcess.php');
require_once(DIR_SYSTEM . 'library/hobotix/YandexTranslator.php');	

$registry = new Registry();
$loader = new Loader($registry);
$registry->set('load', $loader);

$config = new Config();
$registry->set('config', $config);

$log = new Log('php-errors-admin.log');
$registry->set('log', $log);

$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
$registry->set('db', $db);
$registry->set('dbmain', $db);
$registry->set('current_db', 'dbmain');

if (defined('DB_CONTENT_SYNC') && DB_CONTENT_SYNC){
	$dbcs = new DB(DB_CONTENT_SYNC_DRIVER, DB_CONTENT_SYNC_HOSTNAME, DB_CONTENT_SYNC_USERNAME, DB_CONTENT_SYNC_PASSWORD, DB_CONTENT_SYNC_DATABASE);
	$registry->set('dbcs', $dbcs);

	$syncConfig = loadJsonConfig('sync');
	if (!empty($syncConfig['sync'])){
		$registry->set('sync', $syncConfig['sync']);
	}
} else {
	$registry->set('dbcs', false);
}

$query = $db->query("SELECT * FROM setting WHERE store_id = '0'");

foreach ($query->rows as $setting) {
	if (!$setting['serialized']) {
		$config->set($setting['key'], $setting['value']);
	} else {		
		$config->set($setting['key'], unserialize($setting['value']));
	}
}

$configFilesPrefix = '';
if (count($configFileExploded = explode('.', $configFile)) == 3){
	if (mb_strlen($configFileExploded[1]) == 2){
		$configFilesPrefix = trim($configFileExploded[1]);
	}
}
$registry->get('config')->set('config_config_file_prefix', $configFilesPrefix);

$smsQueue = new smsQueue($registry);
$registry->set('smsQueue', $smsQueue);

$pushQueue = new pushQueue($registry);
$registry->set('pushQueue', $pushQueue);

$pricevaAdaptor = new hobotix\PricevaAdaptor($registry);
$registry->set('pricevaAdaptor', $pricevaAdaptor);


if (IS_DEBUG){
	error_reporting (E_ALL);	
	ini_set('display_errors', 1);
} else {
	error_reporting (0);	
	ini_set('display_errors', 0);
}

function error_handler($errno, $errstr, $errfile, $errline) {
	global $log, $config;

	switch ($errno) {
		case E_NOTICE:
		case E_USER_NOTICE:
		$error = 'Notice';
		break;
		case E_WARNING:
		case E_USER_WARNING:
		$error = 'Warning';
		break;
		case E_ERROR:
		case E_USER_ERROR:
		$error = 'Fatal Error';
		break;
		default:
		$error = 'Unknown';
		break;
	}

	if (IS_DEBUG) {
		echo '<b>' . $error . '</b>: ' . $errstr . ' in <b>' . $errfile . '</b> on line <b>' . $errline . '</b>';
	}

	return true;
}


$request = new Request();
$registry->set('request', $request);

$response = new Response();
$response->addHeader('Content-Type: text/html; charset=utf-8');
$registry->set('response', $response); 

$cache = new Cache();
$registry->set('cache', $cache); 

$PageCache = new PageCache(false);
$registry->set('PageCache', $PageCache); 

$registry->set('url',  new Url(HTTPS_SERVER, $registry));

$session = new Session();
$registry->set('session', $session); 

$mAlert = new mAlert($registry);
$registry->set('mAlert', $mAlert);

$shortAlias = new shortAlias($registry);
$registry->set('shortAlias', $shortAlias);

$Bitrix24 = new Bitrix24($registry);
$registry->set('Bitrix24', $Bitrix24);

$registry->set('mobileDetect', new Mobile_Detect);
$registry->set('simpleProcess', new hobotix\simpleProcess());

$languages = [];
$languages_id_code_mapping = [];
$query = $registry->get('db')->query("SELECT * FROM `language` WHERE status = '1'"); 

foreach ($query->rows as $result) {
	$languages[$result['code']] = $result;
	$languages_id_code_mapping[$result['language_id']] = $result['code'];
}

$registry->set('languages', $languages);
$registry->set('languages_id_code_mapping', $languages_id_code_mapping);
$registry->get('config')->set('config_language_id', $languages[$config->get('config_admin_language')]['language_id']);
$registry->get('config')->set('config_rainforest_source_language_id', $languages[$registry->get('config')->get('config_rainforest_source_language')]['language_id']);

$language = new Language($languages[$config->get('config_admin_language')]['directory'], $registry);
$language->load($languages[$config->get('config_admin_language')]['filename']);	
$registry->set('language', $language);


$sorts = loadJsonConfig('sorts');

if (!empty($sorts['sorts'])){
	$registry->set('sorts', $sorts['sorts']);
}

if (!empty($sorts['sorts_available'])){
	$registry->set('sorts_available', $sorts['sorts_available']);
}

if ($registry->get('config')->get('config_sort_default')){
	$registry->get('config')->set('sort_default', $registry->get('config')->get('config_sort_default'));
} elseif (!empty($sorts['sort_default'])){
	$registry->get('config')->set('sort_default', $sorts['sort_default']);
}

if ($registry->get('config')->get('config_order_default')){
	$registry->get('config')->set('order_default', $registry->get('config')->get('config_order_default'));
} elseif (!empty($sorts['order_default'])){
	$registry->get('config')->set('order_default', $sorts['order_default']);
}

$registry->set('customer_group_id', $registry->get('config')->get('config_customer_group_id'));


$registry->set('document', new Document()); 		
$registry->set('currency', new Currency($registry));		
$registry->set('weight', new Weight($registry));
$registry->set('length', new Length($registry));
$registry->set('user', new User($registry));
$registry->set('cart', new Cart($registry));

$emailBlackList = new hobotix\EmailBlackList($registry);
$registry->set('emailBlackList', $emailBlackList);

$rainforestAmazon = new hobotix\RainforestAmazon($registry);
$registry->set('rainforestAmazon', $rainforestAmazon);

$yandexTranslator = new hobotix\YandexTranslator($registry);
$registry->set('yandexTranslator', $yandexTranslator);

$registry->set('customer', new Customer($registry));

$controller = new Front($registry);

$controller->addPreAction(new Action('common/home/login'));
$controller->addPreAction(new Action('common/home/permission'));

if (isset($request->get['route'])) {
	$action = new Action($request->get['route']);
} else {
	$action = new Action('common/home');
}

$controller->dispatch($action, new Action('error/not_found'));

$response->output();