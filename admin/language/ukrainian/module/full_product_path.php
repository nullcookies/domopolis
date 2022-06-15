<?php
// English   Full Product Path  		Author: Sirius Dev
// Heading
$_['heading_title']      = '<img src="view/full_product_path/img/icon.png" style="vertical-align:top;padding-right:4px"/> Product Path Manager';
$_['module_title']		  = '<span>Product </span> Path Manager';

// Text
$_['text_fpp_mode']   = 'Product path mode:';
$_['text_fpp_mode_0']   = 'Direct link';
$_['text_fpp_mode_1']   = 'Shortest path';
$_['text_fpp_mode_2']   = 'Largest path';
$_['text_fpp_mode_3']   = 'Manufacturer path';

$_['text_fpp_bc_mode'] = 'Breadcrumbs mode:';
$_['text_fpp_breadcrumbs_fix'] = 'Breadcrumbs generator:';
$_['text_fpp_breadcrumbs_0']   = 'Default';
$_['text_fpp_breadcrumbs_1']   = 'Generate if empty';
$_['text_fpp_breadcrumbs_2']   = 'Always generate';

$_['text_fpp_mode_help']   = '<span class="help"><b>Direct link:</b> get direct link to product, no category included (ex: /product_name)<br/>
																		  <b>Shortest path:</b> get shortest path by default, can be altered by banned categories (ex: /category/product_name)<br/>
																		  <b>Largest path:</b> get largest path by default, can be altered by banned categories (ex: /category/sub-category/product_name)<br/>
																		  <b>Manufacturer path:</b> get manufacturer path instead of categories (ex: /manufacturer/product_name)</span>';
$_['text_fpp_breadcrumbs_help']   = '<span class="help"><b>Default:</b> default opencart behaviour: will display breadcrumbs coming from categories<br/>
																		  <b>Generate if empty:</b> generate breadcrumbs only when it is not already available, so category breadcrumb is preserved (recommended)<br/>
																		  <b>Always generate:</b> overwrite also the category breadcrumbs, so the only breadcrumbs you will get is the one generated by the module<br/></span>';
$_['text_fpp_bypasscat'] = 'Rewrite product path in categories:';
$_['text_fpp_bypasscat_help'] = '<span class="help">If disabled, the product link from categories remains the same in order to preserve normal behavior and breadcrumbs.<br/>If enabled, the product link from categories is overwritten with path generated by the module.<br>In any case canonical link is updated with good value so google will only see the url generated by the module for a given product.</span>';
$_['text_fpp_directcat'] = 'Direct link for categories:';
$_['text_fpp_directcat_help'] = '<span class="help">Enable to have direct url of a category without the parent, breadcrumbs will be preserved</span>';
$_['text_fpp_homelink'] = 'Rewrite home link:';
$_['text_fpp_homelink_help'] = '<span class="help">Set homepage link to mystore.com instead of mystore.com/index.php?route=common/home</span>';
$_['text_fpp_depth']   		= 'Max levels:';
$_['text_fpp_depth_help']   = '<span class="help">Maximum category depth you want to display, for example if you have a product in /cat/subcat/subcat/product and set this option to 2 the link will become /cat/subcat/product<br/>This option works in largest and shortest path modes</span>';
$_['text_fpp_unlimited']   = 'Unlimited';
$_['entry_category']  	 = 'Banned categories:<span class="help">Choose the categories that will never be displayed in case of multiple paths</span>';

$_['text_module']        = 'Modules';
$_['text_success']       = 'Success: You have modified the module!';

// Error
$_['error_permission'] 	 = 'Warning: You do not have permission to modify this module';
?>