<?php  
class ControllerModuleSelectedCategory extends Controller {
	protected function index($setting) {

		$out = $this->cache->get($this->registry->createCacheQueryString(__METHOD__, $setting));

		if ($out) {		

			$this->setCachedOutput($out);
			
		} else {

			$this->language->load('module/category');
			$this->data['text_view_all'] = $this->language->get('text_view_all');

			foreach ($this->language->loadRetranslate('product/single') as $translationСode => $translationText){
				$this->data[$translationСode] = $translationText;
			}

			$this->data['heading_title'] = $this->language->get('heading_title');

			$this->load->model('catalog/category');
			$this->load->model('catalog/product');

			$this->data['categories'] = array();

			if ($setting['type'] == 'viewed'){
				$categories = $this->model_catalog_category->getMostViewedCategories($setting['category_amount']);
			} elseif ($setting['type'] == 'bought'){
				$categories = $this->model_catalog_category->getMostBoughtCategories($setting['category_amount']);
			}
			

			foreach ($categories as $category){

				$filter_data = [								
					'sort'                => 'p.viewed',
					'filter_only_viewed'  => (int)$setting['product_threshold'], 
					'filter_category_id'  => $category['category_id'],
					'filter_sub_category' => true,
					'filter_not_bad' 	  => true,
					'order'               => 'DESC',
					'start'               => 0,
					'limit'               => $setting['product_amount']
				];

				$products = $this->model_catalog_product->getProducts($filter_data);

				$this->data['categories'][] = [
					'href' 		=> $this->url->link('product/category', 'path=' . $category['category_id']),
					'name' 		=> $category['name'],
					'products' 	=> $this->model_catalog_product->prepareProductToArray($products)
				];
			}

			$this->template = 'module/selected_categories.tpl';

			$out = $this->render();
			$this->cache->set($this->registry->createCacheQueryString(__METHOD__, $setting), $out);			
		}
	}
}