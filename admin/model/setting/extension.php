<?php
	class ModelSettingExtension extends Model {
		public function getInstalled($type) {
			$extension_data = array();
			
			$query = $this->db->query("SELECT * FROM extension WHERE `type` = '" . $this->db->escape($type) . "'");
			
			foreach ($query->rows as $result) {
				$extension_data[] = $result['code'];
			}
			
			return $extension_data;
		}
		
		public function install($type, $code) {
			$this->db->query("INSERT INTO extension SET `type` = '" . $this->db->escape($type) . "', `code` = '" . $this->db->escape($code) . "'");
		}
		
		public function uninstall($type, $code) {
			$this->db->query("DELETE FROM extension WHERE `type` = '" . $this->db->escape($type) . "' AND `code` = '" . $this->db->escape($code) . "'");
		}
		
		public function sql($sql) {
			$query = '';
			
			foreach($lines as $line) {
				if ($line && (substr($line, 0, 2) != '--') && (substr($line, 0, 1) != '#')) {
					$query .= $line;
					
					if (preg_match('/;\s*$/', $line)) {
						$query = str_replace("DROP TABLE IF EXISTS `oc_", "DROP TABLE IF EXISTS `" . $data['db_prefix'], $query);
						$query = str_replace("CREATE TABLE `oc_", "CREATE TABLE `" . $data['db_prefix'], $query);
						$query = str_replace("INSERT INTO `oc_", "INSERT INTO `" . $data['db_prefix'], $query);
						
						$result = mysql_query($query, $connection); 
						
						if (!$result) {
							die(mysql_error());
						}
						
						$query = '';
					}
				}
			}		
		}
		
		function getExtensions($type) {
			$query = $this->db->query("SELECT * FROM extension WHERE `type` = '" . $this->db->escape($type) . "'");
			
			return $query->rows;
		}
	}	