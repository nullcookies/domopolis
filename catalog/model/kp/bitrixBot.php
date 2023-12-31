<?
	class ModelKpBitrixBot extends Model {
		
		public function sendMessage($message = '', $attach = array(), $dialog_id = false){

			if (!$this->config->get('config_bitrix_bot_enable')){
				return false;
			}
			
			if (!$dialog_id){
				$dialog_id = $this->request->request['data']['PARAMS']['DIALOG_ID'];
				$_auth = $this->request->request["auth"];
				} else {
				$_auth = array();
			}
			
			$result = $this->Bitrix24->restCommand(
			'imbot.message.add', 
			array(
			"DIALOG_ID" => $dialog_id,
			"MESSAGE"   => $message,
			"ATTACH"    => array_merge(
			$attach
			)
			), 
			$_auth);
			
			return $result;
			
		}

		
		public function sendMessageToUser($message = '', $attach = array(), $user_id = false){

			if (!$this->config->get('config_bitrix_bot_enable')){
				return false;
			}
			
			$result = $this->Bitrix24->restCommand(
			'imbot.message.add', 
			array(
			"DIALOG_ID" => $user_id,
			"MESSAGE"   => $message,
			"ATTACH"    => array_merge(
			$attach
			)
			), 
			array());
			
			return $result;
		}
		
		public function sendNotificationToUser($message = '', $attach = array() , $user_id = false){

			if (!$this->config->get('config_bitrix_bot_enable')){
				return false;
			}
			
			$result = $this->Bitrix24->restCommand(
			'im.notify.system.add', 
			array(
			'USER_ID' => $user_id,
			"MESSAGE"   => $message,
			"ATTACH"    => array_merge(
			$attach
			)
			), 
			array());
			
		}
		
		
		public function answerCommand($message = '', $attach = array(), $command_id = false, $message_id = false){

			if (!$this->config->get('config_bitrix_bot_enable')){
				return false;
			}
			
			
			$result = $this->Bitrix24->restCommand('imbot.command.answer', Array(
			"COMMAND_ID" => $command_id,
			"MESSAGE_ID" => $message_id,
			"MESSAGE" => $message,
			"ATTACH" => array_merge(
			$attach
			)
			), $this->request->request["auth"]);
			
		}
		
		public function assignBitrixUserID($bitrix_user){
			
			$this->db->query("UPDATE user SET bitrix_id = '" . (int)$bitrix_user['ID'] . "' WHERE 
			TRIM(firstname) LIKE '" . $this->db->escape(trim($bitrix_user['FIRST_NAME'])) . "' 
			AND TRIM(lastname) = '" . trim($bitrix_user['LAST_NAME']) . "'");
			
		}
	}			