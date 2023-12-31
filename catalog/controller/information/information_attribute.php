<?php
class ControllerInformationInformationAttribute extends Controller {
    public function index() {

        $this->language->load('information/information_attribute');

        $this->load->model('catalog/information_attribute');

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home'),
            'separator' => false
        );

        if (isset($this->request->get['information_attribute_id'])) {
            $information_id = (int)$this->request->get['information_attribute_id'];
        } else {
            $information_id = 0;
        }

        $information_info = $this->model_catalog_information_attribute->getInformation($information_id);

        if ($information_info) {
            $this->document->setKeywords($information_info['meta_keyword']);
            $this->document->setDescription($information_info['meta_description']);

            ($information_info['seo_title'] == '')?$this->document->setTitle($information_info['title']):$this->document->setTitle($information_info['seo_title']);

            $this->data['breadcrumbs'][] = array(
                'text'      => $information_info['title'],
                'href'      => $this->url->link('information/information_attribute', 'information_attribute_id=' .  $information_id),
                'separator' => $this->language->get('text_separator')
            );

            $this->data['heading_title'] = $information_info['title'];

            $this->data['button_continue'] = $this->language->get('button_continue');

            if ($information_info['igroup']){

                $this->load->model('tool/image');

                $data = array(
                    'igroup' => $information_info['igroup']
                );

                $results = $this->model_catalog_information_attribute->getInformations($data);

                $this->data['informations'] = array();

                foreach ($results as $result) {

                    if ($result['image']) {
                        $image = $this->model_tool_image->resize($result['image'], 50, 50);
                    } else {
                        $image = false;
                    }

                    $this->data['informations'][] = array(
                        'information_id' => $result['information_id'],
                        'title' => $result['title'],
                        'active' => ($result['information_id']==$information_id),
                        'image' => $image,
                        'href' => $this->url->link('information/information_attribute', 'information_id='.(int)$result['information_attribute_id']),
                    );
                }
            }

            //category_block  - {category_block} shortcut
            if ($information_info['show_category_id']){
                $sort = 'p.sort_order';
                $order = 'ASC';
                $page = 1;
                $limit = $this->config->get('config_catalog_limit');

                $this->data['products'] = array();
                $this->load->model('catalog/product');
                $this->load->model('catalog/set');

                $cdata = array(
                    'filter_category_id' => $information_info['show_category_id'],
                    'filter_sub_category' => true,
                    'sort'               => $sort,
                    'order'              => $order,
                    'start'              => ($page - 1) * $limit,
                    'limit'              => $limit
                );

                $this->data['button_cart'] = $this->language->get('button_cart');
                $this->data['button_wishlist'] = $this->language->get('button_wishlist');
                $this->data['button_compare'] = $this->language->get('button_compare');
                $this->data['button_continue'] = $this->language->get('button_continue');

                $results = $this->model_catalog_product->getProducts($cdata);

                foreach ($results as $result) {
                    if ($result['image']) {
                        $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                    } else {
                        $image = false;
                    }

                    if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                        $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
                    } else {
                        $price = false;
                    }

                    if ((float)$result['special']) {
                        $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
                    } else {
                        $special = false;
                    }

                    if ($this->config->get('config_tax')) {
                        $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
                    } else {
                        $tax = false;
                    }

                    if (isset($result['display_price_national']) && $result['display_price_national'] && $result['display_price_national'] > 0 && $result['currency'] == $this->currency->getCode()){
                        $price = $this->currency->format($this->tax->calculate($result['display_price_national'], $result['tax_class_id'], $this->config->get('config_tax')), $result['currency'], 1);
                    }

                    if ($this->config->get('config_review_status')) {
                        $rating = (int)$result['rating'];
                    } else {
                        $rating = false;
                    }

                    $is_not_certificate = (strpos($result['location'], 'certificate') === false);

                    $this->data['products'][] = array(
                        'product_id'  => $result['product_id'],
                        'thumb'       => $image,
                        'is_set' => $this->model_catalog_set->isSetExist($result['product_id']),
                        'name'        => $result['name'],
                        'description' => $is_not_certificate?(utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..'):html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'),
                        'price'       => $price,
                        'special'     => $special,
                        'tax'         => $tax,
                        'rating'      => $result['rating'],
                        'sort_order'  => $result['sort_order'],
                        'can_not_buy' => ($result['stock_status_id'] == $this->config->get('config_not_in_stock_status_id')),
                        'stock_status'  => $result['stock_status'],
                        'location'      => $result['location'],
                        'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                        'href'        => $this->url->link('product/product', 'path=' . $information_info['show_category_id'] . '&product_id=' . $result['product_id'])
                    );
                }
            }


