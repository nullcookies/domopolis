<?php
	class ModelSettingStore extends Model {
		public function addStore($data) {
			$this->db->query("INSERT INTO store SET name = '" . $this->db->escape($data['config_name']) . "', `url` = '" . $this->db->escape($data['config_url']) . "', `ssl` = '" . $this->db->escape($data['config_ssl']) . "'");
			
			$this->cache->delete('store');
			
			return $this->db->getLastId();
		}
		
		public function editStore($store_id, $data) {
			$this->db->query("UPDATE store SET name = '" . $this->db->escape($data['config_name']) . "', `url` = '" . $this->db->escape($data['config_url']) . "', `ssl` = '" . $this->db->escape($data['config_ssl']) . "' WHERE store_id = '" . (int)$store_id . "'");
			
			$this->cache->delete('store');
		}
		
		public function deleteStore($store_id) {
			
			$this->db->query("DELETE FROM store WHERE store_id = '" . (int)$store_id . "'");
			$this->db->query("DELETE FROM product_to_store WHERE store_id = '" . (int)$store_id . "'");
			$this->db->query("DELETE FROM category_to_store WHERE store_id = '" . (int)$store_id . "'");
			$this->db->query("DELETE FROM collection_to_store WHERE store_id = '" . (int)$store_id . "'");
			$this->db->query("DELETE FROM information_to_store WHERE store_id = '" . (int)$store_id . "'");
			$this->db->query("DELETE FROM information_attribute_to_store WHERE store_id = '" . (int)$store_id . "'");
			$this->db->query("DELETE FROM manufacturer_to_store WHERE store_id = '" . (int)$store_id . "'");
			$this->db->query("DELETE FROM set_to_store WHERE store_id = '" . (int)$store_id . "'");
			$this->db->query("DELETE FROM setting WHERE store_id = '" . (int)$store_id . "'");
			
			$this->cache->delete('store');
			
		}
		
		public function getStore($store_id) {
			$query = $this->db->query("SELECT DISTINCT * FROM store WHERE store_id = '" . (int)$store_id . "'");
			
			return $query->row;
		}
		
		public function getStores($data = array()) {
			$this->load->model('setting/setting');
			
			if ($this->user->getIsManager() && $this->user->getManagerStores()){
				$stores = $this->user->getManagerStores();
				
				$query = $this->db->query("SELECT * FROM store WHERE store_id IN (" . implode(',', $stores) . ") ORDER BY store_id ASC");
				$store_data = $query->rows;
				
				if (in_array(0, $stores)){
					array_unshift($store_data, array('store_id' => 0, 'name' => $this->config->get('config_name')));
				}
				
				} else {
				
				$query = $this->db->query("SELECT * FROM store ORDER BY store_id ASC");
				
				if (!empty($data['exclude_de'])){
					$query = $this->db->query("SELECT * FROM store WHERE store_id <> 18 ORDER BY store_id ASC");
				}
				
				$store_data = $query->rows;
				
				array_unshift($store_data, array('store_id' => 0, 'name' => $this->config->get('config_name')));
			}
			
			foreach ($store_data as &$store){
				$store['name'] = trim(str_replace($this->config->get('config_owner') . ' | ', '', $store['name']));
				$store['url'] = $this->model_setting_setting->getKeySettingValue('config', 'config_url', $store['store_id']);
				$store['language'] = $this->model_setting_setting->getKeySettingValue('config', 'config_language', $store['store_id']);
			}
			
			return $store_data;
		}
		
		public function getTotalStores() {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM store");
			
			return $query->row['total'];
		}	
		
		public function getTotalStoresByLayoutId($layout_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_layout_id' AND `value` = '" . (int)$layout_id . "' AND store_id != '0'");
			
			return $query->row['total'];		
		}
		
		public function getTotalStoresByLanguage($language) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_language' AND `value` = '" . $this->db->escape($language) . "' AND store_id != '0'");
			
			return $query->row['total'];		
			}
			
			public function getTotalStoresByCurrency($currency) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_currency' AND `value` = '" . $this->db->escape($currency) . "' AND store_id != '0'");
			
			return $query->row['total'];		
		}
		
		public function getTotalStoresByCountryId($country_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_country_id' AND `value` = '" . (int)$country_id . "' AND store_id != '0'");
			
			return $query->row['total'];		
		}
		
		public function getTotalStoresByZoneId($zone_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_zone_id' AND `value` = '" . (int)$zone_id . "' AND store_id != '0'");
			
			return $query->row['total'];		
		}
		
		public function getTotalStoresByCustomerGroupId($customer_group_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_customer_group_id' AND `value` = '" . (int)$customer_group_id . "' AND store_id != '0'");
			
			return $query->row['total'];		
		}	
		
		public function getTotalStoresByInformationId($information_id) {
			$account_query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_account_id' AND `value` = '" . (int)$information_id . "' AND store_id != '0'");
			
			$checkout_query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_checkout_id' AND `value` = '" . (int)$information_id . "' AND store_id != '0'");
			
			return ($account_query->row['total'] + $checkout_query->row['total']);
		}
		
		public function getTotalStoresByOrderStatusId($order_status_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM setting WHERE `key` = 'config_order_status_id' AND `value` = '" . (int)$order_status_id . "' AND store_id != '0'");
			
			return $query->row['total'];		
		}	
	}