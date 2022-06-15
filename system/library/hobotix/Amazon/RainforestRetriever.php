<?
	
	namespace hobotix\Amazon;
	
	class RainforestRetriever
	{

		public $db;	
		public $config;		
		public $endpoint;	
		public $rfClient;
		
		public $jsonResult = null;

		public function __construct($registry, $rfClient){
			
			$this->registry = $registry;
			$this->config = $registry->get('config');			
			$this->db = $registry->get('db');
			$this->log = $registry->get('log');
			$this->rfClient = $rfClient;
			
		}

		const CLASS_NAME = 'hobotix\\Amazon\\RainforestRetriever';

		public function checkIfPossibleToMakeRequest(){
			$this->registry->get('rainforestAmazon')->checkIfPossibleToMakeRequest();
		}

		public function setJsonResult($json){
			$this->jsonResult = $json;			
		}

		public function getJsonResult(){
			return $this->jsonResult;			
		}

		public function getNextPage(){

			if (!empty($this->jsonResult['pagination'])){

				if ($this->jsonResult['pagination']['current_page'] <= $this->jsonResult['pagination']['total_pages']){
					return ((int)$this->jsonResult['pagination']['current_page'] + 1);
				}

			}

			return false;

		}

		public function getImage($amazonImage){

			$localImageName 		= md5($amazonImage) . '.' . pathinfo($amazonImage,  PATHINFO_EXTENSION);
			$localImageDir  		= 'data/amazon/' . mb_substr($localImageName, 0, 3) . '/' . mb_substr($localImageName, 4, 6) . '/';
			$localImagePath 		= DIR_IMAGE . $localImageDir;
			$fullLocalImagePath 	= $localImagePath . $localImageName;
			$relativeLocalImagePath = $localImageDir . $localImageName;

			if (!file_exists($fullLocalImagePath)){

				try{
					$httpClient = new \GuzzleHttp\Client();
					$httpResponse = $httpClient->request('GET', $amazonImage, ['stream' => true]);	

					if (!is_dir($localImagePath)){
					//	echoLine('RainforestRetriever: директория ' . $localImagePath);
						mkdir($localImagePath, 0775, true);
					}

					file_put_contents($fullLocalImagePath, $httpResponse->getBody()->getContents());					

				} catch (GuzzleHttp\Exception\ClientException $e){
					echoLine('[RainforestRetriever]: Не могу получить картинку ' . $e->getMessage());
					return '';
				}
			}

			return $localImageDir . $localImageName;
		}	

		public function doRequest($params = []){
		
			$data = [
			'api_key' 			=> $this->config->get('config_rainforest_api_key'),
			'amazon_domain' 	=> $this->config->get('config_rainforest_api_domain_1'),
			'customer_zipcode' 	=> $this->config->get('config_rainforest_api_zipcode_1')
			];
			
			$data = array_merge($data, $params);
			$queryString =  http_build_query($data);
		
		
			$ch = curl_init('https://api.rainforestapi.com/request?' . $queryString);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
			curl_setopt($ch, CURLOPT_VERBOSE, false);
			
			$json = curl_exec($ch);		
			curl_close($ch);
			
			$this->setJsonResult(json_decode($json, true));

			return $this;
		}

	}
		