            $this->data['description'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');

            $this->data['continue'] = $this->url->link('common/home');

            $canonical = $this->url->link('information/information_attribute', 'information_attribute_id=' .  $information_id);
            $shortname = parse_url($canonical);
            $shortname = $this->db->escape(str_replace('/','',$shortname['path']));

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/information_styles/' . $shortname.'.css')){
                $this->document->addStyle('catalog/view/theme/'.$this->config->get('config_template').'/stylesheet/information_styles/' . $shortname.'.css');
            }

            $this->document->addLink('canonical', $canonical);

            $this->template = 'information/information_attribute';

            $this->children = array(
                'common/column_left',
                'common/column_right',
                'common/content_top',
                'common/content_bottom',
                'common/footer',
                'common/header'
            );

            $this->response->setOutput($this->render());
        } else {
            $this->data['breadcrumbs'][] = array(
                'text'      => $this->language->get('text_error'),
                'href'      => $this->url->link('information/information_attribute', 'information_attribute_id=' . $information_id),
                'separator' => $this->language->get('text_separator')
            );

            $this->document->setTitle($this->language->get('text_error'));

            $this->data['heading_title'] = $this->language->get('text_error');

            $this->data['text_error'] = $this->language->get('text_error');

            $this->data['button_continue'] = $this->language->get('button_continue');

            $this->data['continue'] = $this->url->link('common/home');


            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 404 Not Found');

            $this->template = 'error/not_found';

            $this->children = array(
                'common/column_left',
                'common/column_right',
                'common/content_top',
                'common/content_bottom',
                'common/footer',
                'common/header'
            );

            $this->response->setOutput($this->render());
        }
    }

    public function info() {
        $this->load->model('catalog/information_attribute');

        if (isset($this->request->get['information_attribute_id'])) {
            $information_id = (int)$this->request->get['information_attribute_id'];
        } else {
            $information_id = 0;
        }

        $information_info = $this->model_catalog_information_attribute->getInformation($information_id);

        if ($information_info) {
            $this->document->setKeywords($information_info['meta_keyword']);
            $this->document->setDescription($information_info['meta_description']);
            $output  = '<html dir="ltr" lang="en">' . "\n";
            $output .= '<head>' . "\n";
            $output .= '  <title>' . $information_info['title'] . '</title>' . "\n";
            $output .= '  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' . "\n";
            $output .= '  <meta name="robots" content="noindex">' . "\n";
            $output .= '</head>' . "\n";
            $output .= '<body>' . "\n";
            $output .= '  <h1>' . $information_info['title'] . '</h1>' . "\n";
            $output .= html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
            $output .= '  </body>' . "\n";
            $output .= '</html>' . "\n";

            $this->response->setOutput($output);
        }
    }

    public function info2() {
        $this->load->model('catalog/information_attribute');

        if (isset($this->request->get['information_attribute_id'])) {
            $information_id = (int)$this->request->get['information_attribute_id'];
        } else {
            $information_id = 0;
        }

        $information_info = $this->model_catalog_information_attribute->getInformation($information_id);

        if ($information_info) {
            $this->document->setKeywords($information_info['meta_keyword']);
            $this->document->setDescription($information_info['meta_description']);

            $canonical = $this->url->link('information/information_attribute', 'information_attribute_id=' .  $information_id);
            $shortname = parse_url($canonical);
            $shortname = $this->db->escape(str_replace('/','',$shortname['path']));

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/information_styles/' . $shortname.'.css')){
                $output =  "<style type='text/css' src='catalog/view/theme/".$this->config->get('config_template')."/stylesheet/information_styles/" . $shortname.".css' />";
            } else {
                $output = '';
            }


            $output .= '  <h1>' . $information_info['title'] . '</h1>' . "\n";
            $output .= html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8') . "\n";

            $this->response->setOutput($output);
        }
    }

    public function info_block() {
        function innerXML($node)
        {
            $doc  = $node->ownerDocument;
            $frag = $doc->createDocumentFragment();
            foreach ($node->childNodes as $child)
            {
                $frag->appendChild($child->cloneNode(TRUE));
            }
            return $doc->saveXML($frag);
        }



        $this->load->model('catalog/information_attribute');

        if (isset($this->request->get['information_id'])) {
            $information_id = (int)$this->request->get['information_id'];
        } else {
            $information_id = 0;
        }

        if (isset($this->request->get['block'])) {
        }

        $information_info = $this->model_catalog_information_attribute->getInformation($information_id);

        if ($information_info) {
            $this->document->setKeywords($information_info['meta_keyword']);
            $this->document->setDescription($information_info['meta_description']);

            $f = new DOMDocument("1.0", "utf-8");
            $f -> preserveWhiteSpace = false;
            $f -> formatOutput       = true;
            $f -> loadHTML('<meta http-equiv="content-type" content="text/html; charset=utf-8">'.html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8'));
            $xpath = new DOMXPath($f);
            $node = $xpath->evaluate("/html/body//li[@id='".$this->request->get['block']."']");
            $output = innerXML($node->item(0));

            $this->response->setOutput($output);
        }
    }
}