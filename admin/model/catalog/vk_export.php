<?php

class ModelCatalogVkExport extends Model {
    
    public function getAlbum($category_id, $mode) {
        $res = $this->db->query('SELECT vea.*, cd.name AS category FROM ' . DB_PREFIX . 'vk_export_album vea
            LEFT JOIN ' . DB_PREFIX . 'category_description cd ON cd.category_id = vea.category_id AND cd.language_id = ' . (int)$this->config->get('config_language_id') . '
            WHERE vea.category_id = ' . $category_id . '
            AND vea.mode = \'' . $this->db->escape($mode) . '\'
        ');
        return $res;
    }
    
    public function editVkAlbumId($new_vk_album_id, $category_id, $mode) {
        $this->db->query('UPDATE ' . DB_PREFIX . 'vk_export_album 
            SET vk_album_id = \'' . $this->db->escape($new_vk_album_id) . '\'
            WHERE 
            category_id = ' . $category_id . ' AND
            mode = \'' . $this->db->escape($mode) . '\'
        ');
    }
    
    public function getAlbums($data = array()) {
        $sql = 'SELECT * FROM ' . DB_PREFIX . 'vk_export_album';
        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }				

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }	
        
            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }	
        return $this->db->query($sql);
    }
    
    public function getTotalAlbums() {
        $res = $this->db->query('SELECT COUNT(*) AS total FROM ' . DB_PREFIX . 'vk_export_album');
        return $res->row['total'];
    }
    
    public function deleteAllAlbums() {
        $this->db->query('DELETE FROM ' . DB_PREFIX . 'vk_export_album');
        $this->db->query('DELETE FROM ' . DB_PREFIX . 'vk_export_photo WHERE category_id != 0 AND location = \'albums\'');
    }
    
    public function deleteAlbumByKey($category_id, $vk_album_id, $mode) {
        $this->db->query('DELETE FROM ' . DB_PREFIX . 'vk_export_album WHERE 
            category_id = ' . $category_id . ' AND
            vk_album_id = \'' . $this->db->escape($vk_album_id) . '\' AND
            mode = \'' . $this->db->escape($mode) . '\'
        ');
        $this->db->query('DELETE FROM ' . DB_PREFIX . 'vk_export_photo WHERE category_id = ' . $category_id . ' AND location = \'albums\'');
    }
    
    public function getAlbumId($category_id, $mode) {
        $query = $this->db->query("SELECT vk_album_id FROM " . DB_PREFIX . "vk_export_album WHERE category_id = " . $category_id . " AND mode = '" . $mode . "'");
		if ($query->row) {
            return $query->row['vk_album_id'];
        }
    }
    
    public function getVkPhotoId($product_id) {
        $query = $this->db->query("SELECT vk_photo_id FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = " . $product_id . ' AND location = \'albums\'');
		if ($query->row) {
            return $query->row['vk_photo_id'];
        }
    }
    
    public function insertAlbum($category_id, $album_id, $mode) {
        $res = $this->db->query("INSERT IGNORE " . DB_PREFIX . "vk_export_album 
            SET category_id = " . $category_id . ", "
            . " vk_album_id = '" . $this->db->escape($album_id) . "', "
            . " mode = '" . $this->db->escape($mode) . "'"
        );
        return $res;
    }
    
    public function deleteAlbum($vk_album_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "vk_export_album 
            WHERE vk_album_id = '" . $this->db->escape($vk_album_id) . "'"
        );
    }
    
    public function addWallPost($product_id, $post_id, $category_id) {
        $this->db->query("INSERT " . DB_PREFIX . "vk_export_photo 
            SET product_id = " . $product_id . ", 
                vk_photo_id = '" . $this->db->escape($post_id) . "',  
                category_id = '" . $this->db->escape($category_id) . "',
                `date` = NOW(),
                location = 'wall'
                "
        );
    }
    
    public function setProductExport($product_id, $photo_id, $category_id) {
        $this->db->query("INSERT " . DB_PREFIX . "vk_export_photo 
            SET product_id = " . $product_id . ", 
                vk_photo_id = '" . $this->db->escape($photo_id) . "',  
                category_id = '" . $this->db->escape($category_id) . "',
                `date` = NOW(),
                location = 'albums'
                "
        );
    }
    
    public function setProductWallExport($product_id, $photo_id, $category_id) {
        $this->db->query("INSERT " . DB_PREFIX . "vk_export_photo 
            SET product_id = " . $product_id . ", 
                vk_photo_id = '" . $this->db->escape($photo_id) . "',  
                category_id = '" . $this->db->escape($category_id) . "',
                `date` = NOW(),
                location = 'wall'
                "
        );
    }
    
    public function deleteAlbumsExport($product_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = " . $product_id . ' AND location = \'albums\'');
    }
    
    public function deleteAlbumsExportOne($product_id, $photo_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = " . $product_id . ' AND vk_photo_id = \'' . $photo_id . '\' AND location = \'albums\'');
    }
    
    public function deleteWallExport($product_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = " . $product_id . ' AND location = \'wall\'');
    }
    
    public function deleteWallExportOne($product_id, $photo_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = " . $product_id . ' AND vk_photo_id = \'' . $photo_id . '\' AND location = \'wall\'');
    }
    
    public function updateProductExportDate($product_id) {
        $this->db->query("UPDATE " . DB_PREFIX . "vk_export_photo SET `date` = NOW() WHERE product_id = " . $product_id . ' AND location = \'albums\'');
    }
    
    public function getFoundRows() {
        $query = $this->db->query("SELECT FOUND_ROWS() as found_rows");
		if ($query->row) {
            return $query->row['found_rows'];
        }
    }
    
    public function getProducts($data = array()) {
		if ($data) {
			$sql = "SELECT SQL_CALC_FOUND_ROWS p.*, pd.*,
                (SELECT COUNT(*) FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = p.product_id AND location = 'albums') AS export_albums,
                (SELECT COUNT(*) FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = p.product_id AND location = 'wall') AS export_wall
                FROM " . DB_PREFIX . "product p
                LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)
                LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON (p.product_id = ptc.product_id)
                WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'"; 
		
			if (isset($data['filter_name']) && !is_null($data['filter_name'])) {
				$sql .= " AND LCASE(pd.name) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%'";
			}

			if (isset($data['filter_model']) && !is_null($data['filter_model'])) {
				$sql .= " AND LCASE(p.model) LIKE '%" . $this->db->escape(strtolower($data['filter_model'])) . "%'";
			}
			
			if (isset($data['filter_price']) && !is_null($data['filter_price'])) {
				$sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
			}
			
			if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
				$sql .= " AND p.quantity = '" . $this->db->escape($data['filter_quantity']) . "'";
			}
			
			if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
				$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
			}
			
			if (isset($data['filter_date_added']) && !is_null($data['filter_date_added'])) {
                $date = explode('-', $data['filter_date_added']);
				$sql .= " AND p.date_added LIKE '" . $date[2] . "-" . $date[1] . "-" . $date[0] . "%'";
			}
			
			if (isset($data['filter_category']) && !is_null($data['filter_category'])) {
				$sql .= " AND ptc.category_id = '" . (int)$data['filter_category'] . "'";
			}
            
			if (isset($data['filter_export_albums']) && is_numeric($data['filter_export_albums']) && $data['filter_export_albums']) {
				$sql .= " AND (SELECT COUNT(*) FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = p.product_id AND location = 'albums') >= 1";
			}
            else if (is_numeric($data['filter_export_albums']) && !$data['filter_export_albums']) {
                $sql .= " AND (SELECT COUNT(*) FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = p.product_id AND location = 'albums') = 0";
            }
            
			if (isset($data['filter_export_wall']) && is_numeric($data['filter_export_wall']) && $data['filter_export_wall']) {
				$sql .= " AND (SELECT COUNT(*) FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = p.product_id AND location = 'wall') >= 1";
			}
            else if (is_numeric($data['filter_export_wall']) && !$data['filter_export_wall']) {
                $sql .= " AND (SELECT COUNT(*) FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = p.product_id AND location = 'wall') = 0";
            }
            
            $sql .= ' GROUP BY p.product_id';
            
			$sort_data = array(
				'pd.name',
				'p.model',
				'p.price',
				'p.quantity',
				'p.status',
				'p.date_added',
				'p.albums_export',
				'p.wall_export',
				'p.sort_order'
			);	
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY pd.name";	
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
		
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}				

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	
            
			$query = $this->db->query($sql);
		
			return $query->rows;
		} else {
			$product_data = $this->cache->get('product.' . $this->config->get('config_language_id'));
		
			if (!$product_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY pd.name ASC");
	
				$product_data = $query->rows;
			
				$this->cache->set('product.' . $this->config->get('config_language_id'), $product_data);
			}	
	
			return $product_data;
		}
	}
    
    // поиск товаров для автоэкспорта
    public function getProductsAutoexport() {
        $sql = "SELECT p.*, pd.*, ptc.category_id
            FROM " . DB_PREFIX . "product p
            JOIN " . DB_PREFIX . "product_to_category ptc ON (p.product_id = ptc.product_id)
            LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)
            WHERE 
            ptc.category_id IN (" . implode(',', $this->config->get('vk_export_autoexport_category')) . ")
            AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'"; 
    
        // не экспортированные ранее
        $sql .= " AND (SELECT COUNT(*) FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = p.product_id AND location = 'albums') = 0";
        
        if ($this->config->get('vk_export_only_instock')) {
            $sql .= ' AND p.`quantity` > 0';
        }
        
        if ($this->config->get('vk_export_only_enabled')) {
            $sql .= ' AND p.`status` = 1';
        }
         
        // только акционные товары
        if ($this->config->get('vk_export_albums_only_specials')) {
            $sql .= ' AND (SELECT COUNT(*) from ' . DB_PREFIX . 'product_special WHERE product_id = p.product_id)';
        }
               
        $sql .= ' GROUP BY p.product_id';
        
        $sql .= " ORDER BY pd.name";	
        
        $sql .= " LIMIT " . (int)$this->config->get('vk_export_num_products_for_cron');
        
        $query = $this->db->query($sql);
    
        return $query->rows;
	}
    
    // поиск товаров для автообновления
    public function getProductsToAutoupdate() {
        $sql = "SELECT p.*, pd.*, vep.vk_photo_id
            FROM " . DB_PREFIX . "vk_export_photo vep
            JOIN " . DB_PREFIX . "product p ON p.product_id = vep.product_id
            LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)
            WHERE 
            vep.location = 'albums'
            AND p.date_modified > vep.date AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'"; 
                
        $sql .= " ORDER BY pd.name";	
        
        //$sql .= " LIMIT " . (int)$this->config->get('vk_export_num_products_for_cron');
        
        $query = $this->db->query($sql);
    
        return $query->rows;
	}
    
    // поиск товаров для автоэкспорта на стену
    public function getProductsAutoWallPost() {
        $sql = "SELECT p.*, pd.*, ptc.category_id,
            (SELECT category_id FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = p.product_id AND location = 'albums' ORDER BY date DESC LIMIT 1) AS vkep_category_id
            FROM " . DB_PREFIX . "product p
            JOIN " . DB_PREFIX . "product_to_category ptc ON (p.product_id = ptc.product_id)
            LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)
            WHERE
            ptc.category_id IN (" . implode(',', $this->config->get('vk_export_autoexport_category_wall')) . ")
            AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'"; 
            
        // не экспортированные ранее
        if ($this->config->get('vk_export_wall_unique')) {
            $sql .= " AND (SELECT COUNT(*) FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = p.product_id AND location = 'wall') = 0";
        }
    
        if ($this->config->get('vk_export_only_instock')) {
            $sql .= ' AND p.`quantity` > 0';
        }
        
        if ($this->config->get('vk_export_only_enabled')) {
            $sql .= ' AND p.`status` = 1';
        }
        
        // только акционные товары
        if ($this->config->get('vk_export_wall_only_specials')) {
            $sql .= ' AND (SELECT COUNT(*) from ' . DB_PREFIX . 'product_special WHERE product_id = p.product_id)';
        }
                
        $sql .= ' GROUP BY p.product_id';
        
        $sql .= " ORDER BY RAND()";	
        
        $sql .= " LIMIT " . (int)$this->config->get('vk_export_cron_wallpost_max');
        
        $query = $this->db->query($sql);
    
        return $query->rows;
	}
    
    public function getTotalProducts($data = array()) {
		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total,
            (SELECT COUNT(*) FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = p.product_id AND location = 'wall') AS export_wall
            FROM " . DB_PREFIX . "product p 
            LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)
            LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON (p.product_id = ptc.product_id)
        ";

		if (!empty($data['filter_category_id'])) {
			$sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";			
		}
		 
		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		 			
		if (!empty($data['filter_name'])) {
			$sql .= " AND LCASE(pd.name) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
		}

		if (!empty($data['filter_model'])) {
			$sql .= " AND LCASE(p.model) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_model'])) . "%'";
		}
		
		if (!empty($data['filter_price'])) {
			$sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
		}
		
		if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
			$sql .= " AND p.quantity = '" . $this->db->escape($data['filter_quantity']) . "'";
		}
		
		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_category']) && !is_null($data['filter_category'])) {
            $sql .= " AND ptc.category_id = '" . (int)$data['filter_category'] . "'";
        }
        
        if (isset($data['filter_export_albums']) && is_numeric($data['filter_export_albums']) && $data['filter_export_albums']) {
            $sql .= " AND export_albums >= 1";
        }
        else if (is_numeric($data['filter_export_albums']) && !$data['filter_export_albums']) {
            $sql .= " AND export_albums = 0";
        }
        
        if (isset($data['filter_export_wall']) && is_numeric($data['filter_export_wall']) && $data['filter_export_wall']) {
            $sql .= " AND export_wall >= 1";
        }
        else if (is_numeric($data['filter_export_wall']) && !$data['filter_export_wall']) {
            $sql .= " AND export_wall = 0";
        }
		
		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
    
    public function getProductOptionValueName($option_value_id) {
        $query = $this->db->query("SELECT name FROM " . DB_PREFIX . "option_value_description 
            WHERE option_value_id = " . $option_value_id . " AND language_id = '" . (int)$this->config->get('config_language_id') . "'"
        );
		if ($query->row) {
            return $query->row['name'];
        }
    }
    
    public function getProduct($product_id) {
		$query = $this->db->query("SELECT p.*, pd.name,
            (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$product_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "') AS keyword,
            (SELECT ss.name FROM " . DB_PREFIX . "stock_status ss WHERE ss.stock_status_id = p.stock_status_id AND ss.language_id = '" . (int)$this->config->get('config_language_id') . "') AS stock_status,
            m.name AS manufacturer
            FROM " . DB_PREFIX . "product p 
            LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) 
            LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id)
            WHERE 
            p.product_id = '" . (int)$product_id . "' 
            AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
            ");
				
		return $query->row;
	}
    
    public function getExport($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "vk_export_photo WHERE product_id = " . (int)$product_id . ' ORDER BY date DESC');
				
		return $query->rows;
	}
    
    public function getAlbumsExport($product_id) {
		$query = $this->db->query("SELECT vkep.*, cd.name AS category FROM " . DB_PREFIX . "vk_export_photo AS vkep
			LEFT JOIN " . DB_PREFIX . "category_description cd ON cd.category_id = vkep.category_id AND cd.language_id = " . (int)$this->config->get('config_language_id') . "
			WHERE vkep.location = 'albums' AND vkep.product_id = " . (int)$product_id . ' ORDER BY vkep.date DESC');
				
		return $query->rows;
	}
    
    public function getWallExport($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "vk_export_photo WHERE location = 'wall' AND product_id = " . (int)$product_id . ' ORDER BY date DESC');
				
		return $query->rows;
	}
    
    
    /**
     * generate select box
     * 
     * @param   array   source array containing selected value
     * @param   string  name of form variable 
     * @param   array   select options
     * @param   string  key of value in source array
     * @param   array   extra data to set
     * @return  string
     */
    public function createSelect($source, $name, $options, $key = false, $extra = false, $default = false) {
        if (!$key) {
            $key = $name;
        }
        $output = "<select name=\"$name\" " . ((isset($extra['attributes'])) ? $extra['attributes'] : '') . ">\n";
        $current_val = (isset($source[$key])) ? $source[$key] : ($default ? $default : false);
        foreach ($options as $opt_val => $opt_name) {
            $output .= "<option value=\"$opt_val\"";
            if ($current_val == $opt_val) {
                $output .= ' selected';
            }
            $output .= ">$opt_name</option>\n";
        }
        $output .= "</select>\n";
        return $output;
    }
    
    public function getAllCategories() {
		$category_data = $this->cache->get('category.all.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));

		if (!$category_data || !is_array($category_data)) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  ORDER BY c.parent_id, c.sort_order, cd.name");

			$category_data = array();
			foreach ($query->rows as $row) {
				$category_data[$row['parent_id']][$row['category_id']] = $row;
			}

			$this->cache->set('category.all.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $category_data);
		}

		return $category_data;
	}
    
    public function getCategoryPath($category_id) {
		$query = $this->db->query("SELECT name, parent_id FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		
		if ($query->row['parent_id']) {
			return $this->getCategoryPath($query->row['parent_id'], $this->config->get('config_language_id')) . $this->language->get('text_separator') . $query->row['name'];
		} else {
			return $query->row['name'];
		}
	}
	
}

?>
