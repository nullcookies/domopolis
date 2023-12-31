-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 16, 2023 at 03:47 PM
-- Server version: 8.0.30
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kp_kitchenprofi`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
CREATE TABLE IF NOT EXISTS `actions` (
  `actions_id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `image_to_cat` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `image_size` int NOT NULL DEFAULT '0',
  `date_start` int NOT NULL DEFAULT '0',
  `date_end` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `fancybox` int NOT NULL DEFAULT '0',
  `product_related` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `category_related_id` int NOT NULL,
  `category_related_no_intersections` tinyint(1) NOT NULL,
  `category_related_limit_products` int NOT NULL,
  `ao_group` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `manufacturer_id` int NOT NULL,
  `deletenotinstock` tinyint(1) NOT NULL DEFAULT '0',
  `only_in_stock` int NOT NULL DEFAULT '0',
  `display_all_active` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`actions_id`),
  KEY `manufacturer_id` (`manufacturer_id`),
  KEY `deletenotinstock` (`deletenotinstock`),
  KEY `only_in_stock` (`only_in_stock`),
  KEY `display_all_active` (`display_all_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `actions_description`
--

DROP TABLE IF EXISTS `actions_description`;
CREATE TABLE IF NOT EXISTS `actions_description` (
  `actions_id` int NOT NULL,
  `language_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `meta_keywords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `meta_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `h1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `caption` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `anonnce` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `image_overload` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `image_to_cat_overload` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `label` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `label_background` varchar(32) COLLATE utf8mb3_bin NOT NULL,
  `label_color` varchar(32) COLLATE utf8mb3_bin NOT NULL,
  `label_text` text COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`actions_id`,`language_id`),
  KEY `language_id` (`language_id`),
  KEY `title` (`title`),
  KEY `caption` (`caption`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `actions_to_category`
--

DROP TABLE IF EXISTS `actions_to_category`;
CREATE TABLE IF NOT EXISTS `actions_to_category` (
  `actions_id` int NOT NULL,
  `category_id` int NOT NULL,
  KEY `action_id` (`actions_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `actions_to_category_in`
--

DROP TABLE IF EXISTS `actions_to_category_in`;
CREATE TABLE IF NOT EXISTS `actions_to_category_in` (
  `actions_id` int NOT NULL,
  `category_id` int NOT NULL,
  KEY `actions_id` (`actions_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `actions_to_layout`
--

DROP TABLE IF EXISTS `actions_to_layout`;
CREATE TABLE IF NOT EXISTS `actions_to_layout` (
  `actions_id` int NOT NULL,
  `store_id` int NOT NULL,
  `layout_id` int NOT NULL,
  PRIMARY KEY (`actions_id`,`store_id`),
  KEY `store_id` (`store_id`),
  KEY `layout_id` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `actions_to_product`
--

DROP TABLE IF EXISTS `actions_to_product`;
CREATE TABLE IF NOT EXISTS `actions_to_product` (
  `actions_id` int NOT NULL,
  `product_id` int NOT NULL,
  KEY `actions_id` (`actions_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `actions_to_store`
--

DROP TABLE IF EXISTS `actions_to_store`;
CREATE TABLE IF NOT EXISTS `actions_to_store` (
  `actions_id` int NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`actions_id`,`store_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `actiontemplate`
--

DROP TABLE IF EXISTS `actiontemplate`;
CREATE TABLE IF NOT EXISTS `actiontemplate` (
  `actiontemplate_id` int NOT NULL AUTO_INCREMENT,
  `bottom` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) NOT NULL,
  `viewed` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`actiontemplate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `actiontemplate_description`
--

DROP TABLE IF EXISTS `actiontemplate_description`;
CREATE TABLE IF NOT EXISTS `actiontemplate_description` (
  `actiontemplate_id` int NOT NULL,
  `language_id` int NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` longtext NOT NULL,
  `seo_title` varchar(255) DEFAULT '',
  `meta_description` text,
  `meta_keyword` text,
  `tag` text,
  PRIMARY KEY (`actiontemplate_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `tax_id` varchar(32) NOT NULL,
  `address_1` varchar(500) NOT NULL,
  `address_2` varchar(500) NOT NULL,
  `city` varchar(128) NOT NULL,
  `novaposhta_city_guid` varchar(32) NOT NULL,
  `cdek_city_guid` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int NOT NULL DEFAULT '0',
  `zone_id` int NOT NULL DEFAULT '0',
  `passport_serie` varchar(50) NOT NULL,
  `passport_given` text NOT NULL,
  `verified` tinyint(1) DEFAULT '0',
  `for_print` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`),
  KEY `company_id` (`company_id`),
  KEY `tax_id` (`tax_id`),
  KEY `country_id` (`country_id`),
  KEY `zone_id` (`zone_id`),
  KEY `city` (`city`),
  KEY `address_1` (`address_1`),
  KEY `for_print` (`for_print`),
  KEY `verified` (`verified`),
  KEY `firstname` (`firstname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `address_simple_fields`
--

DROP TABLE IF EXISTS `address_simple_fields`;
CREATE TABLE IF NOT EXISTS `address_simple_fields` (
  `address_id` int NOT NULL,
  `metadata` text,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `adminlog`
--

DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE IF NOT EXISTS `adminlog` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `action` varchar(50) NOT NULL,
  `allowed` tinyint(1) NOT NULL,
  `url` varchar(200) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `advanced_coupon`
--

DROP TABLE IF EXISTS `advanced_coupon`;
CREATE TABLE IF NOT EXISTS `advanced_coupon` (
  `advanced_coupon_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `options` text NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `status` int NOT NULL,
  `date_added` date NOT NULL,
  PRIMARY KEY (`advanced_coupon_id`),
  UNIQUE KEY `name` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `advanced_coupon_history`
--

DROP TABLE IF EXISTS `advanced_coupon_history`;
CREATE TABLE IF NOT EXISTS `advanced_coupon_history` (
  `advanced_coupon_history_id` int NOT NULL AUTO_INCREMENT,
  `advanced_coupon_id` int NOT NULL,
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`advanced_coupon_history_id`),
  KEY `advanced_coupon_id` (`advanced_coupon_id`),
  KEY `order_id` (`order_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate`
--

DROP TABLE IF EXISTS `affiliate`;
CREATE TABLE IF NOT EXISTS `affiliate` (
  `affiliate_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(32) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int NOT NULL,
  `zone_id` int NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(64) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `coupon` int NOT NULL,
  `date_added` datetime NOT NULL,
  `qiwi` varchar(100) NOT NULL DEFAULT '',
  `card` varchar(100) NOT NULL DEFAULT '',
  `yandex` varchar(100) NOT NULL DEFAULT '',
  `webmoney` varchar(100) NOT NULL DEFAULT '',
  `request_payment` decimal(10,2) NOT NULL DEFAULT '0.00',
  `webmoneyWMZ` varchar(100) NOT NULL DEFAULT '',
  `webmoneyWMU` varchar(100) NOT NULL DEFAULT '',
  `webmoneyWME` varchar(100) NOT NULL DEFAULT '',
  `webmoneyWMY` varchar(100) NOT NULL DEFAULT '',
  `webmoneyWMB` varchar(100) NOT NULL DEFAULT '',
  `webmoneyWMG` varchar(100) NOT NULL DEFAULT '',
  `AlertPay` varchar(100) NOT NULL DEFAULT '',
  `Moneybookers` varchar(100) NOT NULL DEFAULT '',
  `LIQPAY` varchar(100) NOT NULL DEFAULT '',
  `SagePay` varchar(100) NOT NULL DEFAULT '',
  `twoCheckout` varchar(100) NOT NULL DEFAULT '',
  `GoogleWallet` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`affiliate_id`),
  KEY `country_id` (`country_id`),
  KEY `zone_id` (`zone_id`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_statistics`
--

DROP TABLE IF EXISTS `affiliate_statistics`;
CREATE TABLE IF NOT EXISTS `affiliate_statistics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `affiliate_id` int NOT NULL,
  `date_added` date NOT NULL,
  `count_transitions` int NOT NULL DEFAULT '0',
  `affiliate_ip_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `affiliate_id` (`affiliate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_transaction`
--

DROP TABLE IF EXISTS `affiliate_transaction`;
CREATE TABLE IF NOT EXISTS `affiliate_transaction` (
  `affiliate_transaction_id` int NOT NULL AUTO_INCREMENT,
  `affiliate_id` int NOT NULL,
  `order_id` int NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`),
  KEY `affiliate_id` (`affiliate_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
CREATE TABLE IF NOT EXISTS `albums` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `album_type` int NOT NULL,
  `enabled` int NOT NULL,
  `sort_order` int NOT NULL,
  `last_modified` datetime NOT NULL,
  `album_data` text NOT NULL,
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `alertlog`
--

DROP TABLE IF EXISTS `alertlog`;
CREATE TABLE IF NOT EXISTS `alertlog` (
  `alertlog_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `alert_type` varchar(30) NOT NULL,
  `alert_text` varchar(500) NOT NULL,
  `entity_type` varchar(20) NOT NULL,
  `entity_id` int NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`alertlog_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `alsoviewed`
--

DROP TABLE IF EXISTS `alsoviewed`;
CREATE TABLE IF NOT EXISTS `alsoviewed` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `low` int DEFAULT '0',
  `high` int DEFAULT '0',
  `number` int DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `low_2` (`low`,`high`),
  KEY `low` (`low`),
  KEY `high` (`high`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `amazon_orders`
--

DROP TABLE IF EXISTS `amazon_orders`;
CREATE TABLE IF NOT EXISTS `amazon_orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `amazon_id` varchar(255) NOT NULL,
  `date_added` date NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `grand_total` decimal(15,4) NOT NULL,
  `gift_card` decimal(15,4) NOT NULL,
  `cancelled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `amazon_id` (`amazon_id`),
  KEY `date_added` (`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `amazon_orders_blobs`
--

DROP TABLE IF EXISTS `amazon_orders_blobs`;
CREATE TABLE IF NOT EXISTS `amazon_orders_blobs` (
  `amazon_id` varchar(30) NOT NULL,
  `amazon_blob` longtext NOT NULL,
  UNIQUE KEY `amazon_id` (`amazon_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `amazon_orders_products`
--

DROP TABLE IF EXISTS `amazon_orders_products`;
CREATE TABLE IF NOT EXISTS `amazon_orders_products` (
  `order_product_id` int NOT NULL AUTO_INCREMENT,
  `amazon_id` varchar(255) NOT NULL,
  `asin` varchar(30) NOT NULL,
  `name` varchar(400) NOT NULL,
  `image` varchar(500) NOT NULL,
  `href` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `product_id` int NOT NULL,
  `delivery_num` int NOT NULL,
  `delivery_status` varchar(255) NOT NULL,
  `delivery_status_ru` varchar(255) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `supplier_id` int NOT NULL,
  `is_problem` tinyint(1) NOT NULL,
  `is_return` tinyint(1) NOT NULL,
  `is_dispatched` tinyint(1) NOT NULL,
  `is_expected` tinyint(1) NOT NULL,
  `date_expected` date NOT NULL,
  `is_delivered` tinyint(1) NOT NULL,
  `date_delivered` date NOT NULL,
  `is_arriving` int NOT NULL,
  `date_arriving_exact` date NOT NULL,
  `date_arriving_from` date NOT NULL,
  `date_arriving_to` date NOT NULL,
  PRIMARY KEY (`order_product_id`),
  KEY `delivery_num` (`delivery_num`),
  KEY `product_id` (`product_id`),
  KEY `asin` (`asin`),
  KEY `amazon_id` (`amazon_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `delivery_status` (`delivery_status`),
  KEY `is_problem` (`is_problem`),
  KEY `is_return` (`is_return`),
  KEY `is_dispatched` (`is_dispatched`),
  KEY `is_delivered` (`is_delivered`),
  KEY `date_delivered` (`date_delivered`),
  KEY `is_arriving` (`is_arriving`),
  KEY `date_arriving_from` (`date_arriving_from`),
  KEY `date_arriving_to` (`date_arriving_to`),
  KEY `date_arriving_exact` (`date_arriving_exact`),
  KEY `is_expected` (`is_expected`),
  KEY `date_expected` (`date_expected`),
  KEY `supplier` (`supplier`),
  KEY `delivery_status_ru` (`delivery_status_ru`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `amzn_add_queue`
--

DROP TABLE IF EXISTS `amzn_add_queue`;
CREATE TABLE IF NOT EXISTS `amzn_add_queue` (
  `asin` varchar(32) NOT NULL,
  `date_added` datetime NOT NULL,
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`asin`) USING BTREE,
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  KEY `date_added` (`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amzn_add_variants_queue`
--

DROP TABLE IF EXISTS `amzn_add_variants_queue`;
CREATE TABLE IF NOT EXISTS `amzn_add_variants_queue` (
  `product_id` int NOT NULL,
  `asin` varchar(16) NOT NULL,
  `date_added` datetime NOT NULL,
  UNIQUE KEY `asin` (`asin`),
  KEY `product_id` (`product_id`),
  KEY `date_added` (`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amzn_product_queue`
--

DROP TABLE IF EXISTS `amzn_product_queue`;
CREATE TABLE IF NOT EXISTS `amzn_product_queue` (
  `asin` varchar(32) NOT NULL,
  `date_added` datetime NOT NULL,
  UNIQUE KEY `asin` (`asin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apri`
--

DROP TABLE IF EXISTS `apri`;
CREATE TABLE IF NOT EXISTS `apri` (
  `order_id` int NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `apri_unsubscribe`
--

DROP TABLE IF EXISTS `apri_unsubscribe`;
CREATE TABLE IF NOT EXISTS `apri_unsubscribe` (
  `md5_email` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
CREATE TABLE IF NOT EXISTS `attribute` (
  `attribute_id` int NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int NOT NULL,
  `dimension_type` enum('length','width','height','dimensions','weight','all') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`attribute_id`),
  KEY `dimension_type` (`dimension_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `attributes_category`
--

DROP TABLE IF EXISTS `attributes_category`;
CREATE TABLE IF NOT EXISTS `attributes_category` (
  `attribute_id` int NOT NULL,
  `category_id` int NOT NULL,
  KEY `category_id` (`category_id`),
  KEY `attribute_id` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `attributes_similar_category`
--

DROP TABLE IF EXISTS `attributes_similar_category`;
CREATE TABLE IF NOT EXISTS `attributes_similar_category` (
  `attribute_id` int NOT NULL,
  `category_id` int NOT NULL,
  KEY `attribute_id` (`attribute_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_description`
--

DROP TABLE IF EXISTS `attribute_description`;
CREATE TABLE IF NOT EXISTS `attribute_description` (
  `attribute_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_group`
--

DROP TABLE IF EXISTS `attribute_group`;
CREATE TABLE IF NOT EXISTS `attribute_group` (
  `attribute_group_id` int NOT NULL AUTO_INCREMENT,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_group_description`
--

DROP TABLE IF EXISTS `attribute_group_description`;
CREATE TABLE IF NOT EXISTS `attribute_group_description` (
  `attribute_group_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_group_tooltip`
--

DROP TABLE IF EXISTS `attribute_group_tooltip`;
CREATE TABLE IF NOT EXISTS `attribute_group_tooltip` (
  `attribute_group_id` int NOT NULL,
  `language_id` int NOT NULL,
  `tooltip` text NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_tooltip`
--

DROP TABLE IF EXISTS `attribute_tooltip`;
CREATE TABLE IF NOT EXISTS `attribute_tooltip` (
  `attribute_id` int NOT NULL,
  `language_id` int NOT NULL,
  `tooltip` text NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_value_image`
--

DROP TABLE IF EXISTS `attribute_value_image`;
CREATE TABLE IF NOT EXISTS `attribute_value_image` (
  `attribute_value_image` int NOT NULL AUTO_INCREMENT,
  `attribute_id` int NOT NULL,
  `attribute_value` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `information_id` int NOT NULL,
  PRIMARY KEY (`attribute_value_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
CREATE TABLE IF NOT EXISTS `banner` (
  `banner_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `class` varchar(256) NOT NULL,
  `class_sm` varchar(256) NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`banner_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `banner_image`
--

DROP TABLE IF EXISTS `banner_image`;
CREATE TABLE IF NOT EXISTS `banner_image` (
  `banner_image_id` int NOT NULL AUTO_INCREMENT,
  `banner_id` int NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `image_sm` varchar(255) NOT NULL,
  `width` int NOT NULL,
  `height` int NOT NULL,
  `width_sm` int NOT NULL,
  `height_sm` int NOT NULL,
  `class` varchar(255) NOT NULL,
  `class_sm` varchar(255) NOT NULL,
  `block` int NOT NULL,
  `block_sm` int NOT NULL,
  PRIMARY KEY (`banner_image_id`),
  KEY `banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `banner_image_description`
--

DROP TABLE IF EXISTS `banner_image_description`;
CREATE TABLE IF NOT EXISTS `banner_image_description` (
  `banner_image_id` int NOT NULL,
  `language_id` int NOT NULL,
  `banner_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `block_text` text NOT NULL,
  `button_text` varchar(255) NOT NULL,
  `overload_image` varchar(255) NOT NULL,
  `overload_image_sm` varchar(255) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`),
  KEY `language_id` (`language_id`),
  KEY `banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `callback`
--

DROP TABLE IF EXISTS `callback`;
CREATE TABLE IF NOT EXISTS `callback` (
  `call_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `status_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `comment` text NOT NULL,
  `comment_buyer` text NOT NULL,
  `email_buyer` text NOT NULL,
  `manager_id` int NOT NULL,
  `is_missed` tinyint(1) NOT NULL DEFAULT '0',
  `is_cheaper` tinyint(1) NOT NULL,
  `product_id` int NOT NULL,
  `sip_queue` varchar(4) NOT NULL,
  PRIMARY KEY (`call_id`),
  KEY `sip_queue` (`sip_queue`),
  KEY `is_cheaper` (`is_cheaper`),
  KEY `is_missed` (`is_missed`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `menu_image` tinyint(1) NOT NULL DEFAULT '1',
  `not_update_image` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int NOT NULL DEFAULT '0',
  `virtual_parent_id` int NOT NULL DEFAULT '-1',
  `top` tinyint(1) NOT NULL,
  `column` int NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `menu_banner` varchar(255) DEFAULT '',
  `banner_link` varchar(255) NOT NULL DEFAULT '',
  `menu_icon` text,
  `product_count` int NOT NULL,
  `tnved` varchar(255) NOT NULL,
  `overprice` varchar(255) NOT NULL,
  `google_category_id` int NOT NULL,
  `separate_feeds` tinyint(1) NOT NULL DEFAULT '0',
  `no_general_feed` tinyint(1) NOT NULL DEFAULT '0',
  `deletenotinstock` tinyint(1) NOT NULL DEFAULT '0',
  `intersections` tinyint(1) NOT NULL DEFAULT '0',
  `exclude_from_intersections` tinyint(1) NOT NULL DEFAULT '0',
  `default_weight` decimal(15,4) NOT NULL,
  `default_weight_class_id` int NOT NULL,
  `default_length` decimal(15,4) NOT NULL,
  `default_width` decimal(15,4) NOT NULL,
  `default_height` decimal(15,4) NOT NULL,
  `default_length_class_id` int NOT NULL,
  `priceva_enable` tinyint(1) NOT NULL DEFAULT '0',
  `submenu_in_children` tinyint(1) NOT NULL DEFAULT '0',
  `amazon_sync_enable` tinyint(1) NOT NULL,
  `amazon_category_id` varchar(255) NOT NULL,
  `amazon_category_name` varchar(1024) NOT NULL,
  `amazon_category_link` varchar(1024) DEFAULT NULL,
  `amazon_parent_category_id` varchar(256) NOT NULL,
  `amazon_parent_category_name` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `amazon_final_category` tinyint(1) DEFAULT '0',
  `amazon_can_get_full` tinyint(1) NOT NULL DEFAULT '0',
  `amazon_last_sync` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `amazon_synced` tinyint(1) NOT NULL DEFAULT '0',
  `amazon_overprice_rules` varchar(512) NOT NULL,
  `yandex_category_name` varchar(1024) NOT NULL,
  `final` tinyint(1) NOT NULL DEFAULT '0',
  `homepage` tinyint(1) NOT NULL,
  `popular` tinyint(1) NOT NULL,
  `viewed` int NOT NULL,
  `bought_for_month` int DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `category_id` (`category_id`,`parent_id`),
  KEY `separate_feeds` (`separate_feeds`),
  KEY `no_general_feed` (`no_general_feed`),
  KEY `google_category_id` (`google_category_id`),
  KEY `deletenotinstock` (`deletenotinstock`),
  KEY `intersections` (`intersections`),
  KEY `priceva_enable` (`priceva_enable`),
  KEY `submenu_in_children` (`submenu_in_children`),
  KEY `amazon_last_sync` (`amazon_last_sync`),
  KEY `status` (`status`),
  KEY `product_count` (`product_count`),
  KEY `amazon_sync_enable` (`amazon_sync_enable`),
  KEY `amazon_category_id` (`amazon_category_id`),
  KEY `yandex_category_name` (`yandex_category_name`),
  KEY `amazon_category_name` (`amazon_category_name`),
  KEY `amazon_parent_category_name` (`amazon_parent_category_name`),
  KEY `amazon_parent_category_id` (`amazon_parent_category_id`),
  KEY `amazon_final_category` (`amazon_final_category`),
  KEY `amazon_can_get_full` (`amazon_can_get_full`),
  KEY `exclude_from_intersections` (`exclude_from_intersections`),
  KEY `amzn_synced` (`amazon_synced`),
  KEY `homepage` (`homepage`),
  KEY `popular` (`popular`),
  KEY `viewed` (`viewed`),
  KEY `bought` (`bought_for_month`),
  KEY `final` (`final`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_amazon_bestseller_tree`
--

DROP TABLE IF EXISTS `category_amazon_bestseller_tree`;
CREATE TABLE IF NOT EXISTS `category_amazon_bestseller_tree` (
  `category_id` varchar(255) NOT NULL,
  `parent_id` varchar(255) NOT NULL,
  `final_category` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(512) DEFAULT NULL,
  `name_native` varchar(512) NOT NULL,
  `full_name` varchar(1024) DEFAULT NULL,
  `full_name_native` varchar(1024) NOT NULL,
  `link` varchar(1024) NOT NULL,
  UNIQUE KEY `category_id` (`category_id`) USING BTREE,
  KEY `parent_id` (`parent_id`),
  KEY `final_category` (`final_category`),
  KEY `name` (`name`),
  KEY `full_name` (`full_name`),
  KEY `full_name_native` (`full_name_native`),
  KEY `name_native` (`name_native`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_amazon_tree`
--

DROP TABLE IF EXISTS `category_amazon_tree`;
CREATE TABLE IF NOT EXISTS `category_amazon_tree` (
  `category_id` varchar(255) NOT NULL,
  `parent_id` varchar(255) NOT NULL,
  `final_category` tinyint(1) NOT NULL,
  `name` varchar(512) NOT NULL,
  `full_name` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  KEY `category_id` (`category_id`),
  KEY `parent_id` (`parent_id`),
  KEY `final_category` (`final_category`),
  KEY `name` (`name`),
  KEY `full_name` (`full_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_description`
--

DROP TABLE IF EXISTS `category_description`;
CREATE TABLE IF NOT EXISTS `category_description` (
  `category_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `tagline` varchar(2048) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `alternate_name` longtext NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `all_prefix` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  `auto_gen` tinyint(1) NOT NULL DEFAULT '0',
  `tag` text,
  `alt_image` text,
  `title_image` text,
  `google_tree` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_filter`
--

DROP TABLE IF EXISTS `category_filter`;
CREATE TABLE IF NOT EXISTS `category_filter` (
  `category_id` int NOT NULL,
  `filter_id` int NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_menu_content`
--

DROP TABLE IF EXISTS `category_menu_content`;
CREATE TABLE IF NOT EXISTS `category_menu_content` (
  `category_menu_content_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `language_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` text NOT NULL,
  `width` int NOT NULL,
  `height` int NOT NULL,
  `href` varchar(1024) NOT NULL,
  `standalone` tinyint(1) NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_menu_content_id`),
  KEY `category_id` (`category_id`),
  KEY `sort_order` (`sort_order`),
  KEY `category_id_2` (`category_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_path`
--

DROP TABLE IF EXISTS `category_path`;
CREATE TABLE IF NOT EXISTS `category_path` (
  `category_id` int NOT NULL,
  `path_id` int NOT NULL,
  `level` int NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`),
  KEY `category_id` (`category_id`),
  KEY `path_id` (`path_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_product_count`
--

DROP TABLE IF EXISTS `category_product_count`;
CREATE TABLE IF NOT EXISTS `category_product_count` (
  `category_id` int NOT NULL,
  `store_id` int NOT NULL,
  `product_count` int NOT NULL,
  KEY `store_id` (`store_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_psm_template`
--

DROP TABLE IF EXISTS `category_psm_template`;
CREATE TABLE IF NOT EXISTS `category_psm_template` (
  `category_psm_template_id` int NOT NULL AUTO_INCREMENT,
  `category_entity` varchar(64) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `l_code` varchar(5) DEFAULT NULL,
  `template` text NOT NULL,
  PRIMARY KEY (`category_psm_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_related`
--

DROP TABLE IF EXISTS `category_related`;
CREATE TABLE IF NOT EXISTS `category_related` (
  `category_id` int NOT NULL,
  `related_category_id` int NOT NULL,
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_review`
--

DROP TABLE IF EXISTS `category_review`;
CREATE TABLE IF NOT EXISTS `category_review` (
  `categoryreview_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`categoryreview_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_to_actions`
--

DROP TABLE IF EXISTS `category_to_actions`;
CREATE TABLE IF NOT EXISTS `category_to_actions` (
  `category_id` int NOT NULL,
  `actions_id` int NOT NULL,
  KEY `category_id` (`category_id`),
  KEY `actions_id` (`actions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_to_layout`
--

DROP TABLE IF EXISTS `category_to_layout`;
CREATE TABLE IF NOT EXISTS `category_to_layout` (
  `category_id` int NOT NULL,
  `store_id` int NOT NULL,
  `layout_id` int NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_to_store`
--

DROP TABLE IF EXISTS `category_to_store`;
CREATE TABLE IF NOT EXISTS `category_to_store` (
  `category_id` int NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `category_yam_tree`
--

DROP TABLE IF EXISTS `category_yam_tree`;
CREATE TABLE IF NOT EXISTS `category_yam_tree` (
  `category_id` int NOT NULL,
  `parent_id` int NOT NULL,
  `final_category` tinyint(1) NOT NULL,
  `name` varchar(512) NOT NULL,
  `full_name` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  KEY `name` (`name`),
  KEY `parent_id` (`parent_id`),
  KEY `category_id` (`category_id`),
  KEY `full_name` (`full_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_cities`
--

DROP TABLE IF EXISTS `cdek_cities`;
CREATE TABLE IF NOT EXISTS `cdek_cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `code` int NOT NULL,
  `city` varchar(255) NOT NULL,
  `kladr_code` varchar(255) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `country_id` int NOT NULL,
  `country` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `region_code` int NOT NULL,
  `fias_guid` varchar(64) NOT NULL,
  `sub_region` varchar(255) NOT NULL,
  `postal_codes` varchar(255) NOT NULL,
  `longitude` varchar(32) NOT NULL,
  `latitude` varchar(32) NOT NULL,
  `time_zone` varchar(255) NOT NULL,
  `WarehouseCount` int NOT NULL,
  `dadata_BELTWAY_HIT` varchar(10) DEFAULT NULL,
  `dadata_BELTWAY_DISTANCE` int NOT NULL DEFAULT '0',
  `deliveryPeriodMin` int NOT NULL,
  `deliveryPeriodMax` int NOT NULL,
  `min_WD` decimal(15,2) NOT NULL,
  `min_WW` decimal(15,2) NOT NULL,
  `parsed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `code` (`code`),
  KEY `region_code` (`region_code`),
  KEY `country_code` (`country_code`),
  KEY `country_id` (`country_id`),
  KEY `city` (`city`),
  KEY `country` (`country`),
  KEY `region` (`region`),
  KEY `WarehouseCount` (`WarehouseCount`),
  KEY `dadata_BELTWAY_HIT` (`dadata_BELTWAY_HIT`),
  KEY `dadata_BELTWAY_DISTANCE` (`dadata_BELTWAY_DISTANCE`),
  KEY `parsed` (`parsed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_city`
--

DROP TABLE IF EXISTS `cdek_city`;
CREATE TABLE IF NOT EXISTS `cdek_city` (
  `id` varchar(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `cityName` varchar(64) NOT NULL,
  `regionName` varchar(64) NOT NULL,
  `center` tinyint(1) NOT NULL DEFAULT '0',
  `cache_limit` float(5,4) NOT NULL,
  `deliveryPeriodMin` int NOT NULL,
  `deliveryPeriodMax` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_deliverypoints`
--

DROP TABLE IF EXISTS `cdek_deliverypoints`;
CREATE TABLE IF NOT EXISTS `cdek_deliverypoints` (
  `deliverypoint_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(12) NOT NULL,
  `name` varchar(50) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `region_code` int NOT NULL,
  `region` varchar(64) NOT NULL,
  `city_code` int NOT NULL,
  `city` varchar(64) NOT NULL,
  `postal_сode` varchar(255) NOT NULL,
  `longitude` varchar(32) NOT NULL,
  `latitude` varchar(32) NOT NULL,
  `address` varchar(255) NOT NULL,
  `address_full` varchar(255) NOT NULL,
  `address_comment` varchar(255) NOT NULL,
  `nearest_station` varchar(255) NOT NULL,
  `nearest_metro_station` varchar(255) NOT NULL,
  `work_time` varchar(255) NOT NULL,
  `phones` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL,
  `owner_сode` varchar(32) NOT NULL,
  `take_only` tinyint(1) NOT NULL,
  `is_handout` tinyint(1) NOT NULL,
  `is_reception` tinyint(1) NOT NULL,
  `is_dressing_room` tinyint(1) NOT NULL,
  `have_cashless` tinyint(1) NOT NULL,
  `have_cash` tinyint(1) NOT NULL,
  `allowed_cod` tinyint(1) NOT NULL,
  `site` varchar(255) NOT NULL,
  `office_image_list` varchar(500) NOT NULL,
  `work_time_list` text NOT NULL,
  `weight_min` decimal(14,2) NOT NULL,
  `weight_max` decimal(14,2) NOT NULL,
  `weight_limits` varchar(255) NOT NULL,
  PRIMARY KEY (`deliverypoint_id`),
  UNIQUE KEY `code` (`code`),
  KEY `region_code` (`region_code`),
  KEY `city_code` (`city_code`),
  KEY `country_code` (`country_code`),
  KEY `name` (`name`),
  KEY `region` (`region`),
  KEY `city` (`city`),
  KEY `address` (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_dispatch`
--

DROP TABLE IF EXISTS `cdek_dispatch`;
CREATE TABLE IF NOT EXISTS `cdek_dispatch` (
  `dispatch_id` int NOT NULL AUTO_INCREMENT,
  `dispatch_number` varchar(30) NOT NULL,
  `date` varchar(32) NOT NULL,
  `server_date` varchar(32) NOT NULL,
  PRIMARY KEY (`dispatch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_order`
--

DROP TABLE IF EXISTS `cdek_order`;
CREATE TABLE IF NOT EXISTS `cdek_order` (
  `order_id` int NOT NULL,
  `dispatch_id` int NOT NULL,
  `act_number` varchar(20) DEFAULT NULL,
  `dispatch_number` varchar(20) NOT NULL,
  `return_dispatch_number` varchar(20) NOT NULL,
  `city_id` int NOT NULL,
  `city_name` varchar(128) NOT NULL,
  `city_postcode` int DEFAULT NULL,
  `recipient_city_id` int NOT NULL,
  `recipient_city_name` varchar(128) NOT NULL,
  `recipient_city_postcode` int DEFAULT NULL,
  `recipient_name` varchar(128) NOT NULL,
  `recipient_email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) NOT NULL,
  `tariff_id` int NOT NULL,
  `mode_id` int NOT NULL,
  `status_id` int NOT NULL,
  `reason_id` int DEFAULT '0',
  `delay_id` int DEFAULT NULL,
  `delivery_recipient_cost` float(15,4) DEFAULT '0.0000',
  `cod` float(8,4) DEFAULT '0.0000',
  `cod_fact` float(8,4) DEFAULT '0.0000',
  `comment` varchar(255) DEFAULT NULL,
  `seller_name` varchar(255) DEFAULT NULL,
  `address_street` varchar(50) DEFAULT NULL,
  `address_house` varchar(30) DEFAULT NULL,
  `address_flat` varchar(10) DEFAULT NULL,
  `address_pvz_code` varchar(10) DEFAULT NULL,
  `delivery_cost` float(8,4) DEFAULT '0.0000',
  `delivery_last_change` varchar(32) DEFAULT NULL,
  `delivery_date` varchar(32) NOT NULL,
  `delivery_recipient_name` varchar(50) DEFAULT NULL,
  `currency` varchar(3) DEFAULT 'RUB',
  `currency_cod` varchar(3) DEFAULT 'RUB',
  `last_exchange` varchar(32) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `dispatch_id` (`dispatch_id`),
  KEY `dispatch_number` (`dispatch_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_order_add_service`
--

DROP TABLE IF EXISTS `cdek_order_add_service`;
CREATE TABLE IF NOT EXISTS `cdek_order_add_service` (
  `service_id` int NOT NULL,
  `order_id` int NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `price` float(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`service_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_order_call`
--

DROP TABLE IF EXISTS `cdek_order_call`;
CREATE TABLE IF NOT EXISTS `cdek_order_call` (
  `call_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `date` int NOT NULL,
  `time_beg` time NOT NULL,
  `time_end` time NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `recipient_name` varchar(128) DEFAULT NULL,
  `delivery_recipient_cost` float(15,4) DEFAULT '0.0000',
  `address_street` varchar(50) NOT NULL,
  `address_house` varchar(30) NOT NULL,
  `address_flat` varchar(10) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`call_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_order_call_history_delay`
--

DROP TABLE IF EXISTS `cdek_order_call_history_delay`;
CREATE TABLE IF NOT EXISTS `cdek_order_call_history_delay` (
  `order_id` int NOT NULL,
  `date` int NOT NULL,
  `date_next` int NOT NULL,
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_order_call_history_fail`
--

DROP TABLE IF EXISTS `cdek_order_call_history_fail`;
CREATE TABLE IF NOT EXISTS `cdek_order_call_history_fail` (
  `order_id` int NOT NULL,
  `fail_id` int NOT NULL,
  `date` int NOT NULL,
  `description` varchar(255) NOT NULL,
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_order_call_history_good`
--

DROP TABLE IF EXISTS `cdek_order_call_history_good`;
CREATE TABLE IF NOT EXISTS `cdek_order_call_history_good` (
  `order_id` int NOT NULL,
  `date` int NOT NULL,
  `date_deliv` int NOT NULL,
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_order_courier`
--

DROP TABLE IF EXISTS `cdek_order_courier`;
CREATE TABLE IF NOT EXISTS `cdek_order_courier` (
  `courier_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `date` int NOT NULL,
  `time_beg` time NOT NULL,
  `time_end` time NOT NULL,
  `lunch_beg` time DEFAULT NULL,
  `lunch_end` time DEFAULT NULL,
  `city_id` int NOT NULL,
  `city_name` varchar(128) NOT NULL,
  `send_phone` varchar(255) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `address_street` varchar(50) NOT NULL,
  `address_house` varchar(30) NOT NULL,
  `address_flat` varchar(10) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`courier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_order_delay_history`
--

DROP TABLE IF EXISTS `cdek_order_delay_history`;
CREATE TABLE IF NOT EXISTS `cdek_order_delay_history` (
  `order_id` int NOT NULL,
  `delay_id` int NOT NULL,
  `date` int NOT NULL,
  `description` varchar(50) NOT NULL,
  KEY `order_id` (`order_id`,`delay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_order_package`
--

DROP TABLE IF EXISTS `cdek_order_package`;
CREATE TABLE IF NOT EXISTS `cdek_order_package` (
  `package_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `number` varchar(20) NOT NULL,
  `brcode` varchar(20) NOT NULL,
  `weight` int NOT NULL,
  `size_a` float(15,4) DEFAULT '0.0000',
  `size_b` float(15,4) DEFAULT '0.0000',
  `size_c` float(15,4) DEFAULT '0.0000',
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_order_package_item`
--

DROP TABLE IF EXISTS `cdek_order_package_item`;
CREATE TABLE IF NOT EXISTS `cdek_order_package_item` (
  `package_item_id` int NOT NULL AUTO_INCREMENT,
  `package_id` int NOT NULL,
  `order_id` int NOT NULL,
  `ware_key` varchar(20) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `amount` int NOT NULL,
  `cost` float(15,4) NOT NULL DEFAULT '0.0000',
  `payment` float(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`package_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_order_reason`
--

DROP TABLE IF EXISTS `cdek_order_reason`;
CREATE TABLE IF NOT EXISTS `cdek_order_reason` (
  `reason_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `date` int NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`reason_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_order_schedule`
--

DROP TABLE IF EXISTS `cdek_order_schedule`;
CREATE TABLE IF NOT EXISTS `cdek_order_schedule` (
  `attempt_id` int NOT NULL,
  `order_id` int NOT NULL,
  `date` int NOT NULL,
  `time_beg` time NOT NULL,
  `time_end` time NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `recipient_name` varchar(128) DEFAULT NULL,
  `address_street` varchar(50) DEFAULT NULL,
  `address_house` varchar(30) DEFAULT NULL,
  `address_flat` varchar(10) DEFAULT NULL,
  `address_pvz_code` varchar(10) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attempt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_order_schedule_delay`
--

DROP TABLE IF EXISTS `cdek_order_schedule_delay`;
CREATE TABLE IF NOT EXISTS `cdek_order_schedule_delay` (
  `order_id` int NOT NULL,
  `attempt_id` int NOT NULL,
  `delay_id` int NOT NULL,
  `description` varchar(50) NOT NULL,
  KEY `order_id` (`order_id`,`attempt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_order_status_history`
--

DROP TABLE IF EXISTS `cdek_order_status_history`;
CREATE TABLE IF NOT EXISTS `cdek_order_status_history` (
  `order_id` int NOT NULL,
  `status_id` int NOT NULL,
  `description` varchar(100) NOT NULL,
  `date` int NOT NULL,
  `city_id` int NOT NULL,
  `city_name` varchar(128) NOT NULL,
  KEY `order_id` (`order_id`,`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `cdek_zones`
--

DROP TABLE IF EXISTS `cdek_zones`;
CREATE TABLE IF NOT EXISTS `cdek_zones` (
  `zone_id` int NOT NULL AUTO_INCREMENT,
  `country_id` int NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `country` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `region_code` int NOT NULL,
  PRIMARY KEY (`zone_id`),
  UNIQUE KEY `region_code` (`region_code`) USING BTREE,
  KEY `country_id` (`country_id`),
  KEY `country` (`country`),
  KEY `region` (`region`),
  KEY `country_code` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
CREATE TABLE IF NOT EXISTS `collection` (
  `collection_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `banner` varchar(500) NOT NULL DEFAULT '',
  `not_update_image` tinyint(1) NOT NULL DEFAULT '0',
  `manufacturer_id` int NOT NULL DEFAULT '0',
  `parent_id` int NOT NULL DEFAULT '0',
  `virtual` tinyint(1) NOT NULL DEFAULT '0',
  `no_brand` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`collection_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `collection_description`
--

DROP TABLE IF EXISTS `collection_description`;
CREATE TABLE IF NOT EXISTS `collection_description` (
  `collection_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name_overload` varchar(255) NOT NULL,
  `alternate_name` mediumtext NOT NULL,
  `description` text NOT NULL,
  `short_description` varchar(1024) NOT NULL,
  `type` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  UNIQUE KEY `collection_id_2` (`collection_id`,`language_id`),
  KEY `collection_id` (`collection_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `collection_image`
--

DROP TABLE IF EXISTS `collection_image`;
CREATE TABLE IF NOT EXISTS `collection_image` (
  `collection_id` int NOT NULL,
  `image` varchar(500) NOT NULL,
  `sort_order` int NOT NULL,
  KEY `collection_id` (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `collection_to_store`
--

DROP TABLE IF EXISTS `collection_to_store`;
CREATE TABLE IF NOT EXISTS `collection_to_store` (
  `collection_id` int NOT NULL,
  `store_id` int NOT NULL,
  UNIQUE KEY `collection_id_2` (`collection_id`,`store_id`),
  KEY `collection_id` (`collection_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `competitors`
--

DROP TABLE IF EXISTS `competitors`;
CREATE TABLE IF NOT EXISTS `competitors` (
  `competitor_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `classname` varchar(255) NOT NULL,
  `currency` varchar(5) NOT NULL,
  PRIMARY KEY (`competitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `competitor_price`
--

DROP TABLE IF EXISTS `competitor_price`;
CREATE TABLE IF NOT EXISTS `competitor_price` (
  `competitor_price_id` int NOT NULL AUTO_INCREMENT,
  `competitor_id` int NOT NULL,
  `competitor_has` tinyint(1) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `our_price` decimal(15,2) NOT NULL,
  `our_cost` decimal(15,2) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`competitor_price_id`),
  KEY `competitor_id` (`competitor_id`),
  KEY `sku` (`sku`),
  KEY `currency` (`currency`),
  KEY `date_added` (`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `competitor_urls`
--

DROP TABLE IF EXISTS `competitor_urls`;
CREATE TABLE IF NOT EXISTS `competitor_urls` (
  `competitor_id` int NOT NULL,
  `url` text NOT NULL,
  `date_added` date NOT NULL,
  `sku` varchar(255) NOT NULL,
  KEY `competitor_id` (`competitor_id`),
  KEY `sku` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

DROP TABLE IF EXISTS `counters`;
CREATE TABLE IF NOT EXISTS `counters` (
  `counter_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `counter` varchar(32) NOT NULL,
  `value` int NOT NULL,
  PRIMARY KEY (`counter_id`),
  KEY `store_id` (`store_id`),
  KEY `value` (`value`),
  KEY `counter` (`counter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `warehouse_identifier` varchar(30) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`),
  KEY `warehouse_identifier` (`warehouse_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `countrybrand`
--

DROP TABLE IF EXISTS `countrybrand`;
CREATE TABLE IF NOT EXISTS `countrybrand` (
  `countrybrand_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `banner` varchar(500) NOT NULL DEFAULT '',
  `template` varchar(255) NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `flag` varchar(3) NOT NULL,
  PRIMARY KEY (`countrybrand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `countrybrand_description`
--

DROP TABLE IF EXISTS `countrybrand_description`;
CREATE TABLE IF NOT EXISTS `countrybrand_description` (
  `countrybrand_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name_overload` varchar(255) NOT NULL,
  `alternate_name` mediumtext NOT NULL,
  `description` text NOT NULL,
  `short_description` varchar(1024) NOT NULL,
  `type` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  UNIQUE KEY `countrybrand_id_2` (`countrybrand_id`,`language_id`),
  KEY `countrybrand_id` (`countrybrand_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `countrybrand_image`
--

DROP TABLE IF EXISTS `countrybrand_image`;
CREATE TABLE IF NOT EXISTS `countrybrand_image` (
  `countrybrand_id` int NOT NULL,
  `image` varchar(500) NOT NULL,
  `sort_order` int NOT NULL,
  KEY `countrybrand_id` (`countrybrand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `countrybrand_to_store`
--

DROP TABLE IF EXISTS `countrybrand_to_store`;
CREATE TABLE IF NOT EXISTS `countrybrand_to_store` (
  `countrybrand_id` int NOT NULL,
  `store_id` int NOT NULL,
  UNIQUE KEY `countrybrand_id_2` (`countrybrand_id`,`store_id`),
  KEY `countrybrand_id` (`countrybrand_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `country_to_fias`
--

DROP TABLE IF EXISTS `country_to_fias`;
CREATE TABLE IF NOT EXISTS `country_to_fias` (
  `country_id` int NOT NULL,
  `fias_id` int NOT NULL,
  UNIQUE KEY `country_id` (`country_id`,`fias_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
CREATE TABLE IF NOT EXISTS `coupon` (
  `coupon_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(64) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `discount_sum` varchar(500) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `affiliate_id` int NOT NULL DEFAULT '0',
  `show_in_segments` tinyint(1) NOT NULL,
  `birthday` tinyint NOT NULL DEFAULT '0',
  `days_from_send` int NOT NULL,
  `actiontemplate_id` int NOT NULL,
  `promo_type` varchar(20) NOT NULL,
  `manager_id` int NOT NULL,
  `display_list` tinyint(1) NOT NULL DEFAULT '0',
  `action_id` int NOT NULL,
  `only_in_stock` tinyint(1) NOT NULL DEFAULT '0',
  `display_in_account` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`),
  KEY `affiliate_id` (`affiliate_id`),
  KEY `show_in_segments` (`show_in_segments`),
  KEY `promo_type` (`promo_type`),
  KEY `manager_id` (`manager_id`),
  KEY `display_list` (`display_list`),
  KEY `type` (`type`),
  KEY `currency` (`currency`),
  KEY `date_start` (`date_start`),
  KEY `date_end` (`date_end`),
  KEY `status` (`status`),
  KEY `action_id` (`action_id`),
  KEY `logged` (`logged`),
  KEY `code` (`code`),
  KEY `only_in_stock` (`only_in_stock`),
  KEY `uses_total` (`uses_total`),
  KEY `uses_customer` (`uses_customer`),
  KEY `birthday` (`birthday`),
  KEY `display_in_account` (`display_in_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_category`
--

DROP TABLE IF EXISTS `coupon_category`;
CREATE TABLE IF NOT EXISTS `coupon_category` (
  `coupon_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_collection`
--

DROP TABLE IF EXISTS `coupon_collection`;
CREATE TABLE IF NOT EXISTS `coupon_collection` (
  `coupon_id` int NOT NULL,
  `collection_id` int NOT NULL,
  PRIMARY KEY (`coupon_id`,`collection_id`),
  KEY `collection_id` (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_description`
--

DROP TABLE IF EXISTS `coupon_description`;
CREATE TABLE IF NOT EXISTS `coupon_description` (
  `coupon_id` int NOT NULL,
  `language_id` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `short_description` varchar(1024) NOT NULL,
  UNIQUE KEY `coupon_id_2` (`coupon_id`,`language_id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_history`
--

DROP TABLE IF EXISTS `coupon_history`;
CREATE TABLE IF NOT EXISTS `coupon_history` (
  `coupon_history_id` int NOT NULL AUTO_INCREMENT,
  `coupon_id` int NOT NULL,
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`),
  UNIQUE KEY `coupon_id_2` (`coupon_id`,`order_id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `order_id` (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `coupon_id_3` (`coupon_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_manufacturer`
--

DROP TABLE IF EXISTS `coupon_manufacturer`;
CREATE TABLE IF NOT EXISTS `coupon_manufacturer` (
  `coupon_id` int NOT NULL,
  `manufacturer_id` int NOT NULL,
  PRIMARY KEY (`coupon_id`,`manufacturer_id`),
  KEY `manufacturer_id` (`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_product`
--

DROP TABLE IF EXISTS `coupon_product`;
CREATE TABLE IF NOT EXISTS `coupon_product` (
  `coupon_product_id` int NOT NULL AUTO_INCREMENT,
  `coupon_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`coupon_product_id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_review`
--

DROP TABLE IF EXISTS `coupon_review`;
CREATE TABLE IF NOT EXISTS `coupon_review` (
  `coupon_id` int NOT NULL,
  `code` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `coupon_history_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`),
  KEY `coupon_history_id` (`coupon_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `csvprice_pro`
--

DROP TABLE IF EXISTS `csvprice_pro`;
CREATE TABLE IF NOT EXISTS `csvprice_pro` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(64) NOT NULL,
  `value` text,
  `serialized` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `csvprice_pro_crontab`
--

DROP TABLE IF EXISTS `csvprice_pro_crontab`;
CREATE TABLE IF NOT EXISTS `csvprice_pro_crontab` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `profile_id` int NOT NULL,
  `job_key` varchar(64) NOT NULL,
  `job_type` enum('import','export') DEFAULT NULL,
  `job_file_location` enum('dir','web','ftp') DEFAULT NULL,
  `job_time_start` datetime NOT NULL,
  `job_offline` tinyint(1) NOT NULL DEFAULT '0',
  `job_data` text,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `serialized` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `csvprice_pro_images`
--

DROP TABLE IF EXISTS `csvprice_pro_images`;
CREATE TABLE IF NOT EXISTS `csvprice_pro_images` (
  `catalog_id` int NOT NULL,
  `image_key` char(32) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  PRIMARY KEY (`catalog_id`,`image_key`),
  KEY `image_key` (`image_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `csvprice_pro_profiles`
--

DROP TABLE IF EXISTS `csvprice_pro_profiles`;
CREATE TABLE IF NOT EXISTS `csvprice_pro_profiles` (
  `profile_id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` text,
  `serialized` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `currency_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `morph` varchar(255) NOT NULL,
  `code` varchar(3) NOT NULL,
  `flag` varchar(30) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `old_value` float(15,8) NOT NULL,
  `value_real` float(15,8) NOT NULL,
  `value_eur_official` decimal(15,4) NOT NULL,
  `old_value_real` float(15,8) NOT NULL,
  `value_uah_unreal` float(15,4) NOT NULL,
  `cryptopair` varchar(16) NOT NULL,
  `cryptopair_value` decimal(15,4) NOT NULL,
  `value_minimal` decimal(15,4) NOT NULL,
  `plus_percent` varchar(4) NOT NULL DEFAULT '0',
  `auto_percent` decimal(15,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL DEFAULT '0',
  `language_id` int NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `customer_comment` text NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `normalized_telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `normalized_fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `newsletter_news` tinyint(1) NOT NULL DEFAULT '1',
  `newsletter_personal` tinyint(1) NOT NULL DEFAULT '1',
  `viber_news` tinyint(1) NOT NULL DEFAULT '1',
  `newsletter_ema_uid` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `newsletter_news_ema_uid` varchar(32) NOT NULL,
  `newsletter_personal_ema_uid` varchar(32) NOT NULL,
  `address_id` int NOT NULL DEFAULT '0',
  `customer_group_id` int NOT NULL,
  `ip` varchar(40) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `discount_card` varchar(10) NOT NULL,
  `discount_percent` int NOT NULL,
  `discount_id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `utoken` varchar(255) NOT NULL,
  `date_added` datetime DEFAULT CURRENT_TIMESTAMP,
  `tracking` varchar(20) NOT NULL,
  `affiliate_paid` int NOT NULL DEFAULT '0',
  `affiliate_life_time` date DEFAULT NULL,
  `affiliate_bonus_time_constant` date DEFAULT NULL,
  `number_reminder_sent` int NOT NULL,
  `date_last_action` date NOT NULL,
  `source` varchar(255) NOT NULL DEFAULT 'Organic',
  `mudak` tinyint(1) NOT NULL DEFAULT '0',
  `gender` tinyint DEFAULT '0',
  `mail_status` varchar(30) DEFAULT NULL,
  `mail_opened` int DEFAULT '0',
  `mail_clicked` int NOT NULL DEFAULT '0',
  `has_push` tinyint(1) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `passport_serie` varchar(30) NOT NULL,
  `passport_given` text NOT NULL,
  `cashless_info` text NOT NULL,
  `sendpulse_push_id` varchar(255) NOT NULL,
  `birthday` varchar(20) NOT NULL,
  `birthday_month` int DEFAULT NULL,
  `birthday_date` int DEFAULT NULL,
  `order_count` int NOT NULL,
  `order_good_count` int NOT NULL,
  `order_bad_count` int NOT NULL,
  `order_good_first_date` date NOT NULL,
  `order_good_last_date` date NOT NULL,
  `order_last_date` date NOT NULL,
  `order_first_date` date NOT NULL,
  `avg_cheque` decimal(15,4) NOT NULL,
  `total_cheque` decimal(15,4) NOT NULL,
  `total_product_cheque` decimal(15,4) NOT NULL,
  `total_calls` int NOT NULL,
  `avg_calls_duration` int NOT NULL,
  `country_id` int NOT NULL,
  `city` varchar(50) NOT NULL,
  `city_population` int NOT NULL,
  `first_order_source` varchar(255) NOT NULL,
  `csi_average` float(2,1) NOT NULL,
  `csi_reject` tinyint(1) NOT NULL,
  `nbt_csi` tinyint(1) NOT NULL DEFAULT '0',
  `nbt_customer` tinyint(1) NOT NULL DEFAULT '0',
  `rja_customer` tinyint(1) NOT NULL DEFAULT '0',
  `cron_sent` tinyint(1) NOT NULL DEFAULT '0',
  `printed2912` tinyint(1) NOT NULL DEFAULT '0',
  `social_id` text NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `store_id` (`store_id`),
  KEY `address_id` (`address_id`),
  KEY `customer_group_id` (`customer_group_id`),
  KEY `source` (`source`),
  KEY `email` (`email`) USING BTREE,
  KEY `telephone` (`telephone`),
  KEY `fax` (`fax`),
  KEY `status` (`status`),
  KEY `approved` (`approved`),
  KEY `normalized_fax` (`normalized_fax`),
  KEY `normalized_telephone` (`normalized_telephone`) USING BTREE,
  KEY `language_id` (`language_id`),
  KEY `mail_status` (`mail_status`),
  KEY `mail_opened` (`mail_opened`),
  KEY `mail_clicked` (`mail_clicked`),
  KEY `order_count` (`order_count`),
  KEY `order_good_count` (`order_good_count`),
  KEY `avg_cheque` (`avg_cheque`),
  KEY `total_cheque` (`total_cheque`),
  KEY `total_calls` (`total_calls`),
  KEY `country_id` (`country_id`),
  KEY `city` (`city`),
  KEY `avg_calls_duration` (`avg_calls_duration`),
  KEY `order_bad_count` (`order_bad_count`),
  KEY `order_last_date` (`order_last_date`),
  KEY `order_first_date` (`order_first_date`),
  KEY `order_good_first_date` (`order_good_first_date`),
  KEY `order_good_last_date` (`order_good_last_date`),
  KEY `birthday` (`birthday`),
  KEY `first_order_source` (`first_order_source`),
  KEY `has_push` (`has_push`),
  KEY `city_population` (`city_population`),
  KEY `csi_average` (`csi_average`),
  KEY `csi_reject` (`csi_reject`),
  KEY `nbt_csi` (`nbt_csi`),
  KEY `nbt_customer` (`nbt_customer`),
  KEY `birthday_month` (`birthday_month`),
  KEY `birthday_date` (`birthday_date`),
  KEY `cron_sent` (`cron_sent`),
  KEY `rja_customer` (`rja_customer`),
  KEY `social_id` (`social_id`(1024)),
  KEY `firstname` (`firstname`),
  KEY `password` (`password`),
  KEY `token` (`token`),
  KEY `utoken` (`utoken`),
  KEY `mudak` (`mudak`),
  KEY `printed2912` (`printed2912`),
  KEY `discount_card` (`discount_card`),
  KEY `newsletter` (`newsletter`),
  KEY `newsletter_news` (`newsletter_news`),
  KEY `newsletter_personal` (`newsletter_personal`),
  KEY `mailwizz_uid` (`newsletter_ema_uid`),
  KEY `newsletter_news_ema_uid` (`newsletter_news_ema_uid`),
  KEY `newsletter_personal_ema_uid` (`newsletter_personal_ema_uid`),
  KEY `viber_news` (`viber_news`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_ban_ip`
--

DROP TABLE IF EXISTS `customer_ban_ip`;
CREATE TABLE IF NOT EXISTS `customer_ban_ip` (
  `customer_ban_ip_id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_calls`
--

DROP TABLE IF EXISTS `customer_calls`;
CREATE TABLE IF NOT EXISTS `customer_calls` (
  `customer_call_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `inbound` tinyint(1) NOT NULL,
  `customer_phone` varchar(100) NOT NULL,
  `length` int NOT NULL,
  `date_end` datetime NOT NULL,
  `comment` text NOT NULL,
  `internal_pbx_num` varchar(10) NOT NULL,
  `manager_id` int NOT NULL,
  `filelink` varchar(1024) NOT NULL,
  `order_id` int NOT NULL,
  `sip_queue` varchar(4) NOT NULL,
  PRIMARY KEY (`customer_call_id`),
  UNIQUE KEY `customer_phone` (`customer_phone`,`date_end`,`internal_pbx_num`),
  KEY `customer_id` (`customer_id`),
  KEY `inbound` (`inbound`),
  KEY `length` (`length`),
  KEY `manager_id` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_emails_blacklist`
--

DROP TABLE IF EXISTS `customer_emails_blacklist`;
CREATE TABLE IF NOT EXISTS `customer_emails_blacklist` (
  `email` varchar(128) NOT NULL,
  `status` varchar(32) NOT NULL,
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_emails_whitelist`
--

DROP TABLE IF EXISTS `customer_emails_whitelist`;
CREATE TABLE IF NOT EXISTS `customer_emails_whitelist` (
  `email` varchar(128) NOT NULL,
  `status` varchar(32) NOT NULL,
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_email_campaigns`
--

DROP TABLE IF EXISTS `customer_email_campaigns`;
CREATE TABLE IF NOT EXISTS `customer_email_campaigns` (
  `customer_email_campaigns_id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `campaign_id` varchar(255) NOT NULL,
  `mail_status` varchar(50) NOT NULL,
  `mail_opened` int NOT NULL DEFAULT '0',
  `mail_clicked` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_email_campaigns_id`),
  UNIQUE KEY `customer_id_2` (`customer_id`,`campaign_id`),
  KEY `campaign_id` (`campaign_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_email_campaigns_names`
--

DROP TABLE IF EXISTS `customer_email_campaigns_names`;
CREATE TABLE IF NOT EXISTS `customer_email_campaigns_names` (
  `email_campaign_mailwizz_id` varchar(100) NOT NULL,
  `email_campaign_name` varchar(255) NOT NULL,
  UNIQUE KEY `email_campaign_mailwizz_id` (`email_campaign_mailwizz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_field`
--

DROP TABLE IF EXISTS `customer_field`;
CREATE TABLE IF NOT EXISTS `customer_field` (
  `customer_id` int NOT NULL,
  `custom_field_id` int NOT NULL,
  `custom_field_value_id` int NOT NULL,
  `name` int NOT NULL,
  `value` text NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`customer_id`,`custom_field_id`,`custom_field_value_id`),
  KEY `custom_field_id` (`custom_field_id`),
  KEY `custom_field_value_id` (`custom_field_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
CREATE TABLE IF NOT EXISTS `customer_group` (
  `customer_group_id` int NOT NULL AUTO_INCREMENT,
  `approval` int NOT NULL,
  `company_id_display` int NOT NULL,
  `company_id_required` int NOT NULL,
  `tax_id_display` int NOT NULL,
  `tax_id_required` int NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_group_description`
--

DROP TABLE IF EXISTS `customer_group_description`;
CREATE TABLE IF NOT EXISTS `customer_group_description` (
  `customer_group_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_group_price`
--

DROP TABLE IF EXISTS `customer_group_price`;
CREATE TABLE IF NOT EXISTS `customer_group_price` (
  `customer_group_id` int NOT NULL,
  `category_id` int NOT NULL,
  `price` float NOT NULL,
  `type` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_history`
--

DROP TABLE IF EXISTS `customer_history`;
CREATE TABLE IF NOT EXISTS `customer_history` (
  `customer_history_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  `call_id` int NOT NULL DEFAULT '0',
  `order_id` int NOT NULL DEFAULT '0',
  `order_status_id` int NOT NULL,
  `prev_order_status_id` int NOT NULL,
  `manager_id` int NOT NULL DEFAULT '0',
  `segment_id` int NOT NULL DEFAULT '0',
  `sms_id` varchar(50) NOT NULL DEFAULT '0',
  `email_id` int NOT NULL DEFAULT '0',
  `need_call` datetime DEFAULT NULL,
  `is_error` tinyint(1) NOT NULL,
  PRIMARY KEY (`customer_history_id`),
  KEY `customer_id` (`customer_id`),
  KEY `segment_id` (`segment_id`),
  KEY `order_id` (`order_id`),
  KEY `call_id` (`call_id`),
  KEY `manager_id` (`manager_id`),
  KEY `sms_id` (`sms_id`),
  KEY `email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_ip`
--

DROP TABLE IF EXISTS `customer_ip`;
CREATE TABLE IF NOT EXISTS `customer_ip` (
  `customer_ip_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_online`
--

DROP TABLE IF EXISTS `customer_online`;
CREATE TABLE IF NOT EXISTS `customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  `useragent` varchar(400) NOT NULL,
  `is_bot` tinyint(1) NOT NULL,
  `is_pwa` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`),
  KEY `customer_id` (`customer_id`),
  KEY `date_added` (`date_added`),
  KEY `is_bot` (`is_bot`),
  KEY `is_pwa` (`is_pwa`),
  KEY `is_bot_2` (`is_bot`,`is_pwa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_online_history`
--

DROP TABLE IF EXISTS `customer_online_history`;
CREATE TABLE IF NOT EXISTS `customer_online_history` (
  `customer_count` int NOT NULL,
  `date_added` datetime NOT NULL,
  KEY `date_added` (`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_push_ids`
--

DROP TABLE IF EXISTS `customer_push_ids`;
CREATE TABLE IF NOT EXISTS `customer_push_ids` (
  `customer_id` int NOT NULL,
  `sendpulse_push_id` varchar(255) NOT NULL,
  `onesignal_push_id` varchar(255) NOT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `onesignal_push_id` (`onesignal_push_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_reward`
--

DROP TABLE IF EXISTS `customer_reward`;
CREATE TABLE IF NOT EXISTS `customer_reward` (
  `customer_reward_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL DEFAULT '0',
  `order_id` int NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `reason_code` varchar(255) NOT NULL,
  `points` int DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `points_paid` int NOT NULL DEFAULT '0',
  `date_paid` date NOT NULL,
  `burned` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`customer_reward_id`),
  KEY `customer_id` (`customer_id`),
  KEY `order_id` (`order_id`),
  KEY `reason_code` (`reason_code`),
  KEY `points` (`points`),
  KEY `date_added` (`date_added`),
  KEY `burned` (`burned`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_reward_queue`
--

DROP TABLE IF EXISTS `customer_reward_queue`;
CREATE TABLE IF NOT EXISTS `customer_reward_queue` (
  `customer_reward_queue_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_id` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `reason_code` varchar(32) NOT NULL,
  `date_added` date NOT NULL,
  `points` int NOT NULL,
  `date_activate` date NOT NULL,
  PRIMARY KEY (`customer_reward_queue_id`),
  KEY `customer_id` (`customer_id`),
  KEY `order_id` (`order_id`),
  KEY `reason_code` (`reason_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_search_history`
--

DROP TABLE IF EXISTS `customer_search_history`;
CREATE TABLE IF NOT EXISTS `customer_search_history` (
  `customer_history_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `text` varchar(500) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`),
  UNIQUE KEY `customer_id_text` (`customer_id`,`text`) USING BTREE,
  KEY `customer_id` (`customer_id`),
  KEY `text` (`text`),
  KEY `date_added` (`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_segments`
--

DROP TABLE IF EXISTS `customer_segments`;
CREATE TABLE IF NOT EXISTS `customer_segments` (
  `customer_id` int NOT NULL,
  `segment_id` int NOT NULL,
  `date_added` date NOT NULL,
  UNIQUE KEY `customer_id_2` (`customer_id`,`segment_id`),
  KEY `customer_id` (`customer_id`),
  KEY `segment_id` (`segment_id`),
  KEY `date_added` (`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_simple_fields`
--

DROP TABLE IF EXISTS `customer_simple_fields`;
CREATE TABLE IF NOT EXISTS `customer_simple_fields` (
  `customer_id` int NOT NULL,
  `metadata` text,
  `newsletter_news` text,
  `newsletter_personal` text,
  `viber_news` text,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_test`
--

DROP TABLE IF EXISTS `customer_test`;
CREATE TABLE IF NOT EXISTS `customer_test` (
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_transaction`
--

DROP TABLE IF EXISTS `customer_transaction`;
CREATE TABLE IF NOT EXISTS `customer_transaction` (
  `customer_transaction_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_id` int NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `amount_national` decimal(15,4) NOT NULL,
  `currency_code` varchar(10) NOT NULL,
  `date_added` datetime NOT NULL,
  `sms_sent` datetime DEFAULT NULL,
  `equiring` tinyint(1) NOT NULL DEFAULT '0',
  `added_from` varchar(40) NOT NULL,
  `account` varchar(64) NOT NULL,
  `legalperson_id` int NOT NULL,
  `paykeeper_id` varchar(255) NOT NULL,
  `concardis_id` varchar(255) NOT NULL,
  `f3_id` varchar(255) NOT NULL,
  `f3_paykeeper` text NOT NULL,
  `f3_ofd` text NOT NULL,
  `f3_ofd_link` text NOT NULL,
  `pspReference` varchar(128) NOT NULL,
  `guid` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `json` text NOT NULL,
  PRIMARY KEY (`customer_transaction_id`),
  KEY `customer_id` (`customer_id`),
  KEY `order_id` (`order_id`),
  KEY `paykeeper_id` (`paykeeper_id`),
  KEY `pspReference` (`pspReference`),
  KEY `concardis_id` (`concardis_id`),
  KEY `guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `customer_viewed`
--

DROP TABLE IF EXISTS `customer_viewed`;
CREATE TABLE IF NOT EXISTS `customer_viewed` (
  `customer_id` int NOT NULL,
  `type` enum('c','m','p') NOT NULL,
  `entity_id` int NOT NULL,
  `times` int NOT NULL DEFAULT '1',
  UNIQUE KEY `customer_id_2` (`customer_id`,`type`,`entity_id`),
  KEY `customer_id` (`customer_id`),
  KEY `type` (`type`),
  KEY `entity_id` (`entity_id`),
  KEY `times` (`times`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field`
--

DROP TABLE IF EXISTS `custom_field`;
CREATE TABLE IF NOT EXISTS `custom_field` (
  `custom_field_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  `location` varchar(32) NOT NULL,
  `position` int NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_description`
--

DROP TABLE IF EXISTS `custom_field_description`;
CREATE TABLE IF NOT EXISTS `custom_field_description` (
  `custom_field_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_to_customer_group`
--

DROP TABLE IF EXISTS `custom_field_to_customer_group`;
CREATE TABLE IF NOT EXISTS `custom_field_to_customer_group` (
  `custom_field_id` int NOT NULL,
  `customer_group_id` int NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`),
  KEY `customer_group_id` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_value`
--

DROP TABLE IF EXISTS `custom_field_value`;
CREATE TABLE IF NOT EXISTS `custom_field_value` (
  `custom_field_value_id` int NOT NULL AUTO_INCREMENT,
  `custom_field_id` int NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`custom_field_value_id`),
  KEY `custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_value_description`
--

DROP TABLE IF EXISTS `custom_field_value_description`;
CREATE TABLE IF NOT EXISTS `custom_field_value_description` (
  `custom_field_value_id` int NOT NULL,
  `language_id` int NOT NULL,
  `custom_field_id` int NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`),
  KEY `language_id` (`language_id`),
  KEY `custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `custom_url_404`
--

DROP TABLE IF EXISTS `custom_url_404`;
CREATE TABLE IF NOT EXISTS `custom_url_404` (
  `custom_url_404_id` int NOT NULL AUTO_INCREMENT,
  `hit` int DEFAULT NULL,
  `url_404` varchar(255) DEFAULT NULL,
  `url_redirect` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`custom_url_404_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_asins`
--

DROP TABLE IF EXISTS `deleted_asins`;
CREATE TABLE IF NOT EXISTS `deleted_asins` (
  `asin` varchar(16) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`asin`),
  KEY `user_id` (`user_id`),
  KEY `name` (`name`(768))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `direct_timezones`
--

DROP TABLE IF EXISTS `direct_timezones`;
CREATE TABLE IF NOT EXISTS `direct_timezones` (
  `geomd5` varchar(64) NOT NULL,
  `timezone` varchar(40) NOT NULL,
  PRIMARY KEY (`geomd5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

DROP TABLE IF EXISTS `download`;
CREATE TABLE IF NOT EXISTS `download` (
  `download_id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `download_description`
--

DROP TABLE IF EXISTS `download_description`;
CREATE TABLE IF NOT EXISTS `download_description` (
  `download_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `emailmarketing_logs`
--

DROP TABLE IF EXISTS `emailmarketing_logs`;
CREATE TABLE IF NOT EXISTS `emailmarketing_logs` (
  `emailmarketing_log_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `store_id` int NOT NULL,
  `actiontemplate_id` int NOT NULL,
  `mail_from` varchar(255) NOT NULL,
  `mail_from_email` varchar(255) NOT NULL,
  `mail_to` varchar(255) NOT NULL,
  `mail_to_email` varchar(255) NOT NULL,
  `date_sent` datetime NOT NULL,
  `html` longtext NOT NULL,
  `title` varchar(500) NOT NULL,
  `transmission_id` varchar(255) NOT NULL,
  `mail_status` varchar(20) NOT NULL,
  `mail_opened` int NOT NULL,
  `mail_clicked` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`emailmarketing_log_id`),
  KEY `customer_id` (`customer_id`),
  KEY `actiontemplate_id` (`actiontemplate_id`),
  KEY `store_id` (`store_id`),
  KEY `date_sent` (`date_sent`),
  KEY `user_id` (`user_id`),
  KEY `mail_opened` (`mail_opened`),
  KEY `mail_clicked` (`mail_clicked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `emailtemplate`
--

DROP TABLE IF EXISTS `emailtemplate`;
CREATE TABLE IF NOT EXISTS `emailtemplate` (
  `emailtemplate_id` int NOT NULL AUTO_INCREMENT,
  `emailtemplate_key` varchar(64) NOT NULL,
  `emailtemplate_label` varchar(255) NOT NULL,
  `emailtemplate_template` varchar(255) NOT NULL,
  `emailtemplate_mail_to` varchar(255) NOT NULL,
  `emailtemplate_mail_cc` varchar(255) NOT NULL,
  `emailtemplate_mail_bcc` varchar(255) NOT NULL,
  `emailtemplate_mail_from` varchar(255) NOT NULL,
  `emailtemplate_mail_sender` varchar(255) NOT NULL,
  `emailtemplate_mail_replyto` varchar(255) NOT NULL,
  `emailtemplate_mail_replyto_name` varchar(255) NOT NULL,
  `emailtemplate_mail_attachment` varchar(255) NOT NULL,
  `emailtemplate_attach_invoice` tinyint(1) NOT NULL DEFAULT '0',
  `emailtemplate_language_files` varchar(255) NOT NULL,
  `emailtemplate_wrapper_tpl` varchar(255) NOT NULL,
  `emailtemplate_tracking_campaign_source` varchar(255) NOT NULL,
  `emailtemplate_status` enum('ENABLED','DISABLED') NOT NULL,
  `emailtemplate_default` tinyint(1) NOT NULL DEFAULT '1',
  `emailtemplate_shortcodes` tinyint(1) NOT NULL DEFAULT '0',
  `emailtemplate_showcase` tinyint(1) NOT NULL DEFAULT '1',
  `emailtemplate_plain_text` tinyint(1) NOT NULL DEFAULT '0',
  `emailtemplate_integrate_extension` tinyint(1) NOT NULL DEFAULT '0',
  `emailtemplate_condition` text NOT NULL COMMENT 'serialized array[](key,operator,value,label)',
  `emailtemplate_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `emailtemplate_log` tinyint(1) NOT NULL,
  `emailtemplate_view_browser` tinyint(1) NOT NULL,
  `emailtemplate_view_browser_theme` tinyint(1) NOT NULL,
  `emailtemplate_config_id` int NOT NULL,
  `store_id` int DEFAULT NULL,
  `customer_group_id` int DEFAULT NULL,
  `order_status_id` int DEFAULT NULL,
  PRIMARY KEY (`emailtemplate_id`),
  KEY `KEY` (`emailtemplate_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `emailtemplate_config`
--

DROP TABLE IF EXISTS `emailtemplate_config`;
CREATE TABLE IF NOT EXISTS `emailtemplate_config` (
  `emailtemplate_config_id` int NOT NULL AUTO_INCREMENT,
  `emailtemplate_config_name` varchar(64) NOT NULL,
  `emailtemplate_config_email_width` smallint NOT NULL,
  `emailtemplate_config_email_responsive` tinyint(1) NOT NULL,
  `emailtemplate_config_page_bg_color` varchar(32) NOT NULL,
  `emailtemplate_config_body_bg_color` varchar(32) NOT NULL,
  `emailtemplate_config_body_font_color` varchar(32) NOT NULL,
  `emailtemplate_config_body_link_color` varchar(32) NOT NULL,
  `emailtemplate_config_body_heading_color` varchar(32) NOT NULL,
  `emailtemplate_config_body_section_bg_color` varchar(32) NOT NULL,
  `emailtemplate_config_page_footer_text` text NOT NULL,
  `emailtemplate_config_footer_text` text NOT NULL,
  `emailtemplate_config_footer_align` varchar(32) NOT NULL,
  `emailtemplate_config_footer_valign` varchar(32) NOT NULL,
  `emailtemplate_config_footer_font_color` varchar(32) NOT NULL,
  `emailtemplate_config_footer_height` smallint NOT NULL,
  `emailtemplate_config_footer_section_bg_color` varchar(32) NOT NULL,
  `emailtemplate_config_header_bg_color` varchar(32) NOT NULL,
  `emailtemplate_config_header_bg_image` varchar(255) NOT NULL,
  `emailtemplate_config_header_height` smallint NOT NULL,
  `emailtemplate_config_header_border_color` varchar(32) NOT NULL,
  `emailtemplate_config_header_section_bg_color` varchar(32) NOT NULL,
  `emailtemplate_config_head_text` text NOT NULL,
  `emailtemplate_config_head_section_bg_color` varchar(32) NOT NULL,
  `emailtemplate_config_view_browser_text` text NOT NULL,
  `emailtemplate_config_invoice_color` varchar(32) NOT NULL,
  `emailtemplate_config_invoice_download` tinyint(1) NOT NULL DEFAULT '1',
  `emailtemplate_config_invoice_header` text NOT NULL,
  `emailtemplate_config_invoice_footer` text NOT NULL,
  `emailtemplate_config_logo` varchar(255) NOT NULL,
  `emailtemplate_config_logo_align` varchar(32) NOT NULL,
  `emailtemplate_config_logo_font_color` varchar(32) NOT NULL,
  `emailtemplate_config_logo_font_size` smallint NOT NULL,
  `emailtemplate_config_logo_height` smallint NOT NULL,
  `emailtemplate_config_logo_valign` varchar(32) NOT NULL,
  `emailtemplate_config_logo_width` smallint NOT NULL,
  `emailtemplate_config_shadow_top` text NOT NULL,
  `emailtemplate_config_shadow_left` text NOT NULL,
  `emailtemplate_config_shadow_right` text NOT NULL,
  `emailtemplate_config_shadow_bottom` text NOT NULL,
  `emailtemplate_config_showcase` varchar(32) NOT NULL,
  `emailtemplate_config_showcase_limit` smallint NOT NULL,
  `emailtemplate_config_showcase_selection` varchar(255) NOT NULL,
  `emailtemplate_config_showcase_title` varchar(255) NOT NULL,
  `emailtemplate_config_showcase_related` tinyint(1) NOT NULL,
  `emailtemplate_config_showcase_section_bg_color` varchar(32) NOT NULL,
  `emailtemplate_config_page_align` enum('left','right','center') NOT NULL DEFAULT 'center',
  `emailtemplate_config_text_align` varchar(32) NOT NULL,
  `emailtemplate_config_tracking` tinyint(1) NOT NULL DEFAULT '1',
  `emailtemplate_config_tracking_campaign_name` varchar(255) NOT NULL,
  `emailtemplate_config_tracking_campaign_term` varchar(255) NOT NULL,
  `emailtemplate_config_wrapper_tpl` varchar(255) NOT NULL,
  `emailtemplate_config_theme` varchar(64) NOT NULL,
  `emailtemplate_config_table_quantity` tinyint(1) NOT NULL,
  `emailtemplate_config_customer_register_validate_email` tinyint(1) NOT NULL,
  `emailtemplate_config_style` varchar(64) NOT NULL,
  `emailtemplate_config_version` varchar(64) NOT NULL,
  `emailtemplate_config_status` enum('ENABLED','DISABLED') NOT NULL,
  `emailtemplate_config_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `emailtemplate_config_log` tinyint(1) NOT NULL,
  `emailtemplate_config_log_read` tinyint(1) NOT NULL,
  `customer_group_id` int NOT NULL,
  `store_id` int NOT NULL,
  `language_id` int NOT NULL,
  PRIMARY KEY (`emailtemplate_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `emailtemplate_description`
--

DROP TABLE IF EXISTS `emailtemplate_description`;
CREATE TABLE IF NOT EXISTS `emailtemplate_description` (
  `emailtemplate_id` int NOT NULL,
  `language_id` int NOT NULL,
  `emailtemplate_description_subject` varchar(120) NOT NULL,
  `emailtemplate_description_preview` varchar(255) NOT NULL,
  `emailtemplate_description_content1` longtext NOT NULL,
  `emailtemplate_description_content2` longtext NOT NULL,
  `emailtemplate_description_content3` longtext NOT NULL,
  `emailtemplate_description_comment` longtext NOT NULL,
  `emailtemplate_description_unsubscribe_text` varchar(255) NOT NULL,
  PRIMARY KEY (`emailtemplate_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `emailtemplate_logs`
--

DROP TABLE IF EXISTS `emailtemplate_logs`;
CREATE TABLE IF NOT EXISTS `emailtemplate_logs` (
  `emailtemplate_log_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `emailtemplate_log_sent` datetime DEFAULT NULL,
  `emailtemplate_log_read` datetime DEFAULT NULL,
  `emailtemplate_log_read_last` datetime DEFAULT NULL,
  `emailtemplate_log_type` enum('','SYSTEM','CONTACT','MARKETING') NOT NULL,
  `emailtemplate_log_to` varchar(255) NOT NULL,
  `emailtemplate_log_from` varchar(255) NOT NULL,
  `emailtemplate_log_sender` varchar(255) NOT NULL,
  `emailtemplate_log_subject` varchar(255) NOT NULL,
  `emailtemplate_log_text` longtext NOT NULL,
  `emailtemplate_log_html` longtext NOT NULL,
  `emailtemplate_log_content` longtext NOT NULL,
  `emailtemplate_log_enc` varchar(255) NOT NULL,
  `emailtemplate_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `order_id` int NOT NULL,
  `store_id` int NOT NULL,
  `transmission_id` varchar(255) NOT NULL DEFAULT '0',
  `mail_status` varchar(30) DEFAULT NULL,
  `mail_opened` int NOT NULL DEFAULT '0',
  `mail_clicked` int NOT NULL DEFAULT '0',
  `marketing` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`emailtemplate_log_id`),
  KEY `transmission_id` (`transmission_id`),
  KEY `customer_id` (`customer_id`),
  KEY `order_id` (`order_id`),
  KEY `store_id` (`store_id`),
  KEY `marketing` (`marketing`),
  KEY `mail_status` (`mail_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `emailtemplate_shortcode`
--

DROP TABLE IF EXISTS `emailtemplate_shortcode`;
CREATE TABLE IF NOT EXISTS `emailtemplate_shortcode` (
  `emailtemplate_shortcode_id` int NOT NULL AUTO_INCREMENT,
  `emailtemplate_shortcode_code` varchar(255) NOT NULL,
  `emailtemplate_shortcode_type` enum('language','auto','auto_serialize') NOT NULL DEFAULT 'language',
  `emailtemplate_shortcode_example` text NOT NULL,
  `emailtemplate_id` int NOT NULL,
  PRIMARY KEY (`emailtemplate_shortcode_id`),
  KEY `emailtemplate_id` (`emailtemplate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `email_emailto`
--

DROP TABLE IF EXISTS `email_emailto`;
CREATE TABLE IF NOT EXISTS `email_emailto` (
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `entity_reward`
--

DROP TABLE IF EXISTS `entity_reward`;
CREATE TABLE IF NOT EXISTS `entity_reward` (
  `entity_reward_id` int NOT NULL AUTO_INCREMENT,
  `entity_id` int NOT NULL,
  `entity_type` enum('c','m','co','') NOT NULL,
  `points` int NOT NULL DEFAULT '0',
  `percent` int NOT NULL DEFAULT '0',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `coupon_acts` tinyint(1) NOT NULL DEFAULT '0',
  `store_id` int NOT NULL,
  PRIMARY KEY (`entity_reward_id`),
  KEY `entity_type` (`entity_type`),
  KEY `store_id` (`store_id`),
  KEY `date_end` (`date_end`),
  KEY `date_start` (`date_start`),
  KEY `entity_id` (`entity_id`),
  KEY `points` (`points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `excluded_asins`
--

DROP TABLE IF EXISTS `excluded_asins`;
CREATE TABLE IF NOT EXISTS `excluded_asins` (
  `text` varchar(255) NOT NULL,
  `category_id` int NOT NULL DEFAULT '0',
  `times` int NOT NULL,
  `date_added` datetime NOT NULL,
  `user_id` int NOT NULL,
  KEY `category_id` (`category_id`),
  KEY `text` (`text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extension`
--

DROP TABLE IF EXISTS `extension`;
CREATE TABLE IF NOT EXISTS `extension` (
  `extension_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `facategory`
--

DROP TABLE IF EXISTS `facategory`;
CREATE TABLE IF NOT EXISTS `facategory` (
  `facategory_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`facategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `facategory_to_faproduct`
--

DROP TABLE IF EXISTS `facategory_to_faproduct`;
CREATE TABLE IF NOT EXISTS `facategory_to_faproduct` (
  `facategory_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`facategory_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `faproduct_to_facategory`
--

DROP TABLE IF EXISTS `faproduct_to_facategory`;
CREATE TABLE IF NOT EXISTS `faproduct_to_facategory` (
  `product_id` int NOT NULL,
  `facategory_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`facategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `faq_category`
--

DROP TABLE IF EXISTS `faq_category`;
CREATE TABLE IF NOT EXISTS `faq_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `faq_category_description`
--

DROP TABLE IF EXISTS `faq_category_description`;
CREATE TABLE IF NOT EXISTS `faq_category_description` (
  `category_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `faq_question`
--

DROP TABLE IF EXISTS `faq_question`;
CREATE TABLE IF NOT EXISTS `faq_question` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `status` int NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `faq_question_description`
--

DROP TABLE IF EXISTS `faq_question_description`;
CREATE TABLE IF NOT EXISTS `faq_question_description` (
  `question_id` int NOT NULL,
  `language_id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `feed_queue`
--

DROP TABLE IF EXISTS `feed_queue`;
CREATE TABLE IF NOT EXISTS `feed_queue` (
  `category_id` int NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `filter`
--

DROP TABLE IF EXISTS `filter`;
CREATE TABLE IF NOT EXISTS `filter` (
  `filter_id` int NOT NULL AUTO_INCREMENT,
  `filter_group_id` int NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`filter_id`),
  KEY `filter_group_id` (`filter_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `filterpro_seo`
--

DROP TABLE IF EXISTS `filterpro_seo`;
CREATE TABLE IF NOT EXISTS `filterpro_seo` (
  `url` varchar(255) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `filter_description`
--

DROP TABLE IF EXISTS `filter_description`;
CREATE TABLE IF NOT EXISTS `filter_description` (
  `filter_id` int NOT NULL,
  `language_id` int NOT NULL,
  `filter_group_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`),
  KEY `language_id` (`language_id`),
  KEY `filter_group_id` (`filter_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `filter_group`
--

DROP TABLE IF EXISTS `filter_group`;
CREATE TABLE IF NOT EXISTS `filter_group` (
  `filter_group_id` int NOT NULL AUTO_INCREMENT,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `filter_group_description`
--

DROP TABLE IF EXISTS `filter_group_description`;
CREATE TABLE IF NOT EXISTS `filter_group_description` (
  `filter_group_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `geo`
--

DROP TABLE IF EXISTS `geo`;
CREATE TABLE IF NOT EXISTS `geo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `zone_id` int NOT NULL,
  `name` varchar(128) NOT NULL,
  `full_name` varchar(512) NOT NULL,
  `postcode` varchar(6) NOT NULL,
  `parent_id` int NOT NULL,
  `lat` double(10,6) NOT NULL,
  `long` float(10,6) NOT NULL,
  `population` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `geoname_alternatename`
--

DROP TABLE IF EXISTS `geoname_alternatename`;
CREATE TABLE IF NOT EXISTS `geoname_alternatename` (
  `alternatenameId` int NOT NULL,
  `geonameid` int DEFAULT NULL,
  `isoLanguage` varchar(7) DEFAULT NULL,
  `alternateName` varchar(200) DEFAULT NULL,
  `isPreferredName` tinyint(1) DEFAULT NULL,
  `isShortName` tinyint(1) DEFAULT NULL,
  `isColloquial` tinyint(1) DEFAULT NULL,
  `isHistoric` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`alternatenameId`),
  KEY `geonameid` (`geonameid`),
  KEY `isoLanguage` (`isoLanguage`),
  KEY `alternateName` (`alternateName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `geoname_geoname`
--

DROP TABLE IF EXISTS `geoname_geoname`;
CREATE TABLE IF NOT EXISTS `geoname_geoname` (
  `geonameid` int NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `asciiname` varchar(200) DEFAULT NULL,
  `alternatenames` varchar(4000) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `fclass` char(1) DEFAULT NULL,
  `fcode` varchar(10) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `cc2` varchar(200) DEFAULT NULL,
  `admin1` varchar(20) DEFAULT NULL,
  `admin2` varchar(80) DEFAULT NULL,
  `admin3` varchar(20) DEFAULT NULL,
  `admin4` varchar(20) DEFAULT NULL,
  `population` int DEFAULT NULL,
  `elevation` int DEFAULT NULL,
  `gtopo30` int DEFAULT NULL,
  `timezone` varchar(40) DEFAULT NULL,
  `moddate` date DEFAULT NULL,
  PRIMARY KEY (`geonameid`),
  KEY `name` (`name`),
  KEY `asciiname` (`asciiname`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`),
  KEY `fclass` (`fclass`),
  KEY `fcode` (`fcode`),
  KEY `country` (`country`),
  KEY `cc2` (`cc2`),
  KEY `admin1` (`admin1`),
  KEY `population` (`population`),
  KEY `elevation` (`elevation`),
  KEY `timezone` (`timezone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `geo_ip`
--

DROP TABLE IF EXISTS `geo_ip`;
CREATE TABLE IF NOT EXISTS `geo_ip` (
  `start` bigint NOT NULL,
  `end` bigint NOT NULL,
  `geo_id` int NOT NULL,
  PRIMARY KEY (`start`,`end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `geo_zone`
--

DROP TABLE IF EXISTS `geo_zone`;
CREATE TABLE IF NOT EXISTS `geo_zone` (
  `geo_zone_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `google_base_category`
--

DROP TABLE IF EXISTS `google_base_category`;
CREATE TABLE IF NOT EXISTS `google_base_category` (
  `google_base_category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`google_base_category_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `hj_any_feed_feeds`
--

DROP TABLE IF EXISTS `hj_any_feed_feeds`;
CREATE TABLE IF NOT EXISTS `hj_any_feed_feeds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `settings` blob,
  `version` varchar(64) DEFAULT NULL,
  `preset` int DEFAULT NULL,
  `fields` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `imagemaps`
--

DROP TABLE IF EXISTS `imagemaps`;
CREATE TABLE IF NOT EXISTS `imagemaps` (
  `imagemap_id` int NOT NULL AUTO_INCREMENT,
  `module_code` varchar(64) NOT NULL,
  `module_id` int NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`imagemap_id`),
  KEY `module_code` (`module_code`),
  KEY `module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

DROP TABLE IF EXISTS `information`;
CREATE TABLE IF NOT EXISTS `information` (
  `information_id` int NOT NULL AUTO_INCREMENT,
  `bottom` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) NOT NULL,
  `igroup` varchar(50) NOT NULL,
  `show_category_id` int NOT NULL,
  PRIMARY KEY (`information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `information_attribute`
--

DROP TABLE IF EXISTS `information_attribute`;
CREATE TABLE IF NOT EXISTS `information_attribute` (
  `information_attribute_id` int NOT NULL AUTO_INCREMENT,
  `bottom` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) NOT NULL,
  `igroup` varchar(50) NOT NULL,
  `show_category_id` int NOT NULL,
  PRIMARY KEY (`information_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `information_attribute_description`
--

DROP TABLE IF EXISTS `information_attribute_description`;
CREATE TABLE IF NOT EXISTS `information_attribute_description` (
  `information_attribute_id` int NOT NULL,
  `language_id` int NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `seo_title` varchar(255) DEFAULT '',
  `meta_description` text,
  `meta_keyword` text,
  `tag` text,
  PRIMARY KEY (`information_attribute_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `information_attribute_to_layout`
--

DROP TABLE IF EXISTS `information_attribute_to_layout`;
CREATE TABLE IF NOT EXISTS `information_attribute_to_layout` (
  `information_attribute_id` int NOT NULL,
  `store_id` int NOT NULL,
  `layout_id` int NOT NULL,
  PRIMARY KEY (`information_attribute_id`,`store_id`),
  KEY `store_id` (`store_id`),
  KEY `layout_id` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `information_attribute_to_store`
--

DROP TABLE IF EXISTS `information_attribute_to_store`;
CREATE TABLE IF NOT EXISTS `information_attribute_to_store` (
  `information_attribute_id` int NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`information_attribute_id`,`store_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `information_description`
--

DROP TABLE IF EXISTS `information_description`;
CREATE TABLE IF NOT EXISTS `information_description` (
  `information_id` int NOT NULL,
  `language_id` int NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `seo_title` varchar(255) DEFAULT '',
  `meta_description` text,
  `meta_keyword` text,
  `tag` text,
  PRIMARY KEY (`information_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `information_to_layout`
--

DROP TABLE IF EXISTS `information_to_layout`;
CREATE TABLE IF NOT EXISTS `information_to_layout` (
  `information_id` int NOT NULL,
  `store_id` int NOT NULL,
  `layout_id` int NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`),
  KEY `store_id` (`store_id`),
  KEY `layout_id` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `information_to_store`
--

DROP TABLE IF EXISTS `information_to_store`;
CREATE TABLE IF NOT EXISTS `information_to_store` (
  `information_id` int NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `interplusplus`
--

DROP TABLE IF EXISTS `interplusplus`;
CREATE TABLE IF NOT EXISTS `interplusplus` (
  `inter_id` int NOT NULL AUTO_INCREMENT,
  `num_order` int DEFAULT NULL,
  `sum` int DEFAULT NULL,
  `user` text,
  `email` text,
  `status` text,
  `date_created` datetime DEFAULT NULL,
  `date_enroled` date DEFAULT NULL,
  PRIMARY KEY (`inter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `justin_cities`
--

DROP TABLE IF EXISTS `justin_cities`;
CREATE TABLE IF NOT EXISTS `justin_cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `Uuid` varchar(64) NOT NULL,
  `Descr` varchar(255) NOT NULL,
  `DescrRU` varchar(255) NOT NULL,
  `Code` varchar(255) NOT NULL,
  `RegionUuid` varchar(64) NOT NULL,
  `RegionDescr` varchar(255) NOT NULL,
  `RegionDescrRU` varchar(255) NOT NULL,
  `SCOATOU` varchar(255) NOT NULL,
  `WarehouseCount` int NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `Uuid` (`Uuid`),
  KEY `RegionUuid` (`RegionUuid`),
  KEY `Descr` (`Descr`),
  KEY `DescrRU` (`DescrRU`),
  KEY `WarehouseCount` (`WarehouseCount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `justin_city_regions`
--

DROP TABLE IF EXISTS `justin_city_regions`;
CREATE TABLE IF NOT EXISTS `justin_city_regions` (
  `region_id` int NOT NULL AUTO_INCREMENT,
  `Uuid` varchar(64) NOT NULL,
  `Descr` varchar(255) NOT NULL,
  `DescrRU` varchar(255) NOT NULL,
  `Code` varchar(255) NOT NULL,
  `CityUuid` varchar(64) NOT NULL,
  `CityDescr` varchar(255) NOT NULL,
  `CityDescrRU` varchar(255) NOT NULL,
  `SCOATOU` varchar(255) NOT NULL,
  PRIMARY KEY (`region_id`),
  UNIQUE KEY `Uuid` (`Uuid`),
  KEY `CityUuid` (`CityUuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `justin_streets`
--

DROP TABLE IF EXISTS `justin_streets`;
CREATE TABLE IF NOT EXISTS `justin_streets` (
  `street_id` int NOT NULL AUTO_INCREMENT,
  `Uuid` varchar(64) NOT NULL,
  `Code` varchar(64) NOT NULL,
  `Descr` varchar(255) NOT NULL,
  `DescrRU` varchar(255) NOT NULL,
  `CityUuid` varchar(64) NOT NULL,
  `CityDescr` varchar(255) NOT NULL,
  `CityDescrRU` varchar(255) NOT NULL,
  PRIMARY KEY (`street_id`),
  UNIQUE KEY `Uuid` (`Uuid`),
  KEY `CityUuid` (`CityUuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `justin_warehouses`
--

DROP TABLE IF EXISTS `justin_warehouses`;
CREATE TABLE IF NOT EXISTS `justin_warehouses` (
  `warehouse_id` int NOT NULL AUTO_INCREMENT,
  `Uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DescrRU` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Code` varchar(64) NOT NULL,
  `RegionUuid` varchar(64) NOT NULL,
  `CityUuid` varchar(64) NOT NULL,
  `CityDescr` varchar(255) NOT NULL,
  `CityDescrRU` varchar(255) NOT NULL,
  `possibility_to_pay_by_card` tinyint(1) NOT NULL,
  `possibility_to_accept_payment` tinyint(1) NOT NULL,
  `availability_of_parcel_locker` tinyint(1) NOT NULL,
  `Address` varchar(500) NOT NULL,
  `Lat` varchar(32) NOT NULL,
  `Lng` varchar(32) NOT NULL,
  `departNumber` int NOT NULL,
  `houseNumber` varchar(32) NOT NULL,
  `StatusDepart` int NOT NULL,
  `parcels_without_pay` tinyint(1) NOT NULL,
  `Monday` varchar(32) NOT NULL,
  `Tuesday` varchar(32) NOT NULL,
  `Wednesday` varchar(32) NOT NULL,
  `Thursday` varchar(32) NOT NULL,
  `Friday` varchar(32) NOT NULL,
  `Saturday` varchar(32) NOT NULL,
  `Sunday` varchar(32) NOT NULL,
  PRIMARY KEY (`warehouse_id`),
  UNIQUE KEY `Uuid` (`Uuid`),
  KEY `StatusDepart` (`StatusDepart`),
  KEY `RegionUuid` (`RegionUuid`),
  KEY `CityUuid` (`CityUuid`),
  KEY `CityDescr` (`CityDescr`),
  KEY `CityDescrRU` (`CityDescrRU`),
  KEY `Descr` (`Descr`),
  KEY `DescrRU` (`DescrRU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `justin_zones`
--

DROP TABLE IF EXISTS `justin_zones`;
CREATE TABLE IF NOT EXISTS `justin_zones` (
  `zone_id` int NOT NULL AUTO_INCREMENT,
  `Uuid` varchar(64) NOT NULL,
  `Code` varchar(32) NOT NULL,
  `Descr` varchar(255) NOT NULL,
  `DescrRu` varchar(255) NOT NULL,
  `SCOATOU` varchar(255) NOT NULL,
  PRIMARY KEY (`zone_id`),
  UNIQUE KEY `Uuid` (`Uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `justin_zone_regions`
--

DROP TABLE IF EXISTS `justin_zone_regions`;
CREATE TABLE IF NOT EXISTS `justin_zone_regions` (
  `region_id` int NOT NULL AUTO_INCREMENT,
  `Uuid` varchar(64) NOT NULL,
  `Code` varchar(64) NOT NULL,
  `Descr` varchar(255) NOT NULL,
  `DescrRU` varchar(255) NOT NULL,
  `ZoneUuid` varchar(64) NOT NULL,
  `ZoneDescr` varchar(255) NOT NULL,
  `ZoneDescrRU` varchar(255) NOT NULL,
  `ZoneType` varchar(255) NOT NULL,
  PRIMARY KEY (`region_id`),
  UNIQUE KEY `Uuid` (`Uuid`),
  KEY `ZoneUuid` (`ZoneUuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keyworder`
--

DROP TABLE IF EXISTS `keyworder`;
CREATE TABLE IF NOT EXISTS `keyworder` (
  `keyworder_id` int NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`keyworder_id`),
  KEY `manufacturer_id` (`manufacturer_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `keyworder_description`
--

DROP TABLE IF EXISTS `keyworder_description`;
CREATE TABLE IF NOT EXISTS `keyworder_description` (
  `keyworder_id` int NOT NULL,
  `language_id` int NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category_status` tinyint(1) NOT NULL DEFAULT '1',
  `keyworder_status` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`keyworder_id`,`language_id`),
  KEY `keyworder_status` (`keyworder_status`),
  KEY `category_status` (`category_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `landingpage`
--

DROP TABLE IF EXISTS `landingpage`;
CREATE TABLE IF NOT EXISTS `landingpage` (
  `landingpage_id` int NOT NULL AUTO_INCREMENT,
  `bottom` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) NOT NULL,
  `viewed` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`landingpage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `landingpage_description`
--

DROP TABLE IF EXISTS `landingpage_description`;
CREATE TABLE IF NOT EXISTS `landingpage_description` (
  `landingpage_id` int NOT NULL,
  `language_id` int NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `seo_title` varchar(255) DEFAULT '',
  `meta_description` text,
  `meta_keyword` text,
  `tag` text,
  PRIMARY KEY (`landingpage_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `landingpage_to_layout`
--

DROP TABLE IF EXISTS `landingpage_to_layout`;
CREATE TABLE IF NOT EXISTS `landingpage_to_layout` (
  `landingpage_id` int NOT NULL,
  `store_id` int NOT NULL,
  `layout_id` int NOT NULL,
  PRIMARY KEY (`landingpage_id`,`store_id`),
  KEY `store_id` (`store_id`),
  KEY `layout_id` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `landingpage_to_store`
--

DROP TABLE IF EXISTS `landingpage_to_store`;
CREATE TABLE IF NOT EXISTS `landingpage_to_store` (
  `landingpage_id` int NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`landingpage_id`,`store_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `urlcode` varchar(2) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `switch` varchar(5) NOT NULL,
  `hreflang` varchar(10) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `fasttranslate` longtext NOT NULL,
  `front` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`),
  KEY `urlcode` (`urlcode`),
  KEY `front` (`front`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `layout`
--

DROP TABLE IF EXISTS `layout`;
CREATE TABLE IF NOT EXISTS `layout` (
  `layout_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `layout_route`
--

DROP TABLE IF EXISTS `layout_route`;
CREATE TABLE IF NOT EXISTS `layout_route` (
  `layout_route_id` int NOT NULL AUTO_INCREMENT,
  `layout_id` int NOT NULL,
  `store_id` int NOT NULL,
  `route` varchar(255) NOT NULL,
  `template` varchar(500) NOT NULL,
  PRIMARY KEY (`layout_route_id`),
  KEY `layout_id` (`layout_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `legalperson`
--

DROP TABLE IF EXISTS `legalperson`;
CREATE TABLE IF NOT EXISTS `legalperson` (
  `legalperson_id` int NOT NULL AUTO_INCREMENT,
  `legalperson_name` varchar(255) NOT NULL,
  `legalperson_name_1C` varchar(255) NOT NULL,
  `legalperson_desc` text NOT NULL,
  `legalperson_additional` text NOT NULL,
  `legalperson_print` varchar(255) NOT NULL,
  `legalperson_legal` tinyint(1) NOT NULL,
  `legalperson_country_id` int NOT NULL,
  `account_info` mediumtext,
  PRIMARY KEY (`legalperson_id`),
  KEY `legalperson_country_id` (`legalperson_country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `length_class`
--

DROP TABLE IF EXISTS `length_class`;
CREATE TABLE IF NOT EXISTS `length_class` (
  `length_class_id` int NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  `system_key` varchar(100) NOT NULL,
  `amazon_key` varchar(100) NOT NULL,
  `variants` varchar(2048) NOT NULL,
  PRIMARY KEY (`length_class_id`),
  KEY `system_key` (`system_key`),
  KEY `amazon_key` (`amazon_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `length_class_description`
--

DROP TABLE IF EXISTS `length_class_description`;
CREATE TABLE IF NOT EXISTS `length_class_description` (
  `length_class_id` int NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `local_supplier_products`
--

DROP TABLE IF EXISTS `local_supplier_products`;
CREATE TABLE IF NOT EXISTS `local_supplier_products` (
  `supplier_id` int NOT NULL,
  `supplier_product_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_model` varchar(255) NOT NULL,
  `product_ean` varchar(20) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `price_recommend` decimal(15,2) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `stock` int NOT NULL,
  `product_xml` text NOT NULL,
  UNIQUE KEY `supplier_id_2` (`supplier_id`,`product_id`),
  KEY `product_id` (`product_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `product_model` (`product_model`),
  KEY `stock` (`stock`),
  KEY `product_ean` (`product_ean`),
  KEY `currency` (`currency`),
  KEY `supplier_product_id` (`supplier_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mailwizz_queue`
--

DROP TABLE IF EXISTS `mailwizz_queue`;
CREATE TABLE IF NOT EXISTS `mailwizz_queue` (
  `customer_id` int NOT NULL,
  UNIQUE KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manager_kpi`
--

DROP TABLE IF EXISTS `manager_kpi`;
CREATE TABLE IF NOT EXISTS `manager_kpi` (
  `manager_id` int NOT NULL,
  `date_added` date NOT NULL,
  `kpi_json` text NOT NULL,
  UNIQUE KEY `manager_id` (`manager_id`,`date_added`),
  KEY `manager_id_2` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `manager_order_status_dynamics`
--

DROP TABLE IF EXISTS `manager_order_status_dynamics`;
CREATE TABLE IF NOT EXISTS `manager_order_status_dynamics` (
  `manager_id` int NOT NULL,
  `order_status_id` int NOT NULL,
  `date` date NOT NULL,
  `count` int NOT NULL,
  UNIQUE KEY `manager_id_2` (`manager_id`,`order_status_id`,`date`),
  KEY `manager_id` (`manager_id`),
  KEY `order_status_id` (`order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `manager_order_status_dynamics2`
--

DROP TABLE IF EXISTS `manager_order_status_dynamics2`;
CREATE TABLE IF NOT EXISTS `manager_order_status_dynamics2` (
  `manager_id` int NOT NULL,
  `order_status_id` int NOT NULL,
  `date` date NOT NULL,
  `count` int NOT NULL,
  UNIQUE KEY `manager_id_2` (`manager_id`,`order_status_id`,`date`),
  KEY `manager_id` (`manager_id`),
  KEY `order_status_id` (`order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE IF NOT EXISTS `manufacturer` (
  `manufacturer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `tip` varchar(15) NOT NULL,
  `menu_brand` tinyint(1) NOT NULL DEFAULT '0',
  `show_goods` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `back_image` varchar(500) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `banner_width` int NOT NULL,
  `banner_height` int NOT NULL,
  `tpl` varchar(255) NOT NULL,
  `priceva_enable` tinyint NOT NULL DEFAULT '0',
  `priceva_feed` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL,
  PRIMARY KEY (`manufacturer_id`),
  KEY `priceva_enable` (`priceva_enable`),
  KEY `priceva_feed` (`priceva_feed`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer_description`
--

DROP TABLE IF EXISTS `manufacturer_description`;
CREATE TABLE IF NOT EXISTS `manufacturer_description` (
  `manufacturer_id` int NOT NULL,
  `language_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `alternate_name` longtext COLLATE utf8mb3_bin NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `short_description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `auto_gen` tinyint(1) NOT NULL DEFAULT '0',
  `seo_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `seo_h1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `tag` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `products_title` varchar(500) COLLATE utf8mb3_bin NOT NULL,
  `products_meta_description` varchar(500) COLLATE utf8mb3_bin NOT NULL,
  `collections_title` varchar(500) COLLATE utf8mb3_bin NOT NULL,
  `collections_meta_description` varchar(500) COLLATE utf8mb3_bin NOT NULL,
  `categories_title` varchar(500) COLLATE utf8mb3_bin NOT NULL,
  `categories_meta_description` varchar(500) COLLATE utf8mb3_bin NOT NULL,
  `articles_title` varchar(500) COLLATE utf8mb3_bin NOT NULL,
  `articles_meta_description` varchar(500) COLLATE utf8mb3_bin NOT NULL,
  `newproducts_title` varchar(500) COLLATE utf8mb3_bin NOT NULL,
  `newproducts_meta_description` varchar(500) COLLATE utf8mb3_bin NOT NULL,
  `special_title` varchar(500) COLLATE utf8mb3_bin NOT NULL,
  `special_meta_description` varchar(500) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`language_id`),
  KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer_page_content`
--

DROP TABLE IF EXISTS `manufacturer_page_content`;
CREATE TABLE IF NOT EXISTS `manufacturer_page_content` (
  `manufacturer_page_content_id` int NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int NOT NULL,
  `language_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `products` text NOT NULL,
  `collections` text NOT NULL,
  `categories` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`manufacturer_page_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer_to_layout`
--

DROP TABLE IF EXISTS `manufacturer_to_layout`;
CREATE TABLE IF NOT EXISTS `manufacturer_to_layout` (
  `manufacturer_id` int NOT NULL,
  `store_id` int NOT NULL,
  `layout_id` int NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer_to_store`
--

DROP TABLE IF EXISTS `manufacturer_to_store`;
CREATE TABLE IF NOT EXISTS `manufacturer_to_store` (
  `manufacturer_id` int NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`),
  KEY `manufacturer_id` (`manufacturer_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `maxmind_geo_country`
--

DROP TABLE IF EXISTS `maxmind_geo_country`;
CREATE TABLE IF NOT EXISTS `maxmind_geo_country` (
  `start` bigint NOT NULL,
  `end` bigint NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  PRIMARY KEY (`start`,`end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `multi_pay_payment`
--

DROP TABLE IF EXISTS `multi_pay_payment`;
CREATE TABLE IF NOT EXISTS `multi_pay_payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `service_cod` varchar(50) DEFAULT NULL,
  `service_account` varchar(40) NOT NULL,
  `operation_id` varchar(40) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `curr` varchar(5) DEFAULT NULL,
  `amount` decimal(16,8) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `operation_id` (`operation_id`),
  KEY `datetime` (`datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `nauthor`
--

DROP TABLE IF EXISTS `nauthor`;
CREATE TABLE IF NOT EXISTS `nauthor` (
  `nauthor_id` int NOT NULL AUTO_INCREMENT,
  `adminid` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`nauthor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `nauthor_description`
--

DROP TABLE IF EXISTS `nauthor_description`;
CREATE TABLE IF NOT EXISTS `nauthor_description` (
  `nauthor_id` int NOT NULL,
  `language_id` int NOT NULL,
  `ctitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`nauthor_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ncategory`
--

DROP TABLE IF EXISTS `ncategory`;
CREATE TABLE IF NOT EXISTS `ncategory` (
  `ncategory_id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ncategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ncategory_description`
--

DROP TABLE IF EXISTS `ncategory_description`;
CREATE TABLE IF NOT EXISTS `ncategory_description` (
  `ncategory_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`ncategory_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ncategory_to_layout`
--

DROP TABLE IF EXISTS `ncategory_to_layout`;
CREATE TABLE IF NOT EXISTS `ncategory_to_layout` (
  `ncategory_id` int NOT NULL,
  `store_id` int NOT NULL,
  `layout_id` int NOT NULL,
  PRIMARY KEY (`ncategory_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ncategory_to_store`
--

DROP TABLE IF EXISTS `ncategory_to_store`;
CREATE TABLE IF NOT EXISTS `ncategory_to_store` (
  `ncategory_id` int NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`ncategory_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ncomments`
--

DROP TABLE IF EXISTS `ncomments`;
CREATE TABLE IF NOT EXISTS `ncomments` (
  `ncomment_id` int NOT NULL AUTO_INCREMENT,
  `news_id` int NOT NULL,
  `language_id` int NOT NULL,
  `reply_id` int NOT NULL DEFAULT '0',
  `author` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ncomment_id`),
  KEY `news_id` (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int NOT NULL AUTO_INCREMENT,
  `nauthor_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `acom` int NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `image2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `gal_thumb_w` int NOT NULL,
  `gal_thumb_h` int NOT NULL,
  `gal_popup_w` int NOT NULL,
  `gal_popup_h` int NOT NULL,
  `gal_slider_h` int NOT NULL,
  `gal_slider_t` int NOT NULL,
  `date_pub` datetime DEFAULT NULL,
  `gal_slider_w` int NOT NULL,
  `viewed` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `news_description`
--

DROP TABLE IF EXISTS `news_description`;
CREATE TABLE IF NOT EXISTS `news_description` (
  `news_id` int NOT NULL DEFAULT '0',
  `language_id` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `ctitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description2` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `meta_desc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `ntags` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `recipe` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `cfield1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `cfield2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `cfield3` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `cfield4` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`news_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `news_gallery`
--

DROP TABLE IF EXISTS `news_gallery`;
CREATE TABLE IF NOT EXISTS `news_gallery` (
  `news_image_id` int NOT NULL AUTO_INCREMENT,
  `news_id` int NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `text` text NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `news_related`
--

DROP TABLE IF EXISTS `news_related`;
CREATE TABLE IF NOT EXISTS `news_related` (
  `news_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`news_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `news_to_layout`
--

DROP TABLE IF EXISTS `news_to_layout`;
CREATE TABLE IF NOT EXISTS `news_to_layout` (
  `news_id` int NOT NULL,
  `store_id` int NOT NULL,
  `layout_id` int NOT NULL,
  PRIMARY KEY (`news_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `news_to_ncategory`
--

DROP TABLE IF EXISTS `news_to_ncategory`;
CREATE TABLE IF NOT EXISTS `news_to_ncategory` (
  `news_id` int NOT NULL,
  `ncategory_id` int NOT NULL,
  PRIMARY KEY (`news_id`,`ncategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `news_to_store`
--

DROP TABLE IF EXISTS `news_to_store`;
CREATE TABLE IF NOT EXISTS `news_to_store` (
  `news_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `news_video`
--

DROP TABLE IF EXISTS `news_video`;
CREATE TABLE IF NOT EXISTS `news_video` (
  `news_video_id` int NOT NULL AUTO_INCREMENT,
  `news_id` int NOT NULL,
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `video` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `width` int NOT NULL,
  `height` int NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `novaposhta_cities`
--

DROP TABLE IF EXISTS `novaposhta_cities`;
CREATE TABLE IF NOT EXISTS `novaposhta_cities` (
  `CityID` int NOT NULL AUTO_INCREMENT,
  `Ref` varchar(36) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `DescriptionRu` varchar(200) NOT NULL,
  `Area` varchar(36) NOT NULL,
  `SettlementType` varchar(36) NOT NULL,
  `SettlementTypeDescription` varchar(200) NOT NULL,
  `SettlementTypeDescriptionRu` varchar(200) NOT NULL,
  `RegionsDescription` varchar(255) NOT NULL,
  `RegionsDescriptionRu` varchar(255) NOT NULL,
  `AreaDescription` varchar(255) NOT NULL,
  `AreaDescriptionRu` varchar(255) NOT NULL,
  `Index1` varchar(32) NOT NULL,
  `Index2` varchar(32) NOT NULL,
  `Delivery1` tinyint(1) NOT NULL,
  `Delivery2` tinyint(1) NOT NULL,
  `Delivery3` tinyint(1) NOT NULL,
  `Delivery4` tinyint(1) NOT NULL,
  `Delivery5` tinyint(1) NOT NULL,
  `Delivery6` tinyint(1) NOT NULL,
  `Delivery7` tinyint(1) NOT NULL,
  `Conglomerates` text NOT NULL,
  `Latitude` varchar(32) NOT NULL,
  `Longitude` varchar(32) NOT NULL,
  `PreventEntryNewStreetsUser` text NOT NULL,
  `IsBranch` tinyint(1) NOT NULL,
  `SpecialCashCheck` tinyint(1) NOT NULL,
  `Warehouse` int NOT NULL,
  `WarehouseCount` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CityID`),
  UNIQUE KEY `Ref` (`Ref`),
  KEY `Area` (`Area`),
  KEY `SettlementType` (`SettlementType`),
  KEY `Description` (`Description`),
  KEY `DescriptionRu` (`DescriptionRu`),
  KEY `WarehouseCount` (`WarehouseCount`),
  KEY `Warehouse` (`Warehouse`),
  KEY `Index1` (`Index1`),
  KEY `Index2` (`Index2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `novaposhta_cities_ww`
--

DROP TABLE IF EXISTS `novaposhta_cities_ww`;
CREATE TABLE IF NOT EXISTS `novaposhta_cities_ww` (
  `CityID` int NOT NULL AUTO_INCREMENT,
  `Ref` varchar(64) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `DescriptionRu` varchar(255) NOT NULL,
  `Delivery1` int NOT NULL,
  `Delivery2` int NOT NULL,
  `Delivery3` int NOT NULL,
  `Delivery4` int NOT NULL,
  `Delivery5` int NOT NULL,
  `Delivery6` int NOT NULL,
  `Delivery7` int NOT NULL,
  `Area` varchar(64) NOT NULL,
  `SettlementType` varchar(64) NOT NULL,
  `SettlementTypeDescriptionRu` varchar(255) NOT NULL,
  `SettlementTypeDescription` int NOT NULL,
  `WarehouseCount` int NOT NULL DEFAULT '0',
  `deliveryPeriod` int NOT NULL,
  PRIMARY KEY (`CityID`),
  UNIQUE KEY `Ref` (`Ref`),
  KEY `Area` (`Area`),
  KEY `WarehouseCount` (`WarehouseCount`),
  KEY `Description` (`Description`),
  KEY `DescriptionRu` (`DescriptionRu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `novaposhta_streets`
--

DROP TABLE IF EXISTS `novaposhta_streets`;
CREATE TABLE IF NOT EXISTS `novaposhta_streets` (
  `StreetID` int NOT NULL AUTO_INCREMENT,
  `Ref` varchar(64) NOT NULL,
  `CityRef` varchar(64) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `DescriptionRu` varchar(500) NOT NULL,
  `StreetsTypeRef` varchar(255) NOT NULL,
  `StreetsType` varchar(255) NOT NULL,
  PRIMARY KEY (`StreetID`),
  UNIQUE KEY `Ref_2` (`Ref`),
  KEY `CityRef` (`CityRef`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `novaposhta_warehouses`
--

DROP TABLE IF EXISTS `novaposhta_warehouses`;
CREATE TABLE IF NOT EXISTS `novaposhta_warehouses` (
  `WarehouseID` int NOT NULL AUTO_INCREMENT,
  `SiteKey` int NOT NULL,
  `Ref` varchar(36) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `DescriptionRu` varchar(500) NOT NULL,
  `ShortAddress` varchar(500) NOT NULL,
  `ShortAddressRu` varchar(500) NOT NULL,
  `TypeOfWarehouseRef` varchar(64) NOT NULL,
  `TypeOfWarehouse` varchar(36) NOT NULL,
  `TypeOfWarehouseRu` varchar(64) NOT NULL,
  `CityRef` varchar(36) NOT NULL,
  `CityDescription` varchar(200) NOT NULL,
  `CityDescriptionRu` varchar(200) NOT NULL,
  `Number` int NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Longitude` double NOT NULL,
  `Latitude` double NOT NULL,
  `PostFinance` tinyint(1) NOT NULL,
  `BicycleParking` tinyint(1) NOT NULL,
  `PaymentAccess` tinyint(1) NOT NULL,
  `POSTerminal` tinyint(1) NOT NULL,
  `InternationalShipping` tinyint(1) NOT NULL,
  `TotalMaxWeightAllowed` int NOT NULL,
  `PlaceMaxWeightAllowed` int NOT NULL,
  `Reception` text NOT NULL,
  `Delivery` text NOT NULL,
  `Schedule` text NOT NULL,
  `DistrictCode` varchar(20) NOT NULL,
  `WarehouseStatus` varchar(20) NOT NULL,
  `CategoryOfWarehouse` varchar(20) NOT NULL,
  PRIMARY KEY (`WarehouseID`),
  UNIQUE KEY `Ref` (`Ref`),
  KEY `WarehouseID` (`WarehouseID`),
  KEY `TypeOfWarehouse` (`TypeOfWarehouse`),
  KEY `CityRef` (`CityRef`),
  KEY `SiteKey` (`SiteKey`),
  KEY `TypeOfWarehouseRef` (`TypeOfWarehouseRef`),
  KEY `TypeOfWarehouseRu` (`TypeOfWarehouseRu`),
  KEY `WarehouseStatus` (`WarehouseStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `novaposhta_zones`
--

DROP TABLE IF EXISTS `novaposhta_zones`;
CREATE TABLE IF NOT EXISTS `novaposhta_zones` (
  `ZoneID` int NOT NULL AUTO_INCREMENT,
  `Ref` varchar(64) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `DescriptionRu` varchar(255) NOT NULL,
  `AreasCenter` varchar(64) NOT NULL,
  PRIMARY KEY (`ZoneID`),
  UNIQUE KEY `Ref` (`Ref`) USING BTREE,
  KEY `AreasCenter` (`AreasCenter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ocfilter_option`
--

DROP TABLE IF EXISTS `ocfilter_option`;
CREATE TABLE IF NOT EXISTS `ocfilter_option` (
  `option_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL DEFAULT 'checkbox',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `selectbox` tinyint(1) NOT NULL DEFAULT '0',
  `grouping` tinyint NOT NULL DEFAULT '0',
  `color` tinyint(1) NOT NULL DEFAULT '0',
  `image` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`),
  KEY `keyword` (`keyword`),
  KEY `status` (`status`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ocfilter_option_description`
--

DROP TABLE IF EXISTS `ocfilter_option_description`;
CREATE TABLE IF NOT EXISTS `ocfilter_option_description` (
  `option_id` int NOT NULL,
  `language_id` tinyint NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `postfix` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ocfilter_option_to_category`
--

DROP TABLE IF EXISTS `ocfilter_option_to_category`;
CREATE TABLE IF NOT EXISTS `ocfilter_option_to_category` (
  `option_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`category_id`,`option_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ocfilter_option_to_store`
--

DROP TABLE IF EXISTS `ocfilter_option_to_store`;
CREATE TABLE IF NOT EXISTS `ocfilter_option_to_store` (
  `option_id` int NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`store_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ocfilter_option_value`
--

DROP TABLE IF EXISTS `ocfilter_option_value`;
CREATE TABLE IF NOT EXISTS `ocfilter_option_value` (
  `value_id` bigint NOT NULL AUTO_INCREMENT,
  `option_id` int NOT NULL DEFAULT '0',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(6) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`value_id`,`option_id`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ocfilter_option_value_description`
--

DROP TABLE IF EXISTS `ocfilter_option_value_description`;
CREATE TABLE IF NOT EXISTS `ocfilter_option_value_description` (
  `value_id` bigint NOT NULL,
  `option_id` int NOT NULL,
  `language_id` tinyint NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`value_id`,`language_id`),
  KEY `option_id` (`option_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ocfilter_option_value_to_product`
--

DROP TABLE IF EXISTS `ocfilter_option_value_to_product`;
CREATE TABLE IF NOT EXISTS `ocfilter_option_value_to_product` (
  `ocfilter_option_value_to_product_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `option_id` int NOT NULL,
  `value_id` bigint NOT NULL,
  `slide_value_min` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `slide_value_max` decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`ocfilter_option_value_to_product_id`),
  KEY `slide_value_min_slide_value_max` (`slide_value_min`,`slide_value_max`),
  KEY `option_id_value_id` (`option_id`,`value_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ocfilter_option_value_to_product_description`
--

DROP TABLE IF EXISTS `ocfilter_option_value_to_product_description`;
CREATE TABLE IF NOT EXISTS `ocfilter_option_value_to_product_description` (
  `product_id` int NOT NULL,
  `value_id` bigint NOT NULL,
  `option_id` int NOT NULL,
  `language_id` tinyint NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`product_id`,`value_id`,`option_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ocfilter_page`
--

DROP TABLE IF EXISTS `ocfilter_page`;
CREATE TABLE IF NOT EXISTS `ocfilter_page` (
  `ocfilter_page_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `ocfilter_params` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ocfilter_page_id`),
  KEY `category_id_ocfilter_params` (`category_id`,`ocfilter_params`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `oc_feedback`
--

DROP TABLE IF EXISTS `oc_feedback`;
CREATE TABLE IF NOT EXISTS `oc_feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `oc_sms_log`
--

DROP TABLE IF EXISTS `oc_sms_log`;
CREATE TABLE IF NOT EXISTS `oc_sms_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `date_send` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `oc_yandex_category`
--

DROP TABLE IF EXISTS `oc_yandex_category`;
CREATE TABLE IF NOT EXISTS `oc_yandex_category` (
  `yandex_category_id` int NOT NULL AUTO_INCREMENT,
  `level1` varchar(50) NOT NULL,
  `level2` varchar(50) NOT NULL,
  `level3` varchar(50) NOT NULL,
  `level4` varchar(50) NOT NULL,
  `level5` varchar(50) NOT NULL,
  PRIMARY KEY (`yandex_category_id`),
  KEY `level1` (`level1`,`level2`,`level3`),
  KEY `level4` (`level4`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Table structure for table `odinass_product_queue`
--

DROP TABLE IF EXISTS `odinass_product_queue`;
CREATE TABLE IF NOT EXISTS `odinass_product_queue` (
  `product_id` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
CREATE TABLE IF NOT EXISTS `option` (
  `option_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`option_id`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `option_description`
--

DROP TABLE IF EXISTS `option_description`;
CREATE TABLE IF NOT EXISTS `option_description` (
  `option_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `option_tooltip`
--

DROP TABLE IF EXISTS `option_tooltip`;
CREATE TABLE IF NOT EXISTS `option_tooltip` (
  `option_id` int NOT NULL,
  `language_id` int NOT NULL,
  `tooltip` text NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `option_value`
--

DROP TABLE IF EXISTS `option_value`;
CREATE TABLE IF NOT EXISTS `option_value` (
  `option_value_id` int NOT NULL AUTO_INCREMENT,
  `option_id` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`option_value_id`),
  KEY `option_id` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `option_value_description`
--

DROP TABLE IF EXISTS `option_value_description`;
CREATE TABLE IF NOT EXISTS `option_value_description` (
  `option_value_id` int NOT NULL,
  `language_id` int NOT NULL,
  `option_id` int NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`),
  KEY `language_id` (`language_id`),
  KEY `option_id` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int NOT NULL AUTO_INCREMENT COMMENT 'Номер заказа',
  `order_id2` varchar(30) NOT NULL COMMENT 'Вторичный номер заказа (не используется)',
  `part_num` varchar(100) NOT NULL COMMENT 'Текущий номер партии, в которой доставляется заказ',
  `invoice_no` int NOT NULL DEFAULT '0' COMMENT 'Номер инвойса (не используется)',
  `invoice_prefix` varchar(26) NOT NULL COMMENT 'Префикс инвойса (не используется)',
  `invoice_filename` varchar(255) NOT NULL COMMENT 'Файл инвойса (не используется)',
  `invoice_date` date NOT NULL COMMENT 'Дата инвойса (не используется) ',
  `store_id` int NOT NULL DEFAULT '0' COMMENT 'Код виртуального магазина, в котором оформлен заказ',
  `store_name` varchar(64) NOT NULL COMMENT 'Название виртуального магазина, в котором оформлен заказ',
  `store_url` varchar(255) NOT NULL COMMENT 'URL виртуального магазина, в котором оформлен заказ ',
  `customer_id` int NOT NULL DEFAULT '0' COMMENT 'Идентификатор покупателя',
  `customer_group_id` int NOT NULL DEFAULT '0' COMMENT 'Идентификатор группы покупателя',
  `firstname` varchar(32) NOT NULL COMMENT 'Имя покупателя',
  `lastname` varchar(32) NOT NULL COMMENT 'Фамилия покупателя',
  `email` varchar(96) NOT NULL COMMENT 'Электронная почта покупателя',
  `telephone` varchar(32) NOT NULL COMMENT 'Номер телефона покупателя',
  `fax` varchar(32) NOT NULL COMMENT 'Дополнительный номер телефона',
  `faxname` varchar(64) NOT NULL COMMENT 'Контактное лицо дополнительного номера',
  `payment_firstname` varchar(32) NOT NULL COMMENT 'Имя плательщика',
  `payment_lastname` varchar(32) NOT NULL COMMENT 'Фамилия плательщика',
  `payment_company` varchar(32) NOT NULL COMMENT 'Название компании плательщика',
  `payment_company_id` varchar(32) NOT NULL COMMENT 'Идентификатор компании плательщика (не используется)',
  `payment_tax_id` varchar(32) NOT NULL COMMENT 'Налоговый класс плательщика (не используется)',
  `payment_address_1` varchar(500) NOT NULL COMMENT 'Адрес плательщика (строка 1)',
  `payment_address_struct` mediumtext NOT NULL COMMENT 'Разобранный адрес оплаты',
  `payment_address_2` varchar(500) NOT NULL COMMENT 'Адрес плательщика (строка 2) ',
  `payment_city` varchar(128) NOT NULL COMMENT 'Город плательщика',
  `payment_postcode` varchar(10) NOT NULL COMMENT 'Почтовый индекс плательщика',
  `payment_country` varchar(128) NOT NULL COMMENT 'Страна плательщика',
  `payment_country_id` int NOT NULL COMMENT 'Идентификатор страны плательщика',
  `payment_zone` varchar(128) NOT NULL COMMENT 'Геозона плательщика (не используется) ',
  `payment_zone_id` int NOT NULL COMMENT 'Идентификатор геозоны плательщика (не используется)',
  `payment_address_format` text NOT NULL COMMENT 'Формат адреса плательщика',
  `payment_method` varchar(128) NOT NULL COMMENT 'Метод оплаты (название)',
  `payment_code` varchar(128) NOT NULL COMMENT 'Метод оплаты (код)',
  `payment_secondary_method` varchar(255) NOT NULL COMMENT 'Вторичный метод оплаты (платежная система, название)',
  `payment_secondary_code` varchar(255) NOT NULL COMMENT 'Вторичный метод оплаты (платежная система, код)',
  `shipping_firstname` varchar(32) NOT NULL COMMENT 'Имя получателя',
  `shipping_lastname` varchar(32) NOT NULL COMMENT 'Фамилия получателя',
  `shipping_passport_serie` varchar(30) NOT NULL COMMENT 'Серия паспорта получателя',
  `shipping_passport_given` text NOT NULL COMMENT 'Кем выдан паспорт получателя',
  `shipping_company` varchar(32) NOT NULL COMMENT 'Название компании получателя',
  `shipping_address_1` varchar(500) NOT NULL COMMENT 'Адрес получателя (строка 1)',
  `shipping_address_struct` mediumtext NOT NULL,
  `shipping_address_2` varchar(500) NOT NULL COMMENT 'Адрес получателя (строка 2)',
  `shipping_city` varchar(128) NOT NULL COMMENT 'Город получателя',
  `shipping_postcode` varchar(10) NOT NULL COMMENT 'Индекс получателя',
  `shipping_country` varchar(128) NOT NULL COMMENT 'Страна получателя',
  `shipping_country_id` int NOT NULL COMMENT 'Код страны получателя',
  `shipping_zone` varchar(128) NOT NULL COMMENT 'Геозона получателя (не используется)',
  `shipping_zone_id` int NOT NULL COMMENT 'Идентификатор геозоны получателя (не используется)',
  `shipping_address_format` text NOT NULL COMMENT 'Формат адреса получателя',
  `shipping_method` varchar(512) DEFAULT NULL COMMENT 'Метод доставки (название)',
  `shipping_code` varchar(128) NOT NULL COMMENT 'Метод доставки (код)',
  `comment` longtext NOT NULL COMMENT 'Комментарий покупателя',
  `original_comment` longtext NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT 'Итог в основной валюте (EUR)',
  `total_national` decimal(15,4) NOT NULL COMMENT 'Итог в национальной валюте',
  `prepayment` decimal(10,2) NOT NULL COMMENT 'Предоплата в основной валюте (не используется) ',
  `prepayment_national` decimal(15,4) NOT NULL COMMENT 'Предоплата в национальной валюте (не используется) ',
  `total_paid` tinyint(1) NOT NULL COMMENT 'Признак полной оплаты (не используется) ',
  `total_paid_date` datetime NOT NULL COMMENT 'Дата полной оплаты (не используется) ',
  `prepayment_paid` tinyint(1) NOT NULL COMMENT 'Признак оплаты предоплаты (не используется) ',
  `prepayment_paid_date` datetime NOT NULL COMMENT 'Дата оплаты предоплаты (не используется) ',
  `order_status_id` int NOT NULL DEFAULT '0' COMMENT 'Идентификатор статуса заказа (текущий статус заказ)',
  `affiliate_id` int NOT NULL COMMENT 'Идентификатор партнера CPA',
  `commission` decimal(15,4) NOT NULL COMMENT 'Комиссия партнера CPA',
  `language_id` int NOT NULL COMMENT 'Идентификатор языка',
  `currency_id` int NOT NULL COMMENT 'Идентификатор валюты',
  `currency_code` varchar(3) NOT NULL COMMENT 'Код валюты ISO-3',
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000' COMMENT 'Курс к основной валюте на момент оформления',
  `ip` varchar(40) NOT NULL COMMENT 'IP адрес клиента',
  `forwarded_ip` varchar(40) NOT NULL COMMENT 'Реальный IP адрес клиента',
  `user_agent` varchar(255) NOT NULL COMMENT 'Юзер-агент клиента',
  `accept_language` varchar(255) NOT NULL COMMENT 'Accept-Language клиента',
  `product_review_reminder` int NOT NULL COMMENT 'Связь с напоминалкой о необходимости оставить отзыв',
  `weight` decimal(15,8) NOT NULL COMMENT 'Общий вес товаров',
  `date_added` datetime NOT NULL COMMENT 'Дата добавления',
  `date_added_timestamp` int NOT NULL,
  `date_modified` datetime NOT NULL COMMENT 'Дата изменения',
  `date_maxpay` date NOT NULL COMMENT 'Дата оплаты до действительности действий',
  `date_delivery` date NOT NULL COMMENT 'Дата доставки ОТ',
  `date_delivery_to` date NOT NULL COMMENT 'Дата доставки ДО',
  `date_delivery_actual` date NOT NULL COMMENT 'ТОЧНАЯ дата доставки',
  `display_date_in_account` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Отображать дату доставки в кабинете клиента',
  `date_country` date NOT NULL COMMENT 'Дата поставки в страну',
  `date_buy` date NOT NULL COMMENT 'Дата покупки',
  `date_sent` date NOT NULL COMMENT 'Дата отправки',
  `manager_id` int NOT NULL COMMENT 'Идентификатор менеджера',
  `courier_id` int NOT NULL COMMENT 'Идентификатор курьера',
  `old_manager_id` int DEFAULT NULL COMMENT 'Используется для переприсвоения заказа',
  `first_referrer` text COMMENT 'HTTP REFERER первый',
  `last_referrer` text COMMENT 'HTTP REFERER второй',
  `changed` int NOT NULL DEFAULT '0' COMMENT 'Количество изменений заказа',
  `review_alert` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 	Связь с напоминалкой о необходимости оставить отзыв',
  `ttn` varchar(255) NOT NULL COMMENT 'Текущая ТТН',
  `bottom_text` text NOT NULL COMMENT 'Полный текст внизу письма (условия доставки, оплаты) этого заказа',
  `paying_prepay` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Включить оплату предоплаты',
  `pay_equire` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Включить оплату PayKeeper',
  `pay_equire2` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Включить еще какой-то эквайринг (не используется) ',
  `pay_equirePP` tinyint NOT NULL DEFAULT '0' COMMENT 'Включить оплату PayPal',
  `pay_equireLQP` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Включить оплату LiqPay',
  `pay_equireWPP` tinyint(1) NOT NULL DEFAULT '0',
  `pay_equireMono` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Включить оплату Mono',
  `pay_equireCP` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Включить оплату Concardis Payengine',
  `pay_type` varchar(50) NOT NULL COMMENT 'Тип оплаты (нал, безнал, банк)',
  `bill_file` varchar(255) NOT NULL COMMENT 'Файл счёта',
  `bill_file2` varchar(255) NOT NULL COMMENT 'Файл счета - 2',
  `reject_reason_id` int NOT NULL DEFAULT '0' COMMENT 'Идентификатор причины отмены',
  `urgent` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Заказ срочный',
  `urgent_buy` tinyint(1) NOT NULL COMMENT 'Срочно закупить',
  `wait_full` tinyint(1) NOT NULL COMMENT 'Клиент согласен ждать полный заказ',
  `from_waitlist` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Заказ оформлен из листа ожидания',
  `legalperson_id` int NOT NULL DEFAULT '0' COMMENT 'ИДентификатор нашего юрлица, на которое выставляется счет',
  `card_id` int NOT NULL COMMENT 'Идентификатор карты, на которую приходит оплата',
  `probably_cancel` tinyint(1) DEFAULT '0' COMMENT 'Признак необходимости отмены',
  `probably_cancel_reason` varchar(500) NOT NULL COMMENT 'Причина необходимости отмены',
  `probably_close` tinyint(1) DEFAULT '0' COMMENT 'Необходимость закрытия',
  `probably_close_reason` varchar(500) NOT NULL COMMENT 'Причина необходимости закрытия',
  `probably_problem` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Признак проблемного заказа',
  `probably_problem_reason` varchar(500) NOT NULL COMMENT 'Причина проблемного заказа',
  `csi_reject` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Отказ от информации',
  `csi_mark` int NOT NULL COMMENT 'Общая оценка',
  `csi_comment` text NOT NULL COMMENT 'Комментарий к общей оценке',
  `speed_mark` int NOT NULL COMMENT 'Оценка сроков',
  `speed_comment` text NOT NULL COMMENT 'Комментарий к оценке сроков',
  `manager_mark` int NOT NULL COMMENT 'Оценка обслуживания',
  `manager_comment` text NOT NULL COMMENT 'Комментарий к оценке менеджера',
  `quality_mark` int NOT NULL COMMENT 'Оценка качества товара',
  `quality_comment` text NOT NULL COMMENT 'Комментарий к оценке качества',
  `courier_mark` int NOT NULL COMMENT 'Оценка курьера',
  `courier_comment` text NOT NULL COMMENT 'Комментарий к оценке курьера',
  `csi_average` float(2,1) NOT NULL COMMENT 'Средняя оценка CSI',
  `salary_paid` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Выплачена зарплата менеджеру',
  `closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Закрыт / заблокирован',
  `ua_logistics` tinyint(1) NOT NULL COMMENT 'Логистика заказа через Украину',
  `tracker_xml` mediumtext NOT NULL COMMENT 'XML трекера из 1С',
  `tracking_id` varchar(255) NOT NULL COMMENT 'Трек-код для определения партнера CPA',
  `concardis_id` varchar(100) NOT NULL COMMENT 'Идентификатор заявки Concardis Payengine',
  `concardis_json` text COMMENT 'JSON ответа Concardis Payengine',
  `template` varchar(24) NOT NULL COMMENT 'Идентификатор шаблона (не используется)',
  `preorder` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Это заявка на уточнение наличия и цены',
  `marketplace` varchar(20) NOT NULL,
  `pwa` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Заказ оформлен из PWA-приложения, либо из Android-приложения',
  `yam` tinyint(1) NOT NULL DEFAULT '0',
  `yam_id` int NOT NULL,
  `yam_shipment_date` date NOT NULL,
  `yam_status` varchar(32) NOT NULL,
  `yam_substatus` varchar(64) NOT NULL,
  `yam_fake` tinyint(1) NOT NULL DEFAULT '0',
  `yam_shipment_id` int NOT NULL,
  `yam_box_id` int NOT NULL,
  `fcheque_link` varchar(1024) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `store_id` (`store_id`),
  KEY `customer_id` (`customer_id`),
  KEY `customer_group_id` (`customer_group_id`),
  KEY `payment_company_id` (`payment_company_id`),
  KEY `payment_tax_id` (`payment_tax_id`),
  KEY `payment_country_id` (`payment_country_id`),
  KEY `payment_zone_id` (`payment_zone_id`),
  KEY `shipping_country_id` (`shipping_country_id`),
  KEY `shipping_zone_id` (`shipping_zone_id`),
  KEY `order_status_id` (`order_status_id`),
  KEY `affiliate_id` (`affiliate_id`),
  KEY `language_id` (`language_id`),
  KEY `invoice_prefix` (`invoice_prefix`),
  KEY `from_waitlist` (`from_waitlist`),
  KEY `card_id` (`card_id`),
  KEY `probably_close` (`probably_close`),
  KEY `probably_problem` (`probably_problem`),
  KEY `probably_cancel` (`probably_cancel`),
  KEY `csi_average` (`csi_average`),
  KEY `csi_reject` (`csi_reject`),
  KEY `date_modified` (`date_modified`),
  KEY `date_added` (`date_added`),
  KEY `salary_paid` (`salary_paid`),
  KEY `closed` (`closed`),
  KEY `manager_id` (`manager_id`),
  KEY `tracking_id` (`tracking_id`),
  KEY `template` (`template`),
  KEY `preorder` (`preorder`),
  KEY `shipping_code` (`shipping_code`),
  KEY `payment_code` (`payment_code`),
  KEY `courier_id` (`courier_id`),
  KEY `marketplace` (`marketplace`),
  KEY `telephone` (`telephone`),
  KEY `firstname` (`firstname`),
  KEY `email` (`email`),
  KEY `shipping_city` (`shipping_city`),
  KEY `date_delivery` (`date_delivery`),
  KEY `ua_logistics` (`ua_logistics`),
  KEY `concardis_id` (`concardis_id`),
  KEY `legalperson_id` (`legalperson_id`),
  KEY `date_added_timestamp` (`date_added_timestamp`),
  KEY `pwa` (`pwa`),
  KEY `yam` (`yam`),
  KEY `yam_id` (`yam_id`),
  KEY `yam_status` (`yam_status`),
  KEY `yam_substatus` (`yam_substatus`),
  KEY `yam_shipment_id` (`yam_shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_amazon`
--

DROP TABLE IF EXISTS `order_amazon`;
CREATE TABLE IF NOT EXISTS `order_amazon` (
  `order_id` int NOT NULL,
  `amazon_order_id` varchar(255) NOT NULL,
  `free_shipping` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `amazon_order_id` (`amazon_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_amazon_product`
--

DROP TABLE IF EXISTS `order_amazon_product`;
CREATE TABLE IF NOT EXISTS `order_amazon_product` (
  `order_product_id` int NOT NULL,
  `amazon_order_item_code` varchar(255) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_amazon_report`
--

DROP TABLE IF EXISTS `order_amazon_report`;
CREATE TABLE IF NOT EXISTS `order_amazon_report` (
  `order_id` int NOT NULL,
  `submission_id` varchar(255) NOT NULL,
  `status` enum('processing','error','success') NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`submission_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_courier_history`
--

DROP TABLE IF EXISTS `order_courier_history`;
CREATE TABLE IF NOT EXISTS `order_courier_history` (
  `order_id` int NOT NULL,
  `courier_id` varchar(100) NOT NULL,
  `date_added` date NOT NULL,
  `date_status` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `json` text NOT NULL,
  UNIQUE KEY `order_id_2` (`order_id`,`status`,`courier_id`) USING BTREE,
  KEY `order_id` (`order_id`),
  KEY `date_added` (`date_added`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_download`
--

DROP TABLE IF EXISTS `order_download`;
CREATE TABLE IF NOT EXISTS `order_download` (
  `order_download_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `order_product_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `remaining` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_download_id`),
  KEY `order_id` (`order_id`),
  KEY `order_product_id` (`order_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_field`
--

DROP TABLE IF EXISTS `order_field`;
CREATE TABLE IF NOT EXISTS `order_field` (
  `order_id` int NOT NULL,
  `custom_field_id` int NOT NULL,
  `custom_field_value_id` int NOT NULL,
  `name` int NOT NULL,
  `value` text NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`order_id`,`custom_field_id`,`custom_field_value_id`),
  KEY `custom_field_id` (`custom_field_id`),
  KEY `custom_field_value_id` (`custom_field_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_fraud`
--

DROP TABLE IF EXISTS `order_fraud`;
CREATE TABLE IF NOT EXISTS `order_fraud` (
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int NOT NULL,
  `ip_area_code` int NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `maxmind_id` (`maxmind_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

DROP TABLE IF EXISTS `order_history`;
CREATE TABLE IF NOT EXISTS `order_history` (
  `order_history_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `order_status_id` int NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int NOT NULL,
  `courier` tinyint(1) NOT NULL,
  `yam_status` varchar(32) NOT NULL,
  `yam_substatus` varchar(64) NOT NULL,
  PRIMARY KEY (`order_history_id`),
  KEY `order_id` (`order_id`),
  KEY `order_status_id` (`order_status_id`),
  KEY `user_id` (`user_id`),
  KEY `date_added` (`date_added`),
  KEY `courier` (`courier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_invoice_history`
--

DROP TABLE IF EXISTS `order_invoice_history`;
CREATE TABLE IF NOT EXISTS `order_invoice_history` (
  `order_invoice_id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `invoice_name` varchar(50) NOT NULL,
  `html` mediumtext NOT NULL,
  `datetime` datetime NOT NULL,
  `user_id` int NOT NULL,
  `filename` varchar(255) NOT NULL,
  `auto_gen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_invoice_id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_option`
--

DROP TABLE IF EXISTS `order_option`;
CREATE TABLE IF NOT EXISTS `order_option` (
  `order_option_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `order_product_id` int NOT NULL,
  `product_option_id` int NOT NULL,
  `product_option_value_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`),
  KEY `order_id` (`order_id`),
  KEY `order_product_id` (`order_product_id`),
  KEY `product_option_id` (`product_option_id`),
  KEY `product_option_value_id` (`product_option_value_id`),
  KEY `order_product_id_2` (`order_product_id`,`type`,`name`,`product_option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
CREATE TABLE IF NOT EXISTS `order_product` (
  `order_product_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `ao_id` int NOT NULL,
  `ao_product_id` int NOT NULL,
  `good` tinyint(1) NOT NULL DEFAULT '1',
  `taken` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_num` int NOT NULL DEFAULT '1',
  `part_num` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int NOT NULL,
  `initial_quantity` int NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `pricewd_national` decimal(15,2) NOT NULL,
  `price_national` decimal(15,2) NOT NULL,
  `original_price_national` decimal(15,2) NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `totalwd_national` decimal(15,2) NOT NULL,
  `total_national` decimal(15,2) NOT NULL,
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int NOT NULL,
  `reward_one` int NOT NULL,
  `source` varchar(500) NOT NULL,
  `from_stock` tinyint(1) NOT NULL DEFAULT '0',
  `from_bd_gift` tinyint(1) NOT NULL DEFAULT '0',
  `is_returned` tinyint(1) NOT NULL DEFAULT '0',
  `quantity_from_stock` int NOT NULL,
  `sort_order` int NOT NULL,
  `totals_json` text NOT NULL,
  `date_added_fo` date NOT NULL,
  PRIMARY KEY (`order_product_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`,`total`,`price`,`tax`,`quantity`),
  KEY `sort_order` (`sort_order`),
  KEY `customer_id` (`customer_id`),
  KEY `part_num` (`part_num`),
  KEY `delivery_num` (`delivery_num`),
  KEY `from_stock` (`from_stock`),
  KEY `date_added` (`date_added_fo`),
  KEY `reward` (`reward`),
  KEY `reward_one` (`reward_one`),
  KEY `ao_id` (`ao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_product_bought`
--

DROP TABLE IF EXISTS `order_product_bought`;
CREATE TABLE IF NOT EXISTS `order_product_bought` (
  `bought_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(14,2) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  PRIMARY KEY (`bought_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_product_history`
--

DROP TABLE IF EXISTS `order_product_history`;
CREATE TABLE IF NOT EXISTS `order_product_history` (
  `order_product_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `ao_id` int NOT NULL,
  `good` tinyint(1) NOT NULL DEFAULT '1',
  `taken` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_num` int NOT NULL DEFAULT '1',
  `part_num` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_national` decimal(15,2) NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total_national` decimal(15,2) NOT NULL,
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int NOT NULL,
  `from_stock` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_product_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_product_nogood`
--

DROP TABLE IF EXISTS `order_product_nogood`;
CREATE TABLE IF NOT EXISTS `order_product_nogood` (
  `order_product_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `store_id` int NOT NULL,
  `is_prewaitlist` tinyint(1) DEFAULT NULL,
  `telephone` varchar(25) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `product_id` int NOT NULL,
  `currency` varchar(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `ao_id` int NOT NULL,
  `ao_product_id` int NOT NULL,
  `good` tinyint(1) NOT NULL DEFAULT '1',
  `taken` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_national` decimal(15,2) NOT NULL,
  `original_price_national` decimal(15,2) NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total_national` decimal(15,2) NOT NULL,
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int NOT NULL,
  `waitlist` tinyint(1) NOT NULL DEFAULT '1',
  `supplier_has` tinyint(1) NOT NULL DEFAULT '0',
  `new_order_id` bigint DEFAULT NULL,
  UNIQUE KEY `order_product_id` (`order_product_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_product_reserves`
--

DROP TABLE IF EXISTS `order_product_reserves`;
CREATE TABLE IF NOT EXISTS `order_product_reserves` (
  `order_reserve_id` int NOT NULL AUTO_INCREMENT,
  `order_product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `country_code` varchar(3) NOT NULL,
  `not_changeable` tinyint(1) NOT NULL DEFAULT '0',
  `uuid` varchar(255) NOT NULL,
  PRIMARY KEY (`order_reserve_id`),
  KEY `order_product_id` (`order_product_id`),
  KEY `country_id` (`country_code`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_product_supply`
--

DROP TABLE IF EXISTS `order_product_supply`;
CREATE TABLE IF NOT EXISTS `order_product_supply` (
  `order_product_supply_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `order_product_id` int NOT NULL,
  `order_set_id` int NOT NULL,
  `set_id` int DEFAULT '0',
  `is_for_order` tinyint(1) NOT NULL,
  `supplier_id` int NOT NULL,
  `amount` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `url` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`order_product_supply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_product_tracker`
--

DROP TABLE IF EXISTS `order_product_tracker`;
CREATE TABLE IF NOT EXISTS `order_product_tracker` (
  `order_product_tracker_id` int NOT NULL AUTO_INCREMENT,
  `order_product` int NOT NULL,
  `quantity` int NOT NULL,
  `order_product_status` varchar(255) NOT NULL,
  `date_added` date NOT NULL,
  PRIMARY KEY (`order_product_tracker_id`),
  KEY `order_product` (`order_product`),
  KEY `order_product_status` (`order_product_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_product_untaken`
--

DROP TABLE IF EXISTS `order_product_untaken`;
CREATE TABLE IF NOT EXISTS `order_product_untaken` (
  `order_product_id` int NOT NULL,
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `ao_id` int NOT NULL,
  `ao_product_id` int NOT NULL,
  `good` tinyint(1) NOT NULL DEFAULT '1',
  `taken` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_num` int NOT NULL DEFAULT '1',
  `part_num` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int NOT NULL,
  `initial_quantity` int NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `pricewd_national` decimal(15,2) NOT NULL,
  `price_national` decimal(15,2) NOT NULL,
  `original_price_national` decimal(15,2) NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `totalwd_national` decimal(15,2) NOT NULL,
  `total_national` decimal(15,2) NOT NULL,
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int NOT NULL,
  `reward_one` int NOT NULL,
  `source` varchar(500) NOT NULL,
  `from_stock` tinyint(1) NOT NULL DEFAULT '0',
  `from_bd_gift` tinyint(1) NOT NULL DEFAULT '0',
  `is_returned` tinyint(1) NOT NULL DEFAULT '0',
  `quantity_from_stock` int NOT NULL,
  `sort_order` int NOT NULL,
  `totals_json` text NOT NULL,
  `date_added_fo` date NOT NULL,
  KEY `order_product_id` (`order_product_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_recurring`
--

DROP TABLE IF EXISTS `order_recurring`;
CREATE TABLE IF NOT EXISTS `order_recurring` (
  `order_recurring_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `created` datetime NOT NULL,
  `status` tinyint NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int NOT NULL,
  `profile_id` int NOT NULL,
  `profile_name` varchar(255) NOT NULL,
  `profile_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint NOT NULL,
  `recurring_duration` smallint NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint NOT NULL,
  `trial_duration` smallint NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `profile_reference` varchar(255) NOT NULL,
  PRIMARY KEY (`order_recurring_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `profile_id` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_recurring_transaction`
--

DROP TABLE IF EXISTS `order_recurring_transaction`;
CREATE TABLE IF NOT EXISTS `order_recurring_transaction` (
  `order_recurring_transaction_id` int NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int NOT NULL,
  `created` datetime NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`),
  KEY `order_recurring_id` (`order_recurring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_reject_reason`
--

DROP TABLE IF EXISTS `order_reject_reason`;
CREATE TABLE IF NOT EXISTS `order_reject_reason` (
  `reject_reason_id` int NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  KEY `reject_reason_id` (`reject_reason_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_related`
--

DROP TABLE IF EXISTS `order_related`;
CREATE TABLE IF NOT EXISTS `order_related` (
  `order_id` int NOT NULL,
  `related_order_id` int NOT NULL,
  KEY `order_id` (`order_id`),
  KEY `related_order_id` (`related_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_save_history`
--

DROP TABLE IF EXISTS `order_save_history`;
CREATE TABLE IF NOT EXISTS `order_save_history` (
  `order_save_id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `datetime` datetime NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`order_save_id`),
  KEY `datetime` (`datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_set`
--

DROP TABLE IF EXISTS `order_set`;
CREATE TABLE IF NOT EXISTS `order_set` (
  `order_set_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `set_id` int NOT NULL,
  `set_product_id` int NOT NULL,
  `product_id` int NOT NULL,
  `good` tinyint(1) NOT NULL DEFAULT '1',
  `taken` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_num` int NOT NULL DEFAULT '1',
  `part_num` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `pricewd_national` decimal(15,2) NOT NULL,
  `price_national` decimal(15,2) NOT NULL,
  `original_price_national` decimal(15,4) NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `totalwd_national` decimal(15,2) NOT NULL,
  `total_national` decimal(15,2) NOT NULL,
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int NOT NULL,
  PRIMARY KEY (`order_set_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_simple_fields`
--

DROP TABLE IF EXISTS `order_simple_fields`;
CREATE TABLE IF NOT EXISTS `order_simple_fields` (
  `order_id` int NOT NULL,
  `metadata` text,
  `courier_city_shipping_address` text,
  `courier_city_dadata_unrestricted_value` text,
  `courier_city_dadata_beltway_hit` text,
  `courier_city_dadata_beltway_distance` text,
  `courier_city_dadata_geolocation` text,
  `courier_city_dadata_postalcode` text,
  `novaposhta_warehouse` text,
  `novaposhta_city_guid` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `novaposhta_street` text,
  `novaposhta_house_number` text,
  `novaposhta_flat` text,
  `cdek_city_guid` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `cdek_warehouse` text,
  `cdek_street` text,
  `cdek_house_number` text,
  `cdek_flat` text,
  `justin_warehouse` text,
  `ukrpost_postcode` text,
  `test_field` text,
  `newsletter_news` int NOT NULL,
  `newsletter_personal` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `novaposhta_city_guid` (`novaposhta_city_guid`),
  KEY `cdek_city_guid` (`cdek_city_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_sms_history`
--

DROP TABLE IF EXISTS `order_sms_history`;
CREATE TABLE IF NOT EXISTS `order_sms_history` (
  `order_history_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `order_status_id` int NOT NULL,
  `sms_status` varchar(32) NOT NULL,
  `sms_id` varchar(40) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_ttn` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_history_id`),
  KEY `order_id` (`order_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE IF NOT EXISTS `order_status` (
  `order_status_id` int NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `status_bg_color` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `status_txt_color` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `status_fa_icon` varchar(50) NOT NULL,
  `front_bg_color` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`),
  KEY `language_id` (`language_id`),
  KEY `order_status_id` (`order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_status_linked`
--

DROP TABLE IF EXISTS `order_status_linked`;
CREATE TABLE IF NOT EXISTS `order_status_linked` (
  `order_status_id` int NOT NULL,
  `linked_order_status_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_total`
--

DROP TABLE IF EXISTS `order_total`;
CREATE TABLE IF NOT EXISTS `order_total` (
  `order_total_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(512) DEFAULT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `value_national` decimal(15,4) NOT NULL,
  `sort_order` int NOT NULL,
  `for_delivery` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`),
  KEY `order_id` (`order_id`,`value`,`code`),
  KEY `title` (`title`(255)),
  KEY `for_delivery` (`for_delivery`),
  KEY `value_national` (`value_national`),
  KEY `code` (`code`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_total_tax`
--

DROP TABLE IF EXISTS `order_total_tax`;
CREATE TABLE IF NOT EXISTS `order_total_tax` (
  `order_total_id` int NOT NULL DEFAULT '0',
  `code` varchar(255) DEFAULT NULL,
  `tax` decimal(10,4) NOT NULL,
  PRIMARY KEY (`order_total_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_to_1c_queue`
--

DROP TABLE IF EXISTS `order_to_1c_queue`;
CREATE TABLE IF NOT EXISTS `order_to_1c_queue` (
  `order_id` int NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_to_sdek`
--

DROP TABLE IF EXISTS `order_to_sdek`;
CREATE TABLE IF NOT EXISTS `order_to_sdek` (
  `order_to_sdek_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `cityId` int NOT NULL,
  `pvz_code` varchar(255) NOT NULL,
  PRIMARY KEY (`order_to_sdek_id`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_tracker`
--

DROP TABLE IF EXISTS `order_tracker`;
CREATE TABLE IF NOT EXISTS `order_tracker` (
  `order_tracker_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `date_added` date NOT NULL,
  PRIMARY KEY (`order_tracker_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_tracker_sms`
--

DROP TABLE IF EXISTS `order_tracker_sms`;
CREATE TABLE IF NOT EXISTS `order_tracker_sms` (
  `tracker_sms_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `partie_num` varchar(10) NOT NULL,
  `tracker_type` varchar(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  PRIMARY KEY (`tracker_sms_id`),
  KEY `partie_num` (`partie_num`),
  KEY `order_id` (`order_id`),
  KEY `tracker_type` (`tracker_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_ttns`
--

DROP TABLE IF EXISTS `order_ttns`;
CREATE TABLE IF NOT EXISTS `order_ttns` (
  `order_ttn_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `ttn` varchar(255) NOT NULL,
  `date_ttn` date NOT NULL,
  `sms_sent` datetime NOT NULL,
  `delivery_code` varchar(55) NOT NULL,
  `tracking_status` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tracking_data` text NOT NULL,
  `taken` tinyint(1) DEFAULT '0',
  `rejected` tinyint(1) NOT NULL DEFAULT '0',
  `waiting` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_ttn_id`),
  UNIQUE KEY `order_id_2` (`order_id`,`ttn`),
  KEY `status` (`tracking_status`),
  KEY `rejected` (`rejected`),
  KEY `waiting` (`waiting`),
  KEY `order_id` (`order_id`),
  KEY `ttn` (`ttn`),
  KEY `taken` (`taken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_voucher`
--

DROP TABLE IF EXISTS `order_voucher`;
CREATE TABLE IF NOT EXISTS `order_voucher` (
  `order_voucher_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `voucher_id` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`),
  KEY `order_id` (`order_id`),
  KEY `voucher_id` (`voucher_id`),
  KEY `voucher_theme_id` (`voucher_theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `parser_queue`
--

DROP TABLE IF EXISTS `parser_queue`;
CREATE TABLE IF NOT EXISTS `parser_queue` (
  `parser_queue_id` int NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int NOT NULL,
  `add_date` datetime NOT NULL,
  `processed` tinyint(1) NOT NULL,
  PRIMARY KEY (`parser_queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `pavoslidergroups`
--

DROP TABLE IF EXISTS `pavoslidergroups`;
CREATE TABLE IF NOT EXISTS `pavoslidergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `pavosliderlayers`
--

DROP TABLE IF EXISTS `pavosliderlayers`;
CREATE TABLE IF NOT EXISTS `pavosliderlayers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `parent_id` int NOT NULL,
  `group_id` int NOT NULL,
  `params` text NOT NULL,
  `layersparams` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_iframe_order`
--

DROP TABLE IF EXISTS `paypal_iframe_order`;
CREATE TABLE IF NOT EXISTS `paypal_iframe_order` (
  `paypal_iframe_order_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `capture_status` enum('Complete','NotComplete') DEFAULT NULL,
  `currency_code` char(3) NOT NULL,
  `authorization_id` varchar(30) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`paypal_iframe_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_iframe_order_transaction`
--

DROP TABLE IF EXISTS `paypal_iframe_order_transaction`;
CREATE TABLE IF NOT EXISTS `paypal_iframe_order_transaction` (
  `paypal_iframe_order_transaction_id` int NOT NULL AUTO_INCREMENT,
  `paypal_iframe_order_id` int NOT NULL,
  `transaction_id` char(20) NOT NULL,
  `parent_transaction_id` char(20) NOT NULL,
  `created` datetime NOT NULL,
  `note` varchar(255) NOT NULL,
  `msgsubid` char(38) NOT NULL,
  `receipt_id` char(20) NOT NULL,
  `payment_type` enum('none','echeck','instant','refund','void') DEFAULT NULL,
  `payment_status` char(20) NOT NULL,
  `pending_reason` char(50) NOT NULL,
  `transaction_entity` char(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `debug_data` text NOT NULL,
  `call_data` text NOT NULL,
  PRIMARY KEY (`paypal_iframe_order_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_order`
--

DROP TABLE IF EXISTS `paypal_order`;
CREATE TABLE IF NOT EXISTS `paypal_order` (
  `paypal_order_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `capture_status` enum('Complete','NotComplete') DEFAULT NULL,
  `currency_code` char(3) NOT NULL,
  `authorization_id` varchar(30) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`paypal_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_order_transaction`
--

DROP TABLE IF EXISTS `paypal_order_transaction`;
CREATE TABLE IF NOT EXISTS `paypal_order_transaction` (
  `paypal_order_transaction_id` int NOT NULL AUTO_INCREMENT,
  `paypal_order_id` int NOT NULL,
  `transaction_id` char(20) NOT NULL,
  `parent_transaction_id` char(20) NOT NULL,
  `created` datetime NOT NULL,
  `note` varchar(255) NOT NULL,
  `msgsubid` char(38) NOT NULL,
  `receipt_id` char(20) NOT NULL,
  `payment_type` enum('none','echeck','instant','refund','void') DEFAULT NULL,
  `payment_status` char(20) NOT NULL,
  `pending_reason` char(50) NOT NULL,
  `transaction_entity` char(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `debug_data` text NOT NULL,
  `call_data` text NOT NULL,
  PRIMARY KEY (`paypal_order_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `priceva_data`
--

DROP TABLE IF EXISTS `priceva_data`;
CREATE TABLE IF NOT EXISTS `priceva_data` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `name` varchar(512) NOT NULL,
  `articul` varchar(255) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `url` varchar(1024) NOT NULL,
  `default_currency` varchar(5) NOT NULL,
  `default_price` decimal(15,2) NOT NULL,
  `default_available` tinyint(1) NOT NULL,
  `default_discount` decimal(15,2) NOT NULL,
  `repricing_min` decimal(15,2) NOT NULL,
  UNIQUE KEY `product_id_2` (`product_id`,`store_id`),
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`),
  KEY `articul` (`articul`),
  KEY `default_currency` (`default_currency`),
  KEY `default_available` (`default_available`),
  KEY `category_name` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `priceva_sources`
--

DROP TABLE IF EXISTS `priceva_sources`;
CREATE TABLE IF NOT EXISTS `priceva_sources` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `url` varchar(2048) NOT NULL,
  `url_md5` varchar(64) NOT NULL,
  `company_name` varchar(512) NOT NULL,
  `region_name` varchar(512) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `last_check_date` datetime NOT NULL,
  `relevance_status` int NOT NULL DEFAULT '0',
  `price` decimal(15,2) NOT NULL,
  `in_stock` tinyint(1) NOT NULL,
  `discount_type` int NOT NULL,
  `discount` decimal(15,2) NOT NULL,
  UNIQUE KEY `product_id_2` (`product_id`,`store_id`,`url_md5`),
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`),
  KEY `active` (`active`),
  KEY `status` (`status`),
  KEY `currency` (`currency`),
  KEY `in_stock` (`in_stock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `model` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Артикул или модель',
  `short_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Короткое название',
  `short_name_de` varchar(50) NOT NULL,
  `sku` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Артикул SKU',
  `upc` varchar(255) NOT NULL,
  `ean` varchar(50) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `virtual_isbn` varchar(255) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `mpn` varchar(255) NOT NULL,
  `asin` varchar(255) NOT NULL,
  `old_asin` varchar(32) NOT NULL,
  `location` varchar(128) NOT NULL,
  `source` text NOT NULL,
  `competitors` text NOT NULL,
  `competitors_ua` text NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `quantity_stock` int NOT NULL DEFAULT '0',
  `quantity_stockM` int NOT NULL DEFAULT '0',
  `quantity_stockK` int NOT NULL DEFAULT '0',
  `quantity_stockMN` int NOT NULL DEFAULT '0',
  `quantity_stockAS` int NOT NULL DEFAULT '0',
  `quantity_updateMarker` tinyint(1) NOT NULL DEFAULT '0',
  `quantity_stock_onway` int NOT NULL DEFAULT '0',
  `quantity_stockK_onway` int NOT NULL DEFAULT '0',
  `quantity_stockM_onway` int NOT NULL DEFAULT '0',
  `quantity_stockMN_onway` int NOT NULL DEFAULT '0',
  `quantity_stockAS_onway` int NOT NULL DEFAULT '0',
  `stock_status_id` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int NOT NULL,
  `collection_id` bigint NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `cost` decimal(15,2) NOT NULL,
  `actual_cost` decimal(15,2) NOT NULL DEFAULT '0.00',
  `actual_cost_date` date NOT NULL DEFAULT '0000-00-00',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `price_delayed` decimal(15,2) NOT NULL DEFAULT '0.00',
  `price_national` decimal(15,2) NOT NULL,
  `mpp_price` decimal(15,2) NOT NULL,
  `yam_price` decimal(15,2) NOT NULL,
  `yam_special` decimal(15,2) NOT NULL,
  `yam_recprice` decimal(15,2) NOT NULL,
  `yam_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `yam_special_percent` decimal(15,2) NOT NULL,
  `yam_currency` varchar(3) NOT NULL DEFAULT 'RUB',
  `currency` varchar(5) NOT NULL,
  `historical_price` decimal(15,4) NOT NULL,
  `points` int NOT NULL DEFAULT '0',
  `points_only_purchase` tinyint(1) NOT NULL,
  `tax_class_id` int NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT 'Вес НЕТТО',
  `weight_class_id` int NOT NULL DEFAULT '1' COMMENT 'Идентификатор единицы измерения веса НЕТТО',
  `weight_amazon_key` varchar(100) NOT NULL,
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000' COMMENT 'Длинна НЕТТО',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000' COMMENT 'Ширина НЕТТО',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000' COMMENT 'Высота НЕТТО',
  `length_class_id` int NOT NULL DEFAULT '0' COMMENT 'Идентификатор единицы измерения РАЗМЕРА НЕТТО',
  `length_amazon_key` varchar(100) NOT NULL,
  `pack_weight` decimal(15,8) NOT NULL COMMENT 'Вес БРУТТО',
  `pack_weight_class_id` int NOT NULL COMMENT 'Идентификатор единицы измерения ВЕСА БРУТТО',
  `pack_weight_amazon_key` varchar(100) NOT NULL,
  `pack_length` decimal(15,8) NOT NULL COMMENT 'Длинна БРУТТО',
  `pack_width` decimal(15,8) NOT NULL COMMENT 'Ширина БРУТТО',
  `pack_height` decimal(15,8) NOT NULL COMMENT 'Высота БРУТТО',
  `pack_length_class_id` int NOT NULL COMMENT 'Идентификатор единицы измерения РАЗМЕРА БРУТТО',
  `pack_length_amazon_key` varchar(100) NOT NULL,
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int NOT NULL DEFAULT '1',
  `package` int NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int NOT NULL DEFAULT '0',
  `youtube` text NOT NULL,
  `special_cost` decimal(15,2) NOT NULL,
  `historical_cost` decimal(15,2) NOT NULL,
  `parser_price` decimal(15,2) NOT NULL,
  `parser_special_price` decimal(15,2) NOT NULL,
  `skip` int NOT NULL,
  `tnved` varchar(255) NOT NULL,
  `ignore_parse` tinyint(1) NOT NULL,
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `stock_product_id` int NOT NULL,
  `is_option_with_id` int NOT NULL,
  `is_option_for_product_id` int NOT NULL,
  `color_group` varchar(100) NOT NULL,
  `is_virtual` tinyint(1) NOT NULL,
  `is_related_set` tinyint(1) NOT NULL,
  `has_child` tinyint(1) NOT NULL,
  `ignore_parse_date_to` date NOT NULL,
  `new_date_to` date NOT NULL,
  `min_buy` int NOT NULL,
  `max_buy` int NOT NULL,
  `can_be_presented` tinyint(1) NOT NULL,
  `bought_for_week` int NOT NULL,
  `bought_for_month` int NOT NULL,
  `big_business` tinyint(1) NOT NULL DEFAULT '0',
  `is_markdown` int NOT NULL,
  `markdown_product_id` int NOT NULL,
  `lock_points` tinyint(1) NOT NULL DEFAULT '0',
  `yam_disable` tinyint(1) NOT NULL DEFAULT '0',
  `yam_product_id` varchar(32) NOT NULL,
  `yam_marketSku` int NOT NULL,
  `priceva_enable` tinyint(1) NOT NULL DEFAULT '0',
  `priceva_disable` tinyint(1) NOT NULL DEFAULT '0',
  `yam_in_feed` tinyint(1) NOT NULL DEFAULT '0',
  `ozon_in_feed` tinyint(1) NOT NULL DEFAULT '0',
  `yam_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `yam_not_created` tinyint(1) NOT NULL DEFAULT '0',
  `is_illiquid` tinyint(1) NOT NULL DEFAULT '0',
  `amzn_invalid_asin` tinyint(1) NOT NULL DEFAULT '0',
  `amzn_not_found` tinyint(1) DEFAULT '0' COMMENT 'Товар не найден на Amazon',
  `amzn_last_search` date DEFAULT NULL COMMENT 'Дата последнего обновления данных Amazon',
  `amzn_no_offers` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Нет предложений на Amazon',
  `amzn_no_offers_counter` int NOT NULL DEFAULT '0',
  `amzn_offers_count` int NOT NULL,
  `amzn_last_offers` datetime NOT NULL COMMENT 'Дата и время последнего обновления офферов Amazon',
  `amzn_ignore` tinyint(1) NOT NULL COMMENT 'Не обновлять цену с Amazon',
  `amzn_rating` decimal(15,2) NOT NULL,
  `amazon_best_price` decimal(15,4) NOT NULL DEFAULT '0.0000' COMMENT 'Лучший оффер на Amazon',
  `amazon_lowest_price` decimal(15,2) NOT NULL,
  `added_from_amazon` tinyint(1) NOT NULL DEFAULT '0',
  `fill_from_amazon` tinyint(1) NOT NULL DEFAULT '0',
  `filled_from_amazon` tinyint(1) DEFAULT '0',
  `description_filled_from_amazon` tinyint NOT NULL DEFAULT '0',
  `amazon_product_link` varchar(1024) DEFAULT NULL,
  `amazon_product_image` varchar(1024) DEFAULT NULL,
  `main_variant_id` int DEFAULT '0',
  `variant_1_is_color` tinyint(1) DEFAULT '0',
  `variant_2_is_color` tinyint(1) DEFAULT '0',
  `display_in_catalog` tinyint(1) DEFAULT '0',
  `reviews_parsed` tinyint(1) NOT NULL,
  `xrating` decimal(15,2) DEFAULT '0.00',
  `xreviews` int DEFAULT '0',
  `xhasvideo` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `model` (`model`),
  KEY `sku` (`sku`),
  KEY `ean` (`ean`),
  KEY `isbn` (`isbn`),
  KEY `mpn` (`mpn`),
  KEY `manufacturer_id` (`manufacturer_id`),
  KEY `product_id` (`product_id`,`model`,`sku`,`manufacturer_id`,`sort_order`,`status`),
  KEY `virtual_isbn` (`virtual_isbn`),
  KEY `color_group` (`color_group`),
  KEY `is_virtual` (`is_virtual`),
  KEY `asin` (`asin`),
  KEY `date_available` (`date_available`),
  KEY `is_option_for_product_id` (`is_option_for_product_id`),
  KEY `is_option_with_id` (`is_option_with_id`),
  KEY `collection_id` (`collection_id`),
  KEY `stock_product_id` (`stock_product_id`),
  KEY `has_child` (`has_child`),
  KEY `big_business` (`big_business`),
  KEY `quantity` (`quantity`),
  KEY `weight_class_id` (`weight_class_id`),
  KEY `length_class_id` (`length_class_id`),
  KEY `quantity_stock` (`quantity_stock`),
  KEY `quantity_stockM` (`quantity_stockM`),
  KEY `quantity_stockK` (`quantity_stockK`),
  KEY `new` (`new`),
  KEY `stock_status_id` (`stock_status_id`),
  KEY `is_markdown` (`is_markdown`),
  KEY `markdown_product_id` (`markdown_product_id`),
  KEY `lock_points` (`lock_points`),
  KEY `yam_disable` (`yam_disable`),
  KEY `priceva_enable` (`priceva_enable`),
  KEY `priceva_disable` (`priceva_disable`),
  KEY `yam_product_id` (`yam_product_id`),
  KEY `yam_in_feed` (`yam_in_feed`),
  KEY `yam_hidden` (`yam_hidden`),
  KEY `is_illiquid` (`is_illiquid`),
  KEY `yam_marketSku` (`yam_marketSku`),
  KEY `yam_not_created` (`yam_not_created`),
  KEY `quantity_stockMN` (`quantity_stockMN`),
  KEY `amzn_invalid_asin` (`amzn_invalid_asin`),
  KEY `amzn_not_found` (`amzn_not_found`),
  KEY `amzn_last_search` (`amzn_last_search`),
  KEY `amzn_no_offers` (`amzn_no_offers`),
  KEY `amzn_ignore` (`amzn_ignore`),
  KEY `ozon_in_feed` (`ozon_in_feed`),
  KEY `quantity_stockK_onway` (`quantity_stockK_onway`),
  KEY `quantity_stockM_onway` (`quantity_stockM_onway`),
  KEY `quantity_stock_onway` (`quantity_stock_onway`),
  KEY `quantity_stockMN_onway` (`quantity_stockMN_onway`),
  KEY `quantity_stockAS_onway` (`quantity_stockAS_onway`),
  KEY `date_added` (`date_added`),
  KEY `new_date_to` (`new_date_to`),
  KEY `main_variant_id` (`main_variant_id`),
  KEY `display_in_catalog` (`display_in_catalog`),
  KEY `filled_from_amazon` (`filled_from_amazon`),
  KEY `fill_from_amazon` (`fill_from_amazon`),
  KEY `price` (`price`),
  KEY `price_national` (`price_national`),
  KEY `amzn_rating` (`amzn_rating`),
  KEY `xrating` (`xrating`),
  KEY `quantity_updateMarker` (`quantity_updateMarker`),
  KEY `price_delayed` (`price_delayed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_additional_offer`
--

DROP TABLE IF EXISTS `product_additional_offer`;
CREATE TABLE IF NOT EXISTS `product_additional_offer` (
  `product_additional_offer_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `ao_group` varchar(100) NOT NULL,
  `customer_group_id` int NOT NULL,
  `priority` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `ao_product_id` int NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `percent` int NOT NULL DEFAULT '0',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`product_additional_offer_id`),
  KEY `product_id` (`product_id`),
  KEY `date_end` (`date_end`),
  KEY `percent` (`percent`),
  KEY `ao_product_id` (`ao_product_id`),
  KEY `customer_group_id` (`customer_group_id`),
  KEY `date_start` (`date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_additional_offer_to_store`
--

DROP TABLE IF EXISTS `product_additional_offer_to_store`;
CREATE TABLE IF NOT EXISTS `product_additional_offer_to_store` (
  `product_additional_offer_id` int NOT NULL,
  `store_id` int NOT NULL,
  KEY `product_additional_offer_id` (`product_additional_offer_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_also_bought`
--

DROP TABLE IF EXISTS `product_also_bought`;
CREATE TABLE IF NOT EXISTS `product_also_bought` (
  `product_id` int NOT NULL,
  `also_bought_id` int NOT NULL,
  UNIQUE KEY `product_id_2` (`product_id`,`also_bought_id`) USING BTREE,
  KEY `product_id` (`product_id`),
  KEY `also_bought_id` (`also_bought_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_also_viewed`
--

DROP TABLE IF EXISTS `product_also_viewed`;
CREATE TABLE IF NOT EXISTS `product_also_viewed` (
  `product_id` int NOT NULL,
  `also_viewed_id` int NOT NULL,
  UNIQUE KEY `product_id_2` (`product_id`,`also_viewed_id`) USING BTREE,
  KEY `product_id` (`product_id`),
  KEY `also_viewed_id` (`also_viewed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_amzn_data`
--

DROP TABLE IF EXISTS `product_amzn_data`;
CREATE TABLE IF NOT EXISTS `product_amzn_data` (
  `product_id` int NOT NULL,
  `asin` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `file` varchar(512) COLLATE utf8mb3_bin NOT NULL,
  `json` json NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `asin` (`asin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `product_amzn_offers`
--

DROP TABLE IF EXISTS `product_amzn_offers`;
CREATE TABLE IF NOT EXISTS `product_amzn_offers` (
  `amazon_offer_id` int NOT NULL AUTO_INCREMENT,
  `asin` varchar(128) NOT NULL,
  `priceCurrency` varchar(5) NOT NULL,
  `priceAmount` decimal(15,2) NOT NULL,
  `importFeeCurrency` varchar(5) NOT NULL,
  `importFeeAmount` decimal(15,2) NOT NULL,
  `deliveryCurrency` varchar(5) NOT NULL,
  `deliveryAmount` decimal(15,2) NOT NULL,
  `deliveryIsFree` tinyint(1) NOT NULL,
  `deliveryIsFba` tinyint(1) NOT NULL,
  `deliveryIsShippedCrossBorder` tinyint(1) NOT NULL,
  `deliveryComments` varchar(512) NOT NULL,
  `minDays` int NOT NULL,
  `deliveryFrom` date NOT NULL,
  `deliveryTo` date NOT NULL,
  `conditionIsNew` tinyint(1) NOT NULL,
  `conditionTitle` varchar(512) NOT NULL,
  `conditionComments` varchar(512) NOT NULL,
  `sellerName` varchar(512) NOT NULL,
  `sellerLink` varchar(1024) NOT NULL,
  `sellerRating50` int NOT NULL,
  `sellerRatingsTotal` int NOT NULL,
  `sellerPositiveRatings100` int NOT NULL,
  `date_added` datetime NOT NULL,
  `is_min_price` tinyint(1) NOT NULL,
  `isPrime` tinyint(1) NOT NULL,
  `isBuyBoxWinner` tinyint(1) NOT NULL DEFAULT '0',
  `isBestOffer` tinyint(1) NOT NULL,
  `offerRating` decimal(15,2) NOT NULL,
  `offer_id` varchar(512) NOT NULL,
  PRIMARY KEY (`amazon_offer_id`),
  KEY `product_id` (`asin`),
  KEY `date_added` (`date_added`),
  KEY `is_min_price` (`is_min_price`),
  KEY `isPrime` (`isPrime`),
  KEY `isBestOffer` (`isBestOffer`),
  KEY `isBuyBoxWinner` (`isBuyBoxWinner`),
  KEY `minDays` (`minDays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_anyrelated`
--

DROP TABLE IF EXISTS `product_anyrelated`;
CREATE TABLE IF NOT EXISTS `product_anyrelated` (
  `product_id` int NOT NULL,
  `anyrelated_id` int NOT NULL,
  KEY `product_id` (`product_id`),
  KEY `anyrelated_id` (`anyrelated_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

DROP TABLE IF EXISTS `product_attribute`;
CREATE TABLE IF NOT EXISTS `product_attribute` (
  `product_id` int NOT NULL,
  `attribute_id` int NOT NULL,
  `language_id` int NOT NULL,
  `text` varchar(1024) NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`),
  KEY `attribute_id` (`attribute_id`),
  KEY `language_id` (`language_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`,`language_id`),
  KEY `attribute_id_2` (`attribute_id`,`language_id`),
  KEY `text` (`text`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_child`
--

DROP TABLE IF EXISTS `product_child`;
CREATE TABLE IF NOT EXISTS `product_child` (
  `product_id` int NOT NULL,
  `child_id` int NOT NULL,
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_costs`
--

DROP TABLE IF EXISTS `product_costs`;
CREATE TABLE IF NOT EXISTS `product_costs` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `cost` decimal(15,2) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `min_sale_price` decimal(15,2) NOT NULL,
  UNIQUE KEY `product_id_2` (`product_id`,`store_id`),
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_description`
--

DROP TABLE IF EXISTS `product_description`;
CREATE TABLE IF NOT EXISTS `product_description` (
  `product_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name_d` varchar(50) NOT NULL,
  `name_of_option` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `markdown_appearance` text NOT NULL,
  `markdown_condition` text NOT NULL,
  `markdown_pack` text NOT NULL,
  `markdown_equipment` text NOT NULL,
  `color` varchar(512) DEFAULT NULL,
  `material` varchar(512) DEFAULT NULL,
  `variant_name` varchar(512) NOT NULL,
  `variant_name_1` varchar(512) NOT NULL,
  `variant_name_2` varchar(512) DEFAULT NULL,
  `variant_value_1` varchar(512) DEFAULT NULL,
  `variant_value_2` varchar(512) DEFAULT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_h1` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  `auto_gen` tinyint(1) NOT NULL DEFAULT '0',
  `translated` tinyint(1) NOT NULL DEFAULT '0',
  `alt_image` text,
  `title_image` text,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`),
  KEY `language_id` (`language_id`),
  KEY `product_id` (`product_id`),
  KEY `translated` (`translated`),
  KEY `color` (`color`),
  KEY `material` (`material`),
  KEY `variant_name` (`variant_name`),
  KEY `variant_name_1` (`variant_name_1`),
  KEY `variant_name_2` (`variant_name_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_discount`
--

DROP TABLE IF EXISTS `product_discount`;
CREATE TABLE IF NOT EXISTS `product_discount` (
  `product_discount_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `customer_group_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_feature`
--

DROP TABLE IF EXISTS `product_feature`;
CREATE TABLE IF NOT EXISTS `product_feature` (
  `product_id` int NOT NULL,
  `feature_id` int NOT NULL,
  `language_id` int NOT NULL,
  `text` varchar(2048) NOT NULL,
  PRIMARY KEY (`product_id`,`feature_id`,`language_id`),
  KEY `feature_id` (`feature_id`),
  KEY `language_id` (`language_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_language_id` (`product_id`,`language_id`) USING BTREE,
  KEY `feature_id_language_id` (`feature_id`,`language_id`) USING BTREE,
  KEY `text` (`text`(1024)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_filter`
--

DROP TABLE IF EXISTS `product_filter`;
CREATE TABLE IF NOT EXISTS `product_filter` (
  `product_id` int NOT NULL,
  `filter_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_front_price`
--

DROP TABLE IF EXISTS `product_front_price`;
CREATE TABLE IF NOT EXISTS `product_front_price` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `special` decimal(15,2) NOT NULL,
  `reward` decimal(15,2) NOT NULL,
  `currency` varchar(5) NOT NULL,
  UNIQUE KEY `product_id_2` (`product_id`,`store_id`),
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
CREATE TABLE IF NOT EXISTS `product_image` (
  `product_image_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_master`
--

DROP TABLE IF EXISTS `product_master`;
CREATE TABLE IF NOT EXISTS `product_master` (
  `master_product_id` int NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `special_attribute_group_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`master_product_id`,`product_id`,`special_attribute_group_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_option`
--

DROP TABLE IF EXISTS `product_option`;
CREATE TABLE IF NOT EXISTS `product_option` (
  `product_option_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `option_id` int NOT NULL,
  `option_value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`),
  KEY `product_id` (`product_id`),
  KEY `option_id` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_option_value`
--

DROP TABLE IF EXISTS `product_option_value`;
CREATE TABLE IF NOT EXISTS `product_option_value` (
  `product_option_value_id` int NOT NULL AUTO_INCREMENT,
  `product_option_id` int NOT NULL,
  `product_id` int NOT NULL,
  `option_id` int NOT NULL,
  `option_value_id` int NOT NULL,
  `quantity` int NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  `ob_sku` varchar(64) NOT NULL DEFAULT '',
  `ob_info` varchar(255) NOT NULL DEFAULT '',
  `ob_image` varchar(255) NOT NULL DEFAULT '',
  `ob_sku_override` int NOT NULL DEFAULT '0',
  `this_is_product_id` int NOT NULL,
  PRIMARY KEY (`product_option_value_id`),
  KEY `option_value_id` (`option_value_id`),
  KEY `product_id` (`product_id`),
  KEY `product_option_id` (`product_option_id`),
  KEY `option_id` (`option_id`),
  KEY `subtract` (`subtract`),
  KEY `quantity` (`quantity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_price_history`
--

DROP TABLE IF EXISTS `product_price_history`;
CREATE TABLE IF NOT EXISTS `product_price_history` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `price` int NOT NULL,
  `currency` varchar(8) NOT NULL,
  `type` varchar(64) NOT NULL,
  `source` varchar(64) NOT NULL,
  `date_added` datetime NOT NULL,
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`),
  KEY `currency` (`currency`),
  KEY `type` (`type`),
  KEY `source` (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_price_national_to_store`
--

DROP TABLE IF EXISTS `product_price_national_to_store`;
CREATE TABLE IF NOT EXISTS `product_price_national_to_store` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `special` decimal(15,2) NOT NULL,
  `currency` varchar(4) NOT NULL,
  `dot_not_overload_1c` tinyint(1) NOT NULL DEFAULT '0',
  `settled_from_1c` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `product_store` (`product_id`,`store_id`) USING BTREE,
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`),
  KEY `currency` (`currency`),
  KEY `price` (`price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_price_national_to_store1`
--

DROP TABLE IF EXISTS `product_price_national_to_store1`;
CREATE TABLE IF NOT EXISTS `product_price_national_to_store1` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `special` decimal(15,2) NOT NULL,
  `currency` varchar(4) NOT NULL,
  `dot_not_overload_1c` tinyint(1) NOT NULL DEFAULT '0',
  `settled_from_1c` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `product_store` (`product_id`,`store_id`) USING BTREE,
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_price_national_to_yam`
--

DROP TABLE IF EXISTS `product_price_national_to_yam`;
CREATE TABLE IF NOT EXISTS `product_price_national_to_yam` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `special` decimal(15,2) NOT NULL,
  `currency` varchar(4) NOT NULL,
  `dot_not_overload_1c` tinyint(1) NOT NULL DEFAULT '0',
  `settled_from_1c` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `product_store` (`product_id`,`store_id`) USING BTREE,
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_price_to_store`
--

DROP TABLE IF EXISTS `product_price_to_store`;
CREATE TABLE IF NOT EXISTS `product_price_to_store` (
  `product_id` bigint NOT NULL,
  `store_id` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `price_delayed` decimal(15,2) NOT NULL DEFAULT '0.00',
  `special` decimal(15,2) NOT NULL,
  `settled_from_1c` tinyint(1) NOT NULL DEFAULT '0',
  `dot_not_overload_1c` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`),
  KEY `store_id` (`store_id`),
  KEY `product_id` (`product_id`),
  KEY `settled_from_1c` (`settled_from_1c`),
  KEY `dot_not_overload_1c` (`dot_not_overload_1c`),
  KEY `price` (`price`),
  KEY `price_delayed` (`price_delayed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_product_option`
--

DROP TABLE IF EXISTS `product_product_option`;
CREATE TABLE IF NOT EXISTS `product_product_option` (
  `product_product_option_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  `type` varchar(32) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `sort_order` int NOT NULL,
  PRIMARY KEY (`product_product_option_id`),
  KEY `product_id` (`product_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_product_option_value`
--

DROP TABLE IF EXISTS `product_product_option_value`;
CREATE TABLE IF NOT EXISTS `product_product_option_value` (
  `product_product_option_value_id` int NOT NULL AUTO_INCREMENT,
  `product_product_option_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_option_id` int NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_product_option_value_id`),
  KEY `product_product_option_id` (`product_product_option_id`),
  KEY `product_id` (`product_id`),
  KEY `product_option_id` (`product_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_profile`
--

DROP TABLE IF EXISTS `product_profile`;
CREATE TABLE IF NOT EXISTS `product_profile` (
  `product_id` int NOT NULL,
  `profile_id` int NOT NULL,
  `customer_group_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`profile_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_purchase`
--

DROP TABLE IF EXISTS `product_purchase`;
CREATE TABLE IF NOT EXISTS `product_purchase` (
  `purchase_uuid` varchar(64) NOT NULL,
  `product_id` int NOT NULL,
  `supplier_name` varchar(256) NOT NULL,
  `supplier_id` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `date_added` date NOT NULL,
  KEY `purchase_uuid` (`purchase_uuid`),
  KEY `product_id` (`product_id`),
  KEY `date_added` (`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_recurring`
--

DROP TABLE IF EXISTS `product_recurring`;
CREATE TABLE IF NOT EXISTS `product_recurring` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_related`
--

DROP TABLE IF EXISTS `product_related`;
CREATE TABLE IF NOT EXISTS `product_related` (
  `product_id` int NOT NULL,
  `related_id` int NOT NULL,
  `auto_gen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`related_id`),
  KEY `product_id` (`product_id`),
  KEY `related_id` (`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_related_set`
--

DROP TABLE IF EXISTS `product_related_set`;
CREATE TABLE IF NOT EXISTS `product_related_set` (
  `product_id` int NOT NULL,
  `related_id` int NOT NULL,
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_reward`
--

DROP TABLE IF EXISTS `product_reward`;
CREATE TABLE IF NOT EXISTS `product_reward` (
  `product_reward_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL DEFAULT '0',
  `customer_group_id` int NOT NULL DEFAULT '0',
  `store_id` int NOT NULL,
  `points` int NOT NULL DEFAULT '0',
  `percent` int NOT NULL,
  `max_percent` int NOT NULL,
  `coupon_acts` tinyint(1) NOT NULL DEFAULT '0',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_reward_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_group_id` (`customer_group_id`),
  KEY `store_id` (`store_id`),
  KEY `percent` (`percent`),
  KEY `coupon_acts` (`coupon_acts`),
  KEY `date_start` (`date_start`),
  KEY `date_end` (`date_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_shop_by_look`
--

DROP TABLE IF EXISTS `product_shop_by_look`;
CREATE TABLE IF NOT EXISTS `product_shop_by_look` (
  `product_id` int NOT NULL,
  `shop_by_look_id` int NOT NULL,
  UNIQUE KEY `product_id_2` (`product_id`,`shop_by_look_id`) USING BTREE,
  KEY `product_id` (`product_id`),
  KEY `shop_by_look_id` (`shop_by_look_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_similar`
--

DROP TABLE IF EXISTS `product_similar`;
CREATE TABLE IF NOT EXISTS `product_similar` (
  `product_id` int NOT NULL,
  `similar_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`similar_id`) USING BTREE,
  KEY `product_id` (`product_id`),
  KEY `similar_id` (`similar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_similar_to_consider`
--

DROP TABLE IF EXISTS `product_similar_to_consider`;
CREATE TABLE IF NOT EXISTS `product_similar_to_consider` (
  `product_id` int NOT NULL,
  `similar_to_consider_id` int NOT NULL,
  UNIQUE KEY `product_id_2` (`product_id`,`similar_to_consider_id`) USING BTREE,
  KEY `product_id` (`product_id`),
  KEY `similar_to_consider_id` (`similar_to_consider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sources`
--

DROP TABLE IF EXISTS `product_sources`;
CREATE TABLE IF NOT EXISTS `product_sources` (
  `product_source_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `source` varchar(500) NOT NULL,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`product_source_id`),
  KEY `product_id` (`product_id`),
  KEY `source` (`source`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_special`
--

DROP TABLE IF EXISTS `product_special`;
CREATE TABLE IF NOT EXISTS `product_special` (
  `product_special_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `customer_group_id` int NOT NULL DEFAULT '1',
  `priority` int NOT NULL DEFAULT '1',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `old_price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `store_id` int NOT NULL DEFAULT '-1',
  `currency_scode` varchar(3) DEFAULT NULL,
  `points_special` decimal(15,2) NOT NULL DEFAULT '0.00',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `parser_info_price` date NOT NULL DEFAULT '0000-00-00',
  `set_by_stock` tinyint(1) NOT NULL DEFAULT '0',
  `set_by_stock_illiquid` tinyint(1) NOT NULL DEFAULT '0',
  `date_settled_by_stock` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`),
  KEY `priority` (`priority`),
  KEY `currency` (`currency_scode`),
  KEY `price` (`price`),
  KEY `set_by_stock` (`set_by_stock`),
  KEY `set_by_stock_illiquid` (`set_by_stock_illiquid`),
  KEY `date_settled_by_stock` (`date_settled_by_stock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_special_attribute`
--

DROP TABLE IF EXISTS `product_special_attribute`;
CREATE TABLE IF NOT EXISTS `product_special_attribute` (
  `product_special_attribute_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int UNSIGNED NOT NULL,
  `special_attribute_id` int NOT NULL,
  PRIMARY KEY (`product_special_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Table structure for table `product_special_backup`
--

DROP TABLE IF EXISTS `product_special_backup`;
CREATE TABLE IF NOT EXISTS `product_special_backup` (
  `product_special_id` int NOT NULL,
  `product_id` int NOT NULL,
  `customer_group_id` int NOT NULL,
  `priority` int NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `old_price` decimal(15,4) NOT NULL,
  `store_id` int NOT NULL DEFAULT '-1',
  `points_special` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `parser_info_price` date NOT NULL,
  `set_by_stock` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_sponsored`
--

DROP TABLE IF EXISTS `product_sponsored`;
CREATE TABLE IF NOT EXISTS `product_sponsored` (
  `product_id` int NOT NULL,
  `sponsored_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`sponsored_id`) USING BTREE,
  KEY `product_id` (`product_id`),
  KEY `sponsored_id` (`sponsored_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_status`
--

DROP TABLE IF EXISTS `product_status`;
CREATE TABLE IF NOT EXISTS `product_status` (
  `product_id` int NOT NULL,
  `status_id` int NOT NULL,
  `product_show` int NOT NULL,
  `category_show` tinyint(1) NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  KEY `status_id` (`status_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_sticker`
--

DROP TABLE IF EXISTS `product_sticker`;
CREATE TABLE IF NOT EXISTS `product_sticker` (
  `product_sticker_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `langdata` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `foncolor` varchar(255) NOT NULL DEFAULT '0',
  `priority` int NOT NULL,
  `available` int NOT NULL,
  `type` int NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_sticker_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_stock_limits`
--

DROP TABLE IF EXISTS `product_stock_limits`;
CREATE TABLE IF NOT EXISTS `product_stock_limits` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `min_stock` int NOT NULL DEFAULT '0',
  `rec_stock` int NOT NULL DEFAULT '0',
  UNIQUE KEY `product_id_2` (`product_id`,`store_id`),
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`),
  KEY `min_buy` (`min_stock`),
  KEY `rec_buy` (`rec_stock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_stock_status`
--

DROP TABLE IF EXISTS `product_stock_status`;
CREATE TABLE IF NOT EXISTS `product_stock_status` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `stock_status_id` int NOT NULL,
  UNIQUE KEY `product_id_3` (`product_id`,`store_id`) USING BTREE,
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_stock_waits`
--

DROP TABLE IF EXISTS `product_stock_waits`;
CREATE TABLE IF NOT EXISTS `product_stock_waits` (
  `product_id` int NOT NULL,
  `quantity_stock` int NOT NULL DEFAULT '0',
  `quantity_stockM` int NOT NULL DEFAULT '0',
  `quantity_stockK` int NOT NULL DEFAULT '0',
  `quantity_stockMN` int NOT NULL DEFAULT '0',
  `quantity_stockAS` int NOT NULL DEFAULT '0',
  KEY `product_id` (`product_id`),
  KEY `quantity_stockM` (`quantity_stockM`),
  KEY `quantity_stockK` (`quantity_stockK`),
  KEY `quantity_stockMN` (`quantity_stockMN`),
  KEY `quantity_stockAS` (`quantity_stockAS`),
  KEY `quantity_stock` (`quantity_stock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_tab`
--

DROP TABLE IF EXISTS `product_tab`;
CREATE TABLE IF NOT EXISTS `product_tab` (
  `tab_id` int NOT NULL AUTO_INCREMENT,
  `sort_order` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('default','regular','reserved') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'regular',
  `key` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `login` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_tab_content`
--

DROP TABLE IF EXISTS `product_tab_content`;
CREATE TABLE IF NOT EXISTS `product_tab_content` (
  `product_id` int NOT NULL,
  `language_id` int NOT NULL,
  `tab_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`,`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_tab_default`
--

DROP TABLE IF EXISTS `product_tab_default`;
CREATE TABLE IF NOT EXISTS `product_tab_default` (
  `tab_id` int NOT NULL,
  `language_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`tab_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_tab_name`
--

DROP TABLE IF EXISTS `product_tab_name`;
CREATE TABLE IF NOT EXISTS `product_tab_name` (
  `tab_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`tab_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_to_category`
--

DROP TABLE IF EXISTS `product_to_category`;
CREATE TABLE IF NOT EXISTS `product_to_category` (
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  `main_category` int NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`),
  KEY `main_category` (`main_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_to_download`
--

DROP TABLE IF EXISTS `product_to_download`;
CREATE TABLE IF NOT EXISTS `product_to_download` (
  `product_id` int NOT NULL,
  `download_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_to_layout`
--

DROP TABLE IF EXISTS `product_to_layout`;
CREATE TABLE IF NOT EXISTS `product_to_layout` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `layout_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_to_set`
--

DROP TABLE IF EXISTS `product_to_set`;
CREATE TABLE IF NOT EXISTS `product_to_set` (
  `set_id` int NOT NULL,
  `product_id` int NOT NULL,
  `clean_product_id` int DEFAULT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_in_set` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `quantity` int NOT NULL,
  `present` int DEFAULT NULL,
  `show_in_product` int DEFAULT NULL,
  `sort_order` int NOT NULL,
  KEY `set_id` (`set_id`),
  KEY `clean_product_id` (`clean_product_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_to_store`
--

DROP TABLE IF EXISTS `product_to_store`;
CREATE TABLE IF NOT EXISTS `product_to_store` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`),
  KEY `store_id` (`store_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_to_tab`
--

DROP TABLE IF EXISTS `product_to_tab`;
CREATE TABLE IF NOT EXISTS `product_to_tab` (
  `product_id` int NOT NULL,
  `tab_id` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`product_id`,`tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
CREATE TABLE IF NOT EXISTS `product_variants` (
  `main_asin` varchar(32) NOT NULL,
  `variant_asin` varchar(32) NOT NULL,
  UNIQUE KEY `main_asin` (`main_asin`) USING BTREE,
  KEY `variant_asin` (`variant_asin`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants_ids`
--

DROP TABLE IF EXISTS `product_variants_ids`;
CREATE TABLE IF NOT EXISTS `product_variants_ids` (
  `product_id` int NOT NULL,
  `variant_id` int NOT NULL,
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_video`
--

DROP TABLE IF EXISTS `product_video`;
CREATE TABLE IF NOT EXISTS `product_video` (
  `product_video_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `video` varchar(1024) DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_video_id`),
  KEY `product_id` (`product_id`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_video_description`
--

DROP TABLE IF EXISTS `product_video_description`;
CREATE TABLE IF NOT EXISTS `product_video_description` (
  `product_video_id` int NOT NULL,
  `product_id` int NOT NULL,
  `language_id` varchar(255) DEFAULT NULL,
  `title` text NOT NULL,
  KEY `language_id` (`language_id`),
  KEY `product_video_id` (`product_video_id`),
  KEY `product_video_id_2` (`product_video_id`,`language_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `product_view_to_purchase`
--

DROP TABLE IF EXISTS `product_view_to_purchase`;
CREATE TABLE IF NOT EXISTS `product_view_to_purchase` (
  `product_id` int NOT NULL,
  `view_to_purchase_id` int NOT NULL,
  UNIQUE KEY `product_id_2` (`product_id`,`view_to_purchase_id`) USING BTREE,
  KEY `product_id` (`product_id`),
  KEY `view_to_purchase_id` (`view_to_purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_yam_data`
--

DROP TABLE IF EXISTS `product_yam_data`;
CREATE TABLE IF NOT EXISTS `product_yam_data` (
  `product_id` int NOT NULL,
  `yam_real_price` decimal(15,2) NOT NULL,
  `yam_hidings` text NOT NULL,
  `yam_category_name` varchar(1024) NOT NULL,
  `yam_category_id` int NOT NULL,
  `yam_fees` text NOT NULL,
  `AGENCY_COMMISSION` decimal(15,2) NOT NULL,
  `FEE` decimal(15,2) NOT NULL,
  UNIQUE KEY `product_id` (`product_id`),
  KEY `yam_category_id` (`yam_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_yam_recommended_prices`
--

DROP TABLE IF EXISTS `product_yam_recommended_prices`;
CREATE TABLE IF NOT EXISTS `product_yam_recommended_prices` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `currency` varchar(5) NOT NULL,
  `BUYBOX` decimal(15,2) NOT NULL,
  `DEFAULT_OFFER` decimal(15,2) NOT NULL,
  `MIN_PRICE_MARKET` decimal(15,2) NOT NULL,
  `MAX_DISCOUNT_BASE` decimal(15,2) NOT NULL,
  `MARKET_OUTLIER_PRICE` decimal(15,2) NOT NULL,
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `profile_id` int NOT NULL AUTO_INCREMENT,
  `sort_order` int NOT NULL,
  `status` tinyint NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int UNSIGNED NOT NULL,
  `cycle` int UNSIGNED NOT NULL,
  `trial_status` tinyint NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int UNSIGNED NOT NULL,
  `trial_cycle` int UNSIGNED NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `profile_description`
--

DROP TABLE IF EXISTS `profile_description`;
CREATE TABLE IF NOT EXISTS `profile_description` (
  `profile_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`profile_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `queue_mail`
--

DROP TABLE IF EXISTS `queue_mail`;
CREATE TABLE IF NOT EXISTS `queue_mail` (
  `queue_mail_id` int NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL,
  PRIMARY KEY (`queue_mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `queue_push`
--

DROP TABLE IF EXISTS `queue_push`;
CREATE TABLE IF NOT EXISTS `queue_push` (
  `queue_push_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`queue_push_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `queue_sms`
--

DROP TABLE IF EXISTS `queue_sms`;
CREATE TABLE IF NOT EXISTS `queue_sms` (
  `queue_sms_id` int NOT NULL AUTO_INCREMENT,
  `body` text NOT NULL,
  PRIMARY KEY (`queue_sms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
CREATE TABLE IF NOT EXISTS `redirect` (
  `redirect_id` int NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `from_url` varchar(600) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `to_url` varchar(600) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `response_code` int NOT NULL DEFAULT '301',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `times_used` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`redirect_id`),
  KEY `active` (`active`),
  KEY `date_start` (`date_start`),
  KEY `date_end` (`date_end`),
  KEY `from_url` (`from_url`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `referrer_patterns`
--

DROP TABLE IF EXISTS `referrer_patterns`;
CREATE TABLE IF NOT EXISTS `referrer_patterns` (
  `pattern_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `url_mask` varchar(256) NOT NULL,
  `url_param` varchar(256) NOT NULL,
  PRIMARY KEY (`pattern_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `return`
--

DROP TABLE IF EXISTS `return`;
CREATE TABLE IF NOT EXISTS `return` (
  `return_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `order_product_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `pricewd_national` decimal(15,2) NOT NULL,
  `price_national` decimal(15,4) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `totalwd_national` decimal(15,2) NOT NULL,
  `total_national` decimal(15,4) NOT NULL,
  `quantity` int NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int NOT NULL,
  `return_action_id` int NOT NULL,
  `return_status_id` int NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `to_supplier` tinyint NOT NULL DEFAULT '0',
  `reorder_id` int NOT NULL,
  PRIMARY KEY (`return_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  KEY `return_reason_id` (`return_reason_id`),
  KEY `return_action_id` (`return_action_id`),
  KEY `return_status_id` (`return_status_id`),
  KEY `reorder_id` (`reorder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `return_action`
--

DROP TABLE IF EXISTS `return_action`;
CREATE TABLE IF NOT EXISTS `return_action` (
  `return_action_id` int NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `return_history`
--

DROP TABLE IF EXISTS `return_history`;
CREATE TABLE IF NOT EXISTS `return_history` (
  `return_history_id` int NOT NULL AUTO_INCREMENT,
  `return_id` int NOT NULL,
  `return_status_id` int NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`),
  KEY `return_id` (`return_id`),
  KEY `return_status_id` (`return_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `return_reason`
--

DROP TABLE IF EXISTS `return_reason`;
CREATE TABLE IF NOT EXISTS `return_reason` (
  `return_reason_id` int NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `return_status`
--

DROP TABLE IF EXISTS `return_status`;
CREATE TABLE IF NOT EXISTS `return_status` (
  `return_status_id` int NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `parent_id` int NOT NULL,
  `sorthex` int NOT NULL,
  `customer_id` int NOT NULL,
  `author` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `addimage` text NOT NULL,
  `html_status` tinyint(1) NOT NULL,
  `purchased` tinyint(1) NOT NULL,
  `answer` text NOT NULL,
  `bads` text NOT NULL,
  `good` text NOT NULL,
  `rating` int NOT NULL,
  `rating_mark` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `auto_gen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`),
  KEY `rating` (`rating`),
  KEY `status` (`status`),
  KEY `date_added` (`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `review_description`
--

DROP TABLE IF EXISTS `review_description`;
CREATE TABLE IF NOT EXISTS `review_description` (
  `review_id` int NOT NULL,
  `language_id` int NOT NULL,
  `text` mediumtext NOT NULL,
  `answer` mediumtext NOT NULL,
  `bads` mediumtext NOT NULL,
  `good` mediumtext NOT NULL,
  UNIQUE KEY `review_id_2` (`review_id`,`language_id`),
  KEY `review_id` (`review_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review_fields`
--

DROP TABLE IF EXISTS `review_fields`;
CREATE TABLE IF NOT EXISTS `review_fields` (
  `review_id` int NOT NULL,
  `mark` varchar(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `comm_comfort` text NOT NULL,
  KEY `review_id` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `review_name`
--

DROP TABLE IF EXISTS `review_name`;
CREATE TABLE IF NOT EXISTS `review_name` (
  `review_name_id` int NOT NULL AUTO_INCREMENT,
  `l_code` varchar(5) DEFAULT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`review_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `review_template`
--

DROP TABLE IF EXISTS `review_template`;
CREATE TABLE IF NOT EXISTS `review_template` (
  `review_template_id` int NOT NULL AUTO_INCREMENT,
  `l_code` varchar(5) DEFAULT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`review_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `search_history`
--

DROP TABLE IF EXISTS `search_history`;
CREATE TABLE IF NOT EXISTS `search_history` (
  `text` varchar(500) NOT NULL,
  `times` int NOT NULL,
  `results` int NOT NULL,
  UNIQUE KEY `text` (`text`),
  KEY `times` (`times`),
  KEY `results` (`results`),
  KEY `times_2` (`times`,`results`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `segments`
--

DROP TABLE IF EXISTS `segments`;
CREATE TABLE IF NOT EXISTS `segments` (
  `segment_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `txt_color` varchar(255) NOT NULL,
  `bg_color` varchar(255) NOT NULL,
  `fa_icon` varchar(255) NOT NULL,
  `determination` longtext NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `sort_order` int NOT NULL,
  `customer_count` int NOT NULL,
  `total_cheque` int NOT NULL,
  `avg_cheque` int NOT NULL,
  `order_good_count` int NOT NULL,
  `order_bad_count` int NOT NULL,
  `order_good_to_bad` int NOT NULL,
  `avg_csi` float(2,1) NOT NULL,
  `new_days` int NOT NULL DEFAULT '7',
  `group` varchar(50) NOT NULL,
  PRIMARY KEY (`segment_id`),
  KEY `sort_order` (`sort_order`),
  KEY `group` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `segments_dynamics`
--

DROP TABLE IF EXISTS `segments_dynamics`;
CREATE TABLE IF NOT EXISTS `segments_dynamics` (
  `segment_dynamics_id` int NOT NULL AUTO_INCREMENT,
  `segment_id` int NOT NULL,
  `customer_count` int NOT NULL,
  `total_cheque` int NOT NULL,
  `avg_cheque` int NOT NULL,
  `order_good_count` int NOT NULL,
  `order_bad_count` int NOT NULL,
  `order_good_to_bad` int NOT NULL,
  `avg_csi` float(2,1) NOT NULL,
  `date_added` date NOT NULL,
  PRIMARY KEY (`segment_dynamics_id`),
  KEY `segment_id` (`segment_id`) USING BTREE,
  KEY `date_added` (`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `seocities`
--

DROP TABLE IF EXISTS `seocities`;
CREATE TABLE IF NOT EXISTS `seocities` (
  `seocity_id` bigint NOT NULL AUTO_INCREMENT,
  `seocity_name` varchar(255) NOT NULL,
  `seocity_name2` varchar(255) NOT NULL,
  `seocity_phone` varchar(255) NOT NULL,
  `seocity_phone2` varchar(255) NOT NULL,
  `seocity_delivery_info` varchar(255) NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`seocity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `seo_hreflang`
--

DROP TABLE IF EXISTS `seo_hreflang`;
CREATE TABLE IF NOT EXISTS `seo_hreflang` (
  `language_id` int NOT NULL,
  `query` varchar(255) NOT NULL,
  `url` varchar(500) NOT NULL,
  UNIQUE KEY `language_id_2` (`language_id`,`query`),
  KEY `language_id` (`language_id`),
  KEY `query` (`query`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `set`
--

DROP TABLE IF EXISTS `set`;
CREATE TABLE IF NOT EXISTS `set` (
  `set_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `percent` int NOT NULL,
  `sort_order` int NOT NULL DEFAULT '1',
  `enable_productcard` tinyint(1) DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `tax_class_id` int NOT NULL,
  `date_added` datetime NOT NULL,
  `count_persone` int NOT NULL,
  `set_group` varchar(255) NOT NULL,
  PRIMARY KEY (`set_id`),
  KEY `product_id` (`product_id`),
  KEY `tax_class_id` (`tax_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL DEFAULT '0',
  `group` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` longtext,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `store_id` (`store_id`),
  KEY `group` (`group`),
  KEY `key` (`key`),
  KEY `value` (`value`(1024)),
  KEY `group_2` (`group`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `set_description`
--

DROP TABLE IF EXISTS `set_description`;
CREATE TABLE IF NOT EXISTS `set_description` (
  `set_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`set_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `set_to_category`
--

DROP TABLE IF EXISTS `set_to_category`;
CREATE TABLE IF NOT EXISTS `set_to_category` (
  `set_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`set_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `set_to_store`
--

DROP TABLE IF EXISTS `set_to_store`;
CREATE TABLE IF NOT EXISTS `set_to_store` (
  `set_id` int NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`set_id`,`store_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `shoputils_citycourier_description`
--

DROP TABLE IF EXISTS `shoputils_citycourier_description`;
CREATE TABLE IF NOT EXISTS `shoputils_citycourier_description` (
  `language_id` int NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  UNIQUE KEY `IDX_oc_shoputils_citycourier_description` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Shoputils citycourier shipping ';

-- --------------------------------------------------------

--
-- Table structure for table `shoputils_cumulative_discounts`
--

DROP TABLE IF EXISTS `shoputils_cumulative_discounts`;
CREATE TABLE IF NOT EXISTS `shoputils_cumulative_discounts` (
  `discount_id` int NOT NULL AUTO_INCREMENT,
  `days` int NOT NULL DEFAULT '0',
  `summ` decimal(11,2) NOT NULL DEFAULT '0.00',
  `percent` decimal(5,2) NOT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `products_special` tinyint(1) NOT NULL DEFAULT '0',
  `first_order` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='Cumulative discounts';

-- --------------------------------------------------------

--
-- Table structure for table `shoputils_cumulative_discounts_cmsdata`
--

DROP TABLE IF EXISTS `shoputils_cumulative_discounts_cmsdata`;
CREATE TABLE IF NOT EXISTS `shoputils_cumulative_discounts_cmsdata` (
  `language_id` int NOT NULL,
  `store_id` int DEFAULT '0',
  `description_before` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description_after` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='Cumulative discounts CMS data';

-- --------------------------------------------------------

--
-- Table structure for table `shoputils_cumulative_discounts_description`
--

DROP TABLE IF EXISTS `shoputils_cumulative_discounts_description`;
CREATE TABLE IF NOT EXISTS `shoputils_cumulative_discounts_description` (
  `discount_id` int NOT NULL,
  `language_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  UNIQUE KEY `IDX_shoputils_cumulative_discounts_description` (`discount_id`,`language_id`),
  KEY `discount_id` (`discount_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='Cumulative discounts descriptions';

-- --------------------------------------------------------

--
-- Table structure for table `shoputils_cumulative_discounts_to_customer_group`
--

DROP TABLE IF EXISTS `shoputils_cumulative_discounts_to_customer_group`;
CREATE TABLE IF NOT EXISTS `shoputils_cumulative_discounts_to_customer_group` (
  `discount_id` int NOT NULL,
  `customer_group_id` int NOT NULL,
  UNIQUE KEY `IDX_shoputils_cumulative_discounts_to_customer_group` (`discount_id`,`customer_group_id`),
  KEY `discount_id` (`discount_id`),
  KEY `customer_group_id` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='Cumulative discounts to customer group';

-- --------------------------------------------------------

--
-- Table structure for table `shoputils_cumulative_discounts_to_manufacturer`
--

DROP TABLE IF EXISTS `shoputils_cumulative_discounts_to_manufacturer`;
CREATE TABLE IF NOT EXISTS `shoputils_cumulative_discounts_to_manufacturer` (
  `discount_id` int NOT NULL,
  `manufacturer_id` int NOT NULL,
  UNIQUE KEY `discount_id` (`discount_id`,`manufacturer_id`),
  KEY `discount_id_2` (`discount_id`),
  KEY `manufacturer_id` (`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `shoputils_cumulative_discounts_to_store`
--

DROP TABLE IF EXISTS `shoputils_cumulative_discounts_to_store`;
CREATE TABLE IF NOT EXISTS `shoputils_cumulative_discounts_to_store` (
  `discount_id` int NOT NULL,
  `store_id` int NOT NULL,
  UNIQUE KEY `IDX_shoputils_cumulative_discounts_to_store` (`discount_id`,`store_id`),
  KEY `discount_id` (`discount_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='Cumulative discounts to store';

-- --------------------------------------------------------

--
-- Table structure for table `shop_rating`
--

DROP TABLE IF EXISTS `shop_rating`;
CREATE TABLE IF NOT EXISTS `shop_rating` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `rate_status` int NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `customer_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `shop_rate` int DEFAULT NULL,
  `site_rate` int DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `good` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `bad` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`rate_id`),
  KEY `store_id` (`store_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_rating_answers`
--

DROP TABLE IF EXISTS `shop_rating_answers`;
CREATE TABLE IF NOT EXISTS `shop_rating_answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rate_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date_added` datetime NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `notified` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_rating_custom_types`
--

DROP TABLE IF EXISTS `shop_rating_custom_types`;
CREATE TABLE IF NOT EXISTS `shop_rating_custom_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_rating_custom_values`
--

DROP TABLE IF EXISTS `shop_rating_custom_values`;
CREATE TABLE IF NOT EXISTS `shop_rating_custom_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `custom_id` int NOT NULL,
  `rate_id` int NOT NULL,
  `custom_value` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_rating_description`
--

DROP TABLE IF EXISTS `shop_rating_description`;
CREATE TABLE IF NOT EXISTS `shop_rating_description` (
  `rate_id` int NOT NULL,
  `language_id` int NOT NULL,
  `comment` mediumtext NOT NULL,
  `good` mediumtext NOT NULL,
  `bad` mediumtext NOT NULL,
  `answer` mediumtext NOT NULL,
  UNIQUE KEY `rate_id_2` (`rate_id`,`language_id`),
  KEY `rate_id` (`rate_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `short_url_alias`
--

DROP TABLE IF EXISTS `short_url_alias`;
CREATE TABLE IF NOT EXISTS `short_url_alias` (
  `url_id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `alias` varchar(1024) NOT NULL,
  `used` int NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`url_id`),
  KEY `url` (`url`),
  KEY `alias` (`alias`),
  KEY `date_added` (`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `simple_cart`
--

DROP TABLE IF EXISTS `simple_cart`;
CREATE TABLE IF NOT EXISTS `simple_cart` (
  `simple_cart_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `email` varchar(96) DEFAULT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `products` text,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`simple_cart_id`),
  KEY `store_id` (`store_id`),
  KEY `customer_id` (`customer_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `simple_custom_data`
--

DROP TABLE IF EXISTS `simple_custom_data`;
CREATE TABLE IF NOT EXISTS `simple_custom_data` (
  `object_type` tinyint NOT NULL,
  `object_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`object_type`,`object_id`,`customer_id`),
  KEY `object_id` (`object_id`),
  KEY `object_type` (`object_type`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `sms_log`
--

DROP TABLE IF EXISTS `sms_log`;
CREATE TABLE IF NOT EXISTS `sms_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `date_send` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `socnetauth2_customer2account`
--

DROP TABLE IF EXISTS `socnetauth2_customer2account`;
CREATE TABLE IF NOT EXISTS `socnetauth2_customer2account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(100) NOT NULL,
  `identity` varchar(300) NOT NULL,
  `link` varchar(300) NOT NULL,
  `provider` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `socnetauth2_precode`
--

DROP TABLE IF EXISTS `socnetauth2_precode`;
CREATE TABLE IF NOT EXISTS `socnetauth2_precode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identity` varchar(300) NOT NULL,
  `code` varchar(300) NOT NULL,
  `cdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `socnetauth2_records`
--

DROP TABLE IF EXISTS `socnetauth2_records`;
CREATE TABLE IF NOT EXISTS `socnetauth2_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state` varchar(100) NOT NULL,
  `redirect` varchar(300) NOT NULL,
  `cdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `special_attribute`
--

DROP TABLE IF EXISTS `special_attribute`;
CREATE TABLE IF NOT EXISTS `special_attribute` (
  `special_attribute_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `special_attribute_group_id` int UNSIGNED NOT NULL,
  `special_attribute_name` varchar(100) NOT NULL DEFAULT '',
  `special_attribute_value` varchar(2000) NOT NULL DEFAULT '',
  PRIMARY KEY (`special_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `special_attribute_group`
--

DROP TABLE IF EXISTS `special_attribute_group`;
CREATE TABLE IF NOT EXISTS `special_attribute_group` (
  `special_attribute_group_id` int UNSIGNED NOT NULL,
  `special_attribute_group_name` varchar(100) NOT NULL DEFAULT '',
  `special_attribute_group_description` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`special_attribute_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `sphinx_suggestions`
--

DROP TABLE IF EXISTS `sphinx_suggestions`;
CREATE TABLE IF NOT EXISTS `sphinx_suggestions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `trigrams` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `freq` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `status_id` int NOT NULL,
  `language_id` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` text NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`status_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `stocks_dynamics`
--

DROP TABLE IF EXISTS `stocks_dynamics`;
CREATE TABLE IF NOT EXISTS `stocks_dynamics` (
  `stock_dynamics_id` int NOT NULL AUTO_INCREMENT,
  `date_added` date NOT NULL,
  `warehouse_identifier` varchar(30) NOT NULL,
  `p_count` int NOT NULL,
  `q_count` int NOT NULL,
  PRIMARY KEY (`stock_dynamics_id`),
  UNIQUE KEY `date_added` (`date_added`,`warehouse_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `stock_status`
--

DROP TABLE IF EXISTS `stock_status`;
CREATE TABLE IF NOT EXISTS `stock_status` (
  `stock_status_id` int NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
CREATE TABLE IF NOT EXISTS `store` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE IF NOT EXISTS `subscribe` (
  `subscribe_id` int NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`subscribe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `subscribe_auth_description`
--

DROP TABLE IF EXISTS `subscribe_auth_description`;
CREATE TABLE IF NOT EXISTS `subscribe_auth_description` (
  `subscribe_auth_id` int NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL,
  `subscribe_authorization` mediumtext NOT NULL,
  PRIMARY KEY (`subscribe_auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `subscribe_email_description`
--

DROP TABLE IF EXISTS `subscribe_email_description`;
CREATE TABLE IF NOT EXISTS `subscribe_email_description` (
  `subscribe_desc_id` int NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL,
  `subscribe_descriptions` mediumtext NOT NULL,
  PRIMARY KEY (`subscribe_desc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `superstat_viewed`
--

DROP TABLE IF EXISTS `superstat_viewed`;
CREATE TABLE IF NOT EXISTS `superstat_viewed` (
  `entity_type` enum('p','c','m') NOT NULL,
  `entity_id` int NOT NULL,
  `store_id` int NOT NULL,
  `date` date NOT NULL,
  `times` int NOT NULL DEFAULT '0',
  UNIQUE KEY `entity_type_2` (`entity_type`,`entity_id`,`store_id`,`date`),
  KEY `entity_type` (`entity_type`),
  KEY `entity_id` (`entity_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) NOT NULL,
  `supplier_code` varchar(50) NOT NULL,
  `supplier_type` varchar(50) NOT NULL,
  `supplier_country` varchar(255) NOT NULL,
  `supplier_inner` tinyint(1) NOT NULL,
  `supplier_comment` text NOT NULL,
  `supplier_m_coef` decimal(15,2) NOT NULL,
  `supplier_l_coef` decimal(15,2) NOT NULL,
  `supplier_n_coef` decimal(15,2) NOT NULL,
  `sort_order` int NOT NULL,
  `supplier_parent_id` int NOT NULL,
  `1c_uuid` varchar(40) NOT NULL,
  `link_mask` varchar(256) NOT NULL,
  `terms_instock` varchar(32) NOT NULL,
  `terms_outstock` varchar(32) NOT NULL,
  `amzn_good` tinyint(1) NOT NULL,
  `amzn_bad` tinyint(1) NOT NULL,
  `amzn_coefficient` int NOT NULL,
  PRIMARY KEY (`supplier_id`),
  KEY `supplier_name` (`supplier_name`),
  KEY `1c_uuid` (`1c_uuid`),
  KEY `amzn_good` (`amzn_good`),
  KEY `amzn_bad` (`amzn_bad`),
  KEY `supplier_type` (`supplier_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
CREATE TABLE IF NOT EXISTS `tax_class` (
  `tax_class_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rate`
--

DROP TABLE IF EXISTS `tax_rate`;
CREATE TABLE IF NOT EXISTS `tax_rate` (
  `tax_rate_id` int NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_rate_id`),
  KEY `geo_zone_id` (`geo_zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rate_to_customer_group`
--

DROP TABLE IF EXISTS `tax_rate_to_customer_group`;
CREATE TABLE IF NOT EXISTS `tax_rate_to_customer_group` (
  `tax_rate_id` int NOT NULL,
  `customer_group_id` int NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`),
  KEY `customer_group_id` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rule`
--

DROP TABLE IF EXISTS `tax_rule`;
CREATE TABLE IF NOT EXISTS `tax_rule` (
  `tax_rule_id` int NOT NULL AUTO_INCREMENT,
  `tax_class_id` int NOT NULL,
  `tax_rate_id` int NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`),
  KEY `tax_class_id` (`tax_class_id`),
  KEY `tax_rate_id` (`tax_rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `telegram_chats`
--

DROP TABLE IF EXISTS `telegram_chats`;
CREATE TABLE IF NOT EXISTS `telegram_chats` (
  `id` bigint NOT NULL DEFAULT '0' COMMENT 'Unique user or chat identifier',
  `type` char(10) DEFAULT '' COMMENT 'chat type private groupe or channel',
  `title` char(255) DEFAULT '' COMMENT 'chat title null if case of single chat with the bot',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Entry date creation',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Entry date update',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `telegram_messages`
--

DROP TABLE IF EXISTS `telegram_messages`;
CREATE TABLE IF NOT EXISTS `telegram_messages` (
  `update_id` bigint UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The update''s unique identifier.',
  `message_id` bigint DEFAULT NULL COMMENT 'Unique message identifier',
  `user_id` bigint DEFAULT NULL COMMENT 'User identifier',
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date the message was sent in timestamp format',
  `chat_id` bigint NOT NULL DEFAULT '0' COMMENT 'Chat identifier.',
  `forward_from` bigint NOT NULL DEFAULT '0' COMMENT 'User id. For forwarded messages, sender of the original message',
  `forward_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'For forwarded messages, date the original message was sent in Unix time',
  `reply_to_message` longtext COMMENT 'Message object. For replies, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.',
  `text` longtext COMMENT 'For text messages, the actual UTF-8 text of the message',
  `audio` text COMMENT 'Audio object. Message is an audio file, information about the file',
  `document` text COMMENT 'Document object. Message is a general file, information about the file',
  `photo` text COMMENT 'Array of PhotoSize objects. Message is a photo, available sizes of the photo',
  `sticker` text COMMENT 'Sticker object. Message is a sticker, information about the sticker',
  `video` text COMMENT 'Video object. Message is a video, information about the video',
  `voice` text COMMENT 'Voice Object. Message is a Voice, information about the Voice',
  `caption` longtext COMMENT 'For message with caption, the actual UTF-8 text of the caption',
  `contact` text COMMENT 'Contact object. Message is a shared contact, information about the contact',
  `location` text COMMENT 'Location object. Message is a shared location, information about the location',
  `new_chat_participant` bigint NOT NULL DEFAULT '0' COMMENT 'User id. A new member was added to the group, information about them (this member may be bot itself)',
  `left_chat_participant` bigint NOT NULL DEFAULT '0' COMMENT 'User id. A member was removed from the group, information about them (this member may be bot itself)',
  `new_chat_title` char(255) DEFAULT '' COMMENT 'A group title was changed to this value',
  `new_chat_photo` text COMMENT 'Array of PhotoSize objects. A group photo was change to this value',
  `delete_chat_photo` tinyint(1) DEFAULT '0' COMMENT 'Informs that the group photo was deleted',
  `group_chat_created` tinyint(1) DEFAULT '0' COMMENT 'Informs that the group has been created',
  PRIMARY KEY (`update_id`),
  KEY `message_id` (`message_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `telegram_users`
--

DROP TABLE IF EXISTS `telegram_users`;
CREATE TABLE IF NOT EXISTS `telegram_users` (
  `id` bigint NOT NULL DEFAULT '0' COMMENT 'Unique user identifier',
  `first_name` char(255) NOT NULL DEFAULT '' COMMENT 'User first name',
  `last_name` char(255) DEFAULT '' COMMENT 'User last name',
  `username` char(255) DEFAULT '' COMMENT 'User username',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Entry date creation',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Entry date update',
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `telegram_users_chats`
--

DROP TABLE IF EXISTS `telegram_users_chats`;
CREATE TABLE IF NOT EXISTS `telegram_users_chats` (
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT 'Unique user identifier',
  `chat_id` bigint NOT NULL DEFAULT '0' COMMENT 'Unique user or chat identifier',
  PRIMARY KEY (`user_id`,`chat_id`),
  KEY `chat_id` (`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
CREATE TABLE IF NOT EXISTS `temp` (
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `user_group_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `from_user_id` int DEFAULT NULL,
  `entity_type` varchar(30) NOT NULL,
  `entity_id` int NOT NULL,
  `is_recall` tinyint(1) NOT NULL DEFAULT '0',
  `entity_string` varchar(255) NOT NULL,
  `message` text,
  `reply` text NOT NULL,
  `priority` varchar(10) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_max` datetime DEFAULT NULL,
  `date_at` datetime NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `status` int NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `user_group_id` (`user_group_id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `from_user` (`from_user_id`),
  KEY `date_added` (`date_added`),
  KEY `date_max` (`date_max`),
  KEY `sort_order` (`sort_order`),
  KEY `entity_id` (`entity_id`),
  KEY `entity_type` (`entity_type`),
  KEY `date_at` (`date_at`),
  KEY `is_recall` (`is_recall`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_sort`
--

DROP TABLE IF EXISTS `ticket_sort`;
CREATE TABLE IF NOT EXISTS `ticket_sort` (
  `ticket_id` int NOT NULL,
  `sort_order` int NOT NULL,
  UNIQUE KEY `ticket_id` (`ticket_id`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--

DROP TABLE IF EXISTS `tracker`;
CREATE TABLE IF NOT EXISTS `tracker` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ip` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `date_visited` date DEFAULT NULL,
  `time_visited` time DEFAULT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `page_viewed` text,
  `arrived_from_page` text,
  `remote_host` text,
  `request_uri` text,
  `isbot` int DEFAULT NULL,
  `current_page` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `translate_stats`
--

DROP TABLE IF EXISTS `translate_stats`;
CREATE TABLE IF NOT EXISTS `translate_stats` (
  `time` datetime NOT NULL,
  `amount` int NOT NULL,
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trigger_history`
--

DROP TABLE IF EXISTS `trigger_history`;
CREATE TABLE IF NOT EXISTS `trigger_history` (
  `trigger_history_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `actiontemplate_id` int NOT NULL,
  `type` varchar(64) NOT NULL,
  `date_added` date NOT NULL,
  PRIMARY KEY (`trigger_history_id`),
  KEY `trigger_history_id` (`trigger_history_id`,`order_id`,`customer_id`),
  KEY `trigger_history_id_2` (`trigger_history_id`,`order_id`,`actiontemplate_id`),
  KEY `order_id` (`order_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `url_alias`
--

DROP TABLE IF EXISTS `url_alias`;
CREATE TABLE IF NOT EXISTS `url_alias` (
  `url_alias_id` int NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `language_id` int NOT NULL DEFAULT '-1',
  `auto_gen` varchar(24) DEFAULT '',
  PRIMARY KEY (`url_alias_id`),
  UNIQUE KEY `query_language` (`query`,`language_id`) USING BTREE,
  KEY `keyword` (`keyword`) USING BTREE,
  KEY `language_id` (`language_id`),
  KEY `query` (`query`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `url_alias_cached`
--

DROP TABLE IF EXISTS `url_alias_cached`;
CREATE TABLE IF NOT EXISTS `url_alias_cached` (
  `store_id` int NOT NULL,
  `language_id` int NOT NULL,
  `route` varchar(255) NOT NULL,
  `args` varchar(255) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `url` varchar(1024) NOT NULL,
  KEY `store_id` (`store_id`),
  KEY `language_id` (`language_id`),
  KEY `route` (`route`),
  KEY `args` (`args`),
  KEY `checksum` (`checksum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `url_alias_old`
--

DROP TABLE IF EXISTS `url_alias_old`;
CREATE TABLE IF NOT EXISTS `url_alias_old` (
  `url_alias_id` int NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  UNIQUE KEY `query` (`query`) USING BTREE,
  KEY `keyword` (`keyword`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `url_alias_tmp`
--

DROP TABLE IF EXISTS `url_alias_tmp`;
CREATE TABLE IF NOT EXISTS `url_alias_tmp` (
  `url_alias_id` int NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `language_id` int NOT NULL DEFAULT '-1',
  `auto_gen` varchar(24) DEFAULT '',
  PRIMARY KEY (`url_alias_id`),
  UNIQUE KEY `query_language` (`query`,`language_id`) USING BTREE,
  KEY `keyword` (`keyword`) USING BTREE,
  KEY `language_id` (`language_id`),
  KEY `query` (`query`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_group_id` int NOT NULL,
  `bitrix_id` int NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `code` varchar(40) NOT NULL,
  `is_av` tinyint(1) NOT NULL,
  `is_mainmanager` tinyint(1) NOT NULL,
  `is_headsales` tinyint(1) NOT NULL DEFAULT '0',
  `internal_pbx_num` varchar(255) NOT NULL,
  `internal_auth_pbx_num` varchar(255) NOT NULL,
  `outbound_pbx_num` varchar(255) NOT NULL,
  `own_orders` tinyint(1) NOT NULL DEFAULT '0',
  `count_worktime` tinyint(1) NOT NULL,
  `count_content` tinyint(1) NOT NULL DEFAULT '0',
  `edit_csi` tinyint(1) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ticket` tinyint(1) NOT NULL,
  `unlock_orders` tinyint(1) NOT NULL,
  `do_transactions` tinyint(1) NOT NULL,
  `dev_template` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `user_group_id` (`user_group_id`),
  KEY `bitrix_id` (`bitrix_id`),
  KEY `unlock_orders` (`unlock_orders`),
  KEY `ip` (`ip`),
  KEY `status` (`status`),
  KEY `email` (`email`),
  KEY `username` (`username`),
  KEY `ticket` (`ticket`),
  KEY `ip_2` (`ip`,`status`),
  KEY `user_id` (`user_id`,`status`),
  KEY `user_id_2` (`user_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `user_content`
--

DROP TABLE IF EXISTS `user_content`;
CREATE TABLE IF NOT EXISTS `user_content` (
  `user_id` int NOT NULL,
  `datetime` datetime NOT NULL,
  `date` date NOT NULL,
  `action` varchar(10) NOT NULL,
  `entity_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `entity_id` int NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `date` (`date`),
  KEY `action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE IF NOT EXISTS `user_group` (
  `user_group_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  `template_prefix` varchar(255) NOT NULL,
  `alert_namespace` varchar(25) NOT NULL,
  `ticket` tinyint(1) NOT NULL,
  `sip_queue` varchar(4) NOT NULL,
  `bitrix_id` varchar(20) NOT NULL,
  PRIMARY KEY (`user_group_id`),
  KEY `alert_namespace` (`alert_namespace`),
  KEY `ticket` (`ticket`),
  KEY `sip_queue` (`sip_queue`),
  KEY `bitrix_id` (`bitrix_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `user_group_to_store`
--

DROP TABLE IF EXISTS `user_group_to_store`;
CREATE TABLE IF NOT EXISTS `user_group_to_store` (
  `user_group_id` int NOT NULL,
  `store_id` int NOT NULL,
  KEY `user_group_id` (`user_group_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `user_worktime`
--

DROP TABLE IF EXISTS `user_worktime`;
CREATE TABLE IF NOT EXISTS `user_worktime` (
  `user_id` int NOT NULL,
  `date` date NOT NULL,
  `inbound_call_count` int NOT NULL DEFAULT '0',
  `inbound_call_duration` int NOT NULL DEFAULT '0',
  `outbound_call_count` int NOT NULL DEFAULT '0',
  `outbound_call_duration` int NOT NULL DEFAULT '0',
  `owned_order_count` int NOT NULL DEFAULT '0',
  `edit_order_count` int NOT NULL DEFAULT '0',
  `edit_birthday_count` int NOT NULL,
  `edit_customer_count` int NOT NULL DEFAULT '0',
  `sent_mail_count` int NOT NULL DEFAULT '0',
  `worktime_start` time DEFAULT NULL,
  `worktime_finish` time DEFAULT NULL,
  `daily_actions` int NOT NULL,
  `success_order_count` int NOT NULL DEFAULT '0',
  `cancel_order_count` int NOT NULL DEFAULT '0',
  `treated_order_count` int NOT NULL DEFAULT '0',
  `confirmed_order_count` int NOT NULL DEFAULT '0',
  `problem_order_count` int NOT NULL DEFAULT '0',
  `edit_csi_count` int NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`date`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `vk_export_album`
--

DROP TABLE IF EXISTS `vk_export_album`;
CREATE TABLE IF NOT EXISTS `vk_export_album` (
  `category_id` int NOT NULL,
  `vk_album_id` varchar(32) NOT NULL,
  `mode` enum('user','group') NOT NULL,
  PRIMARY KEY (`category_id`,`vk_album_id`,`mode`),
  KEY `vk_album_id` (`vk_album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `vk_export_photo`
--

DROP TABLE IF EXISTS `vk_export_photo`;
CREATE TABLE IF NOT EXISTS `vk_export_photo` (
  `product_id` int NOT NULL,
  `vk_photo_id` varchar(32) NOT NULL,
  `category_id` int NOT NULL,
  `date` datetime NOT NULL,
  `location` enum('albums','wall') NOT NULL,
  PRIMARY KEY (`product_id`,`vk_photo_id`),
  KEY `vk_photo_id` (`vk_photo_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
CREATE TABLE IF NOT EXISTS `voucher` (
  `voucher_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `code` varchar(25) NOT NULL,
  `curr` varchar(5) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `amount_national` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`voucher_id`),
  KEY `order_id` (`order_id`),
  KEY `voucher_theme_id` (`voucher_theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_history`
--

DROP TABLE IF EXISTS `voucher_history`;
CREATE TABLE IF NOT EXISTS `voucher_history` (
  `voucher_history_id` int NOT NULL AUTO_INCREMENT,
  `voucher_id` int NOT NULL,
  `order_id` int NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`),
  KEY `voucher_id` (`voucher_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_theme`
--

DROP TABLE IF EXISTS `voucher_theme`;
CREATE TABLE IF NOT EXISTS `voucher_theme` (
  `voucher_theme_id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_theme_description`
--

DROP TABLE IF EXISTS `voucher_theme_description`;
CREATE TABLE IF NOT EXISTS `voucher_theme_description` (
  `voucher_theme_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wc_continents`
--

DROP TABLE IF EXISTS `wc_continents`;
CREATE TABLE IF NOT EXISTS `wc_continents` (
  `code` char(2) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `geonameId` char(7) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `wc_countries`
--

DROP TABLE IF EXISTS `wc_countries`;
CREATE TABLE IF NOT EXISTS `wc_countries` (
  `code` char(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `iso3` char(3) NOT NULL,
  `number` smallint(3) UNSIGNED ZEROFILL NOT NULL,
  `continent_code` char(2) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `weight_class`
--

DROP TABLE IF EXISTS `weight_class`;
CREATE TABLE IF NOT EXISTS `weight_class` (
  `weight_class_id` int NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `system_key` varchar(100) NOT NULL,
  `amazon_key` varchar(100) NOT NULL,
  `variants` varchar(2048) NOT NULL,
  PRIMARY KEY (`weight_class_id`),
  KEY `amazon_key` (`amazon_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `weight_class_description`
--

DROP TABLE IF EXISTS `weight_class_description`;
CREATE TABLE IF NOT EXISTS `weight_class_description` (
  `weight_class_id` int NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`),
  KEY `language_id` (`language_id`),
  KEY `weight_class_id` (`weight_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `yandex_feeds`
--

DROP TABLE IF EXISTS `yandex_feeds`;
CREATE TABLE IF NOT EXISTS `yandex_feeds` (
  `store_id` int NOT NULL,
  `currency` varchar(5) NOT NULL,
  `entity_type` varchar(1) NOT NULL,
  `entity_id` int NOT NULL,
  `path` varchar(255) NOT NULL,
  KEY `store_id` (`store_id`),
  KEY `entity_type` (`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `yandex_queue`
--

DROP TABLE IF EXISTS `yandex_queue`;
CREATE TABLE IF NOT EXISTS `yandex_queue` (
  `order_id` int NOT NULL,
  `status` varchar(32) NOT NULL,
  `substatus` varchar(64) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yandex_stock_queue`
--

DROP TABLE IF EXISTS `yandex_stock_queue`;
CREATE TABLE IF NOT EXISTS `yandex_stock_queue` (
  `yam_product_id` varchar(32) NOT NULL,
  `stock` int NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `yam_product_id` (`yam_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
CREATE TABLE IF NOT EXISTS `zone` (
  `zone_id` int NOT NULL AUTO_INCREMENT,
  `country_id` int NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `zone_to_geo_zone`
--

DROP TABLE IF EXISTS `zone_to_geo_zone`;
CREATE TABLE IF NOT EXISTS `zone_to_geo_zone` (
  `zone_to_geo_zone_id` int NOT NULL AUTO_INCREMENT,
  `country_id` int NOT NULL,
  `zone_id` int NOT NULL DEFAULT '0',
  `geo_zone_id` int NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`zone_to_geo_zone_id`),
  KEY `country_id` (`country_id`),
  KEY `zone_id` (`zone_id`),
  KEY `geo_zone_id` (`geo_zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_description`
--
ALTER TABLE `category_description` ADD FULLTEXT KEY `FULLTEXT_name` (`name`);

--
-- Indexes for table `order_simple_fields`
--
ALTER TABLE `order_simple_fields` ADD FULLTEXT KEY `metadata` (`metadata`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `telegram_users_chats`
--
ALTER TABLE `telegram_users_chats`
  ADD CONSTRAINT `telegram_users_chats_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `telegram_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `telegram_users_chats_ibfk_2` FOREIGN KEY (`chat_id`) REFERENCES `telegram_chats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
