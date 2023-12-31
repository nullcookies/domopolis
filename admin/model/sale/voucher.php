<?php
class ModelSaleVoucher extends Model {
	public function addVoucher($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "voucher SET code = '" . $this->db->escape($data['code']) . "', curr = '" . $this->db->escape($data['curr']) . "', from_name = '" . $this->db->escape($data['from_name']) . "', from_email = '" . $this->db->escape($data['from_email']) . "', to_name = '" . $this->db->escape($data['to_name']) . "', to_email = '" . $this->db->escape($data['to_email']) . "', voucher_theme_id = '" . (int)$data['voucher_theme_id'] . "', message = '" . $this->db->escape($data['message']) . "', amount = '" . (float)$data['amount'] . "', status = '" . (int)$data['status'] . "', date_added = NOW()");
	}

	public function editVoucher($voucher_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "voucher SET code = '" . $this->db->escape($data['code']) . "', curr = '" . $this->db->escape($data['curr']) . "', from_name = '" . $this->db->escape($data['from_name']) . "', from_email = '" . $this->db->escape($data['from_email']) . "', to_name = '" . $this->db->escape($data['to_name']) . "', to_email = '" . $this->db->escape($data['to_email']) . "', voucher_theme_id = '" . (int)$data['voucher_theme_id'] . "', message = '" . $this->db->escape($data['message']) . "', amount = '" . (float)$data['amount'] . "', status = '" . (int)$data['status'] . "' WHERE voucher_id = '" . (int)$voucher_id . "'");
	}

	public function deleteVoucher($voucher_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "voucher WHERE voucher_id = '" . (int)$voucher_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "voucher_history WHERE voucher_id = '" . (int)$voucher_id . "'");
	}

	public function getVoucher($voucher_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "voucher WHERE voucher_id = '" . (int)$voucher_id . "'");

		return $query->row;
	}

	public function getVoucherByCode($code) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "voucher WHERE code = '" . $this->db->escape($code) . "'");

		return $query->row;
	}

	public function getVouchers($data = array()) {
		$sql = "SELECT v.voucher_id, v.code, v.from_name, v.from_email, v.to_name, v.to_email, (SELECT vtd.name FROM " . DB_PREFIX . "voucher_theme_description vtd WHERE vtd.voucher_theme_id = v.voucher_theme_id AND vtd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS theme, v.amount, v.curr, v.status, v.date_added FROM " . DB_PREFIX . "voucher v";

			$sort_data = array(
				'v.code',
				'v.from_name',
				'v.from_email',
				'v.to_name',
				'v.to_email',
				'v.theme',
				'v.amount',
				'v.status',
				'v.date_added'
			);	

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY v.date_added";	
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
		}

		public function sendVoucher($voucher_id) {
			$this->load->model('setting/setting');

			$voucher_info = $this->getVoucher($voucher_id);

			if ($voucher_info) {
				if ($voucher_info['order_id']) {
					$order_id = $voucher_info['order_id'];
				} else {
					$order_id = 0;
				}

				$this->load->model('sale/order');

				$order_info = $this->model_sale_order->getOrder($order_id);

			// If voucher belongs to an order
				if ($order_info) {
					$this->load->model('localisation/language');

					$language = new Language($order_info['language_directory']);
					$language->load($order_info['language_filename']);	
					$language->load('mail/voucher');

				// HTML Mail
					$template = new EmailTemplate($this->request, $this->registry);
					$template->addData($voucher_info);				

					$template->data['title'] = sprintf($language->get('text_subject'), $voucher_info['from_name']);

					$template->data['text_greeting'] = sprintf($language->get('text_greeting'), $this->currency->format($voucher_info['amount'], $order_info['currency_code'], $order_info['currency_value']));
					$template->data['text_from'] = sprintf($language->get('text_from'), $voucher_info['from_name']);
					$template->data['text_message'] = $language->get('text_message');
					$template->data['text_redeem'] = sprintf($language->get('text_redeem'), $voucher_info['code']);
					$template->data['text_footer'] = $language->get('text_footer');	

					$this->load->model('sale/voucher_theme');

					$voucher_theme_info = $this->model_sale_voucher_theme->getVoucherTheme($voucher_info['voucher_theme_id']);

					if ($voucher_info) {
						$template->data['image'] = HTTP_CATALOG . 'image/' . $voucher_theme_info['image'];
					} else {
						$template->data['image'] = '';
					}

					$template->data['store_name'] 	= $this->model_setting_setting->getKeySettingValue('config', 'config_name', (int)$order_info['store_id']);
					$template->data['store_url'] 	= $order_info['store_url'];
					$template->data['message'] 		= nl2br($voucher_info['message']);

					$mail = new Mail($this->registry);  		
					$mail->setTo($voucher_info['to_email']);
					$mail->setFrom($this->model_setting_setting->getKeySettingValue('config', 'config_email', (int)$order_info['store_id']));
					$mail->setSender($this->model_setting_setting->getKeySettingValue('config', 'config_name', (int)$order_info['store_id']));
					$mail->setSubject(html_entity_decode(sprintf($language->get('text_subject'), $voucher_info['from_name']), ENT_QUOTES, 'UTF-8'));
				//$mail->setHtml($template->fetch('mail/voucher.tpl'));				

					list($width, $height) = getimagesize(DIR_IMAGE . $voucher_theme_info['image']);
					$template->data['image_width'] = $width;
					$template->data['image_height'] = $height;
					
					$template->load(array(
						'key' => 'admin.voucher',
						'store_id' => $order_info['store_id'],
						'language_id' => $order_info['language_id']
					));
					
					$mail = $template->hook($mail);
					
					$mail->send();

			// If voucher does not belong to an order				
				}  else {
					$this->language->load('mail/voucher');

					$template = new Template();		

					$template->data['title'] = sprintf($this->language->get('text_subject'), $voucher_info['from_name']);

					$template->data['text_greeting'] = sprintf($this->language->get('text_greeting'), $this->currency->format($voucher_info['amount'], $order_info['currency_code'], $order_info['currency_value']));
					$template->data['text_from'] = sprintf($this->language->get('text_from'), $voucher_info['from_name']);
					$template->data['text_message'] = $this->language->get('text_message');
					$template->data['text_redeem'] = sprintf($this->language->get('text_redeem'), $voucher_info['code']);
					$template->data['text_footer'] = $this->language->get('text_footer');					

					$this->load->model('sale/voucher_theme');

					$voucher_theme_info = $this->model_sale_voucher_theme->getVoucherTheme($voucher_info['voucher_theme_id']);

					if ($voucher_info) {
						$template->data['image'] = HTTP_CATALOG . 'image/' . $voucher_theme_info['image'];
					} else {
						$template->data['image'] = '';
					}

					$template->data['store_name'] = $this->config->get('config_name');
					$template->data['store_url'] = $this->config->get('config_main_redirect_domain');
					$template->data['message'] = nl2br($voucher_info['message']);

					$mail = new Mail($this->registry); 		
					$mail->setTo($voucher_info['to_email']);
					$mail->setFrom($this->config->get('config_email'));
					$mail->setSender($this->config->get('config_mail_trigger_name_from'));
					$mail->setSubject(html_entity_decode(sprintf($this->language->get('text_subject'), $voucher_info['from_name']), ENT_QUOTES, 'UTF-8'));
					$mail->setHtml($template->fetch('mail/voucher.tpl'));
					$mail->send();				
				}
			}
		}

		public function getTotalVouchers() {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "voucher");

			return $query->row['total'];
		}
		
		public function getTotalVoucherFromOrderTotal($code) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_total WHERE title LIKE ('%" . $this->db->escape($code) . "%') AND value_national <> 0 AND order_id IN (SELECT order_id FROM `" . DB_PREFIX . "order` WHERE order_status_id > 0)");

			return $query->row['total'];
		}	

		public function getTotalVouchersByVoucherThemeId($voucher_theme_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "voucher WHERE voucher_theme_id = '" . (int)$voucher_theme_id . "'");

			return $query->row['total'];
		}	

		public function getVoucherHistories($voucher_id, $start = 0, $limit = 10) {
			if ($start < 0) {
				$start = 0;
			}

			if ($limit < 1) {
				$limit = 10;
			}	

			$query = $this->db->query("SELECT vh.order_id, CONCAT(o.firstname, ' ', o.lastname) AS customer, vh.amount, vh.date_added FROM " . DB_PREFIX . "voucher_history vh LEFT JOIN `" . DB_PREFIX . "order` o ON (vh.order_id = o.order_id) WHERE vh.voucher_id = '" . (int)$voucher_id . "' ORDER BY vh.date_added ASC LIMIT " . (int)$start . "," . (int)$limit);

			return $query->rows;
		}

		public function getTotalVoucherHistories($voucher_id) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "voucher_history WHERE voucher_id = '" . (int)$voucher_id . "'");

			return $query->row['total'];
		}			
	}