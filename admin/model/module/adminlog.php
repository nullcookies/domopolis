<?php
class ModelModuleAdminLog extends Model {

	public function uninstall() {
		$this->db->query("DROP TABLE `adminlog`");
	}

	public function install() {
		$query = $this->db->query("CREATE TABLE `adminlog` (  `log_id` int(11) NOT NULL AUTO_INCREMENT,
																				`user_id` int(11) NOT NULL,
																				`user_name` varchar(20) NOT NULL,
																				`action` varchar(50) NOT NULL,
																				`allowed` tinyint(1) NOT NULL,
																				`url` varchar(200) NOT NULL,
																				`ip` varchar(40) NOT NULL,
																				`date` datetime NOT NULL,
																				PRIMARY KEY (`log_id`)
																			)");
	}

	public function getDataBaseLog($data = array()) {
		if($data){
			$sql = "SELECT * FROM adminlog WHERE action <> 'access'";
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY date";
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " ASC";
			} else {
				$sql .= " DESC";
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
		}else{
			return false;
		}
	}

	public function getTotalDataBaseLog($data = array()) {
		$query = $this->db->query("SELECT COUNT(log_id) AS total FROM adminlog WHERE action <> 'access'");
		return $query->row['total'];
	}

	public function clearDataBaseLog($id, $username) {	
		// $this->db->query("DELETE FROM adminlog");
		$this->db->query("INSERT INTO adminlog SET user_id = '" . (int)$id . "', `user_name` = '" . $username . "', `action` = 'clear log', `allowed` = '1', `url` = '".$this->request->server['REQUEST_URI']."', `ip` = '" . $this->request->server['REMOTE_ADDR'] . "', date = NOW()");
		return true;
	}

	public function deleteEntry($id) {
		//$this->db->query("DELETE FROM adminlog WHERE log_id = ".$id);
		return true;
	}

	public function deleteEntryLog($id, $username, $amount) {
		$this->db->query("INSERT INTO adminlog SET user_id = '" . (int)$id . "', `user_name` = '" . $username . "', `action` = 'clear ".$amount." entries', `allowed` = '1', `url` = '".$this->request->server['REQUEST_URI']."', `ip` = '" . $this->request->server['REMOTE_ADDR'] . "', date = NOW()");
		return true;
	}

}