-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 07, 2014 at 05:32 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ams`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id_address` int(11) NOT NULL AUTO_INCREMENT,
  `addr1` varchar(100) DEFAULT NULL,
  `addr2` varchar(100) DEFAULT NULL,
  `addr3` varchar(100) DEFAULT NULL,
  `id_city` varchar(100) DEFAULT NULL,
  `id_state` varchar(100) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `id_country` varchar(100) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `email1` varchar(150) DEFAULT NULL,
  `email2` varchar(150) DEFAULT NULL,
  `fax1` varchar(20) DEFAULT NULL,
  `fax2` varchar(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE IF NOT EXISTS `addresses` (
  `id_address` int(11) NOT NULL AUTO_INCREMENT,
  `addr1` varchar(100) DEFAULT NULL,
  `addr2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone1` varchar(20) DEFAULT NULL,
  `phone2` varchar(20) DEFAULT NULL,
  `email1` varchar(150) DEFAULT NULL,
  `email2` varchar(150) DEFAULT NULL,
  `fax1` varchar(20) DEFAULT NULL,
  `fax2` varchar(20) DEFAULT NULL,
  `contact_person1` varchar(100) DEFAULT NULL,
  `contact_person2` varchar(100) DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) NOT NULL,
  `login_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `db_roleId` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `admin_name`, `login_id`, `password`, `db_roleId`, `status`) VALUES
(1, 'stallioni', 'stallioni', '25f9e794323b453885f5181f1b624d0b', '7b7bc2512ee1fedcd76bdc68926d4f7b', 1),
(2, 'superadmin', 'superadmin', '17c4520f6cfd1ab53d8745e84681eb49', '7b7bc2512ee1fedcd76bdc68926d4f7b', 1);

-- --------------------------------------------------------

--
-- Table structure for table `asset_building`
--

CREATE TABLE IF NOT EXISTS `asset_building` (
  `id_building` int(11) NOT NULL AUTO_INCREMENT,
  `id_unit` int(11) DEFAULT NULL,
  `building_name` varchar(45) DEFAULT NULL,
  `building_desc` text,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0 = inactive\n1 = active\n2 = deleted',
  PRIMARY KEY (`id_building`),
  UNIQUE KEY `building_name` (`building_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='buildings of the company' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_category`
--

CREATE TABLE IF NOT EXISTS `asset_category` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent_category` int(11) DEFAULT NULL,
  `category_name` varchar(45) DEFAULT NULL,
  `category_desc` text,
  `category_image` text,
  `lookup` varchar(200) NOT NULL,
  `created_by` int(11) DEFAULT NULL COMMENT 'user who created this category',
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL COMMENT 'user who last modified',
  `modified_on` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0 = Inactive\n1 = Active\n2 = Deleted',
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='category of the asset item' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_contract`
--

CREATE TABLE IF NOT EXISTS `asset_contract` (
  `id_asset_contract` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `id_asset_item` int(11) NOT NULL,
  `id_contract` int(11) NOT NULL,
  `contract_start_date` datetime NOT NULL,
  `contract_end_date` datetime NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_asset_contract`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_delivery`
--

CREATE TABLE IF NOT EXISTS `asset_delivery` (
  `id_asset_delivery` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_type` varchar(50) NOT NULL,
  `from_id_store` int(11) NOT NULL,
  `from_id_company` int(11) NOT NULL,
  `to_id_store` int(11) NOT NULL,
  `to_id_vendor` int(11) NOT NULL,
  `remark` text NOT NULL,
  `issue_no` varchar(255) NOT NULL,
  `issue_date` date NOT NULL,
  `prepared_by` int(11) NOT NULL,
  `verified_by` int(11) NOT NULL,
  `authorised_by` int(11) NOT NULL,
  `received_by` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_asset_delivery`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_delivery_item`
--

CREATE TABLE IF NOT EXISTS `asset_delivery_item` (
  `id_asset_delivery_item` int(11) NOT NULL AUTO_INCREMENT,
  `asset_no` varchar(255) NOT NULL,
  `id_asset_item` int(11) NOT NULL,
  `id_asset_delivery` int(11) NOT NULL,
  `current_stock_quantity` int(11) NOT NULL,
  `issue_quantitiy` int(11) NOT NULL,
  `id_uom` int(11) NOT NULL,
  `id_itemgroup1` int(11) NOT NULL,
  `id_itemgroup2` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `bill_status` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_asset_delivery_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_department`
--

CREATE TABLE IF NOT EXISTS `asset_department` (
  `id_department` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent_department` int(11) DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `department_desc` text,
  `id_unit` int(11) DEFAULT NULL COMMENT 'company unit id (asset_unit)',
  `id_building` int(11) DEFAULT NULL COMMENT 'asset_building id',
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_department`),
  UNIQUE KEY `department_name` (`department_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_gate_pass`
--

CREATE TABLE IF NOT EXISTS `asset_gate_pass` (
  `id_asset_gate_pass` int(11) NOT NULL AUTO_INCREMENT,
  `gate_pass_date` date NOT NULL,
  `id_asset_delivery` int(11) NOT NULL,
  `vehicle_no` varchar(255) NOT NULL,
  `id_gate_pass_item` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_asset_gate_pass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_image`
--

CREATE TABLE IF NOT EXISTS `asset_image` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `grn_no` int(11) NOT NULL,
  `id_inventory_item` varchar(255) NOT NULL,
  `id_asset_item` int(11) NOT NULL,
  `image_title` varchar(255) NOT NULL,
  `image_description` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_inspection`
--

CREATE TABLE IF NOT EXISTS `asset_inspection` (
  `id_asset_inspection` int(11) NOT NULL AUTO_INCREMENT,
  `grn_no` varchar(255) NOT NULL,
  `id_inventory_item` int(11) NOT NULL,
  `inspection_details` longtext NOT NULL,
  `image_description` text NOT NULL,
  `remarks` text NOT NULL,
  `id_employee` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_on` date NOT NULL,
  PRIMARY KEY (`id_asset_inspection`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_insurance`
--

CREATE TABLE IF NOT EXISTS `asset_insurance` (
  `id_asset_ins_map` int(11) NOT NULL AUTO_INCREMENT,
  `id_asset` int(11) DEFAULT NULL,
  `id_insurance` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_asset_ins_map`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_item`
--

CREATE TABLE IF NOT EXISTS `asset_item` (
  `id_asset_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_asset_category` int(11) DEFAULT NULL,
  `id_asset_type` int(11) DEFAULT NULL,
  `id_itemgroup1` int(11) NOT NULL,
  `id_itemgroup2` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id_uom` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `id_manufacturer` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `machine_no` varchar(255) NOT NULL,
  `warranty_start_date` date NOT NULL,
  `warranty_end_date` date NOT NULL,
  `asset_no` varchar(255) NOT NULL,
  `ref_asset_no` varchar(255) NOT NULL,
  `id_grn` int(11) NOT NULL,
  `id_inventory_item` int(11) NOT NULL,
  `id_po` int(11) NOT NULL,
  `asset_name` int(11) NOT NULL COMMENT 'id_item',
  `asset_amount` varchar(200) NOT NULL,
  `depressation_percent` int(11) NOT NULL,
  `remark` text NOT NULL,
  `date_of_install` date NOT NULL,
  `machine_date` date NOT NULL,
  `machine_life` int(11) NOT NULL,
  `machine_price` double NOT NULL,
  `id_image` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_asset_item`),
  UNIQUE KEY `asset_no` (`asset_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_location`
--

CREATE TABLE IF NOT EXISTS `asset_location` (
  `id_location` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent_location` int(11) DEFAULT NULL,
  `location_name` text,
  `location_desc` text,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_location`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_maintenance`
--

CREATE TABLE IF NOT EXISTS `asset_maintenance` (
  `id_asset_maintenance` int(11) NOT NULL AUTO_INCREMENT,
  `id_asset_item` int(11) NOT NULL,
  `id_asset_delivery` int(11) NOT NULL,
  `from_id_store` int(11) NOT NULL,
  `to_id_vendor` int(11) NOT NULL,
  `idle_start_date` datetime NOT NULL,
  `idle_end_date` datetime NOT NULL,
  `remarks` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_asset_maintenance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_sales_invoice`
--

CREATE TABLE IF NOT EXISTS `asset_sales_invoice` (
  `id_asset_sales_invoice` int(11) NOT NULL AUTO_INCREMENT,
  `id_company` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `invoice_date` date NOT NULL,
  `id_asset_delivery` int(11) NOT NULL,
  `id_asset_gate_pass` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_asset_sales_invoice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_sales_invoice_item`
--

CREATE TABLE IF NOT EXISTS `asset_sales_invoice_item` (
  `id_asset_sales_invoice_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_asset_sales_invoice` int(11) NOT NULL,
  `id_asset_item` int(11) NOT NULL,
  `id_itemgroup1` int(11) NOT NULL,
  `id_itemgroup2` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id_uom` int(11) NOT NULL,
  `purchased_price` double NOT NULL,
  `depreciation_price` double NOT NULL,
  `sale_price` int(11) NOT NULL,
  `id_taxform` int(11) NOT NULL,
  `tax_percentage` int(11) NOT NULL,
  `tax_price` double NOT NULL,
  `total_price` double NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_asset_sales_invoice_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_stock`
--

CREATE TABLE IF NOT EXISTS `asset_stock` (
  `id_asset_stock` int(11) NOT NULL AUTO_INCREMENT,
  `id_asset_item` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_store` int(11) NOT NULL,
  `id_division` int(11) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `assigned_on` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_asset_stock`),
  UNIQUE KEY `id_asset_item` (`id_asset_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_type`
--

CREATE TABLE IF NOT EXISTS `asset_type` (
  `id_asset_type` int(11) NOT NULL AUTO_INCREMENT,
  `id_asset_parent_type` int(11) DEFAULT '0',
  `id_asset_category` int(11) DEFAULT NULL COMMENT 'FK : id_category (asset_category)',
  `asset_type_name` varchar(45) DEFAULT NULL,
  `asset_type_desc` text,
  `lookup` varchar(200) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 = inactive\n1 = active\n2 = deleted',
  PRIMARY KEY (`id_asset_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_unit`
--

CREATE TABLE IF NOT EXISTS `asset_unit` (
  `id_unit` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent_unit` int(11) DEFAULT NULL,
  `id_unit_address` int(11) NOT NULL,
  `unit_name` varchar(45) DEFAULT NULL,
  `id_employee` int(11) NOT NULL,
  `unit_desc` text,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0 = inactive\n1 = active\n2 = deleted',
  PRIMARY KEY (`id_unit`),
  UNIQUE KEY `unit_name` (`unit_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Company Unit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asset_warranty`
--

CREATE TABLE IF NOT EXISTS `asset_warranty` (
  `id_asset_warranty` int(11) NOT NULL AUTO_INCREMENT,
  `id_asset_item` int(11) NOT NULL,
  `warranty_start_date` date NOT NULL,
  `warranty_end_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `remark` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_asset_warranty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE IF NOT EXISTS `bank` (
  `id_bank` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(50) DEFAULT NULL,
  `lookup` varchar(10) DEFAULT NULL,
  `bsr_code` varchar(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_bank`),
  UNIQUE KEY `lookup` (`lookup`),
  UNIQUE KEY `bank_name` (`bank_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id_city` int(11) NOT NULL AUTO_INCREMENT,
  `id_state` int(11) DEFAULT NULL,
  `id_country` int(11) DEFAULT NULL,
  `city_name` varchar(100) DEFAULT NULL,
  `lookup` varchar(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_city`),
  UNIQUE KEY `city_name` (`city_name`),
  UNIQUE KEY `lookup` (`lookup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `id_company` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) DEFAULT NULL,
  `prefix` varchar(3) DEFAULT NULL,
  `lookup` varchar(20) DEFAULT NULL,
  `addr1` varchar(50) DEFAULT NULL,
  `addr2` varchar(50) DEFAULT NULL,
  `addr3` varchar(50) DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `id_state` int(11) DEFAULT NULL,
  `id_country` int(11) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `id_tin` varchar(100) NOT NULL,
  `id_cst_date` varchar(100) NOT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_company`),
  UNIQUE KEY `company_name` (`company_name`),
  UNIQUE KEY `lookup` (`lookup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id_contact` int(11) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(50) DEFAULT NULL,
  `addr1` varchar(100) DEFAULT NULL,
  `addr2` varchar(100) DEFAULT NULL,
  `addr3` varchar(250) NOT NULL,
  `id_city` int(11) DEFAULT NULL,
  `id_state` int(11) DEFAULT NULL,
  `id_country` int(11) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE IF NOT EXISTS `contract` (
  `id_contract` int(11) NOT NULL AUTO_INCREMENT,
  `contract_type` varchar(255) NOT NULL,
  `contract_title` varchar(255) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `contract_order_value` double NOT NULL,
  `contract_value` double NOT NULL,
  `contract_start_date` datetime NOT NULL,
  `contract_end_date` datetime NOT NULL,
  `contract_reference_number` varchar(255) NOT NULL,
  `remark` text NOT NULL,
  `contract_date` datetime NOT NULL,
  `renewal_date` datetime NOT NULL,
  `no_items` int(11) NOT NULL,
  `terms_and_conditions` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_contract`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contract_contact`
--

CREATE TABLE IF NOT EXISTS `contract_contact` (
  `id_contract_contact` int(11) NOT NULL AUTO_INCREMENT,
  `id_contract` int(11) NOT NULL,
  `id_vendor_contact` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_contract_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contract_doc`
--

CREATE TABLE IF NOT EXISTS `contract_doc` (
  `id_contract_doc` int(11) NOT NULL AUTO_INCREMENT,
  `id_contract` int(11) NOT NULL,
  `id_document` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_contract_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id_country` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(200) DEFAULT NULL,
  `lookup` varchar(20) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `currency_code` varchar(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_country`),
  UNIQUE KEY `country_name` (`country_name`),
  UNIQUE KEY `lookup` (`lookup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE IF NOT EXISTS `currency` (
  `id_currency` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(30) DEFAULT NULL,
  `lookup` varchar(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_currency`),
  UNIQUE KEY `currency_name` (`currency_name`),
  UNIQUE KEY `lookup` (`lookup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_map`
--

CREATE TABLE IF NOT EXISTS `delivery_map` (
  `id_delivery_map` int(11) NOT NULL AUTO_INCREMENT,
  `id_asset_delivery` int(11) NOT NULL,
  `id_asset_gate_pass` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_delivery_map`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE IF NOT EXISTS `division` (
  `id_division` int(11) NOT NULL AUTO_INCREMENT,
  `division_name` varchar(30) DEFAULT NULL,
  `lookup` varchar(15) DEFAULT NULL,
  `id_employee` int(11) NOT NULL,
  `id_unit` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_division`),
  UNIQUE KEY `division_name` (`division_name`),
  UNIQUE KEY `lookup` (`lookup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE IF NOT EXISTS `document` (
  `id_document` tinyint(4) NOT NULL AUTO_INCREMENT,
  `document_name` varchar(255) NOT NULL,
  `document_type` varchar(255) NOT NULL,
  `status` tinyint(11) NOT NULL,
  PRIMARY KEY (`id_document`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `id_employee` int(11) NOT NULL AUTO_INCREMENT,
  `employee_code` varchar(255) NOT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `prefix` varchar(5) NOT NULL,
  `lookup` varchar(20) NOT NULL,
  `addr1` varchar(100) DEFAULT NULL,
  `addr2` varchar(100) DEFAULT NULL,
  `addr3` varchar(255) NOT NULL,
  `id_city` int(11) DEFAULT NULL,
  `id_state` int(11) DEFAULT NULL,
  `id_country` int(11) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `employee_image` varchar(255) NOT NULL,
  `employee_type` varchar(100) DEFAULT NULL,
  `employee_category` varchar(100) DEFAULT NULL,
  `id_department` int(11) DEFAULT NULL,
  `employee_designation` varchar(100) DEFAULT NULL,
  `date_of_join` date DEFAULT NULL,
  `id_company` int(11) NOT NULL,
  `id_unit` int(11) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `basic_salary` varchar(100) DEFAULT NULL,
  `da` varchar(100) DEFAULT NULL,
  `worker_category` varchar(20) DEFAULT NULL,
  `id_contractor` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `created_by` int(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(70) NOT NULL,
  `modified_on` datetime NOT NULL,
  PRIMARY KEY (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fault`
--

CREATE TABLE IF NOT EXISTS `fault` (
  `id_fault` int(11) NOT NULL AUTO_INCREMENT,
  `fault_name` varchar(30) DEFAULT NULL,
  `lookup` varchar(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_fault`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fuel`
--

CREATE TABLE IF NOT EXISTS `fuel` (
  `id_fuel` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(255) NOT NULL,
  `bill_date` date NOT NULL,
  `token_no` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `bill_amount` double NOT NULL,
  `total_price` double NOT NULL,
  `qty` int(11) NOT NULL,
  `id_uom` int(11) NOT NULL,
  `unit_price` double NOT NULL,
  `net_amount` double NOT NULL,
  `id_asset_item` int(11) NOT NULL,
  `id_fuel_type` int(11) NOT NULL,
  `id_fuel_limit` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `id_trip` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_fuel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fuel_limit`
--

CREATE TABLE IF NOT EXISTS `fuel_limit` (
  `id_fuel_limit` int(11) NOT NULL AUTO_INCREMENT,
  `id_asset_item` int(11) NOT NULL,
  `fuel_limit` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_fuel_limit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gate_pass_item`
--

CREATE TABLE IF NOT EXISTS `gate_pass_item` (
  `id_gate_pass_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_asset_gate_pass` int(11) NOT NULL,
  `id_asset_item` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id_uom` int(11) NOT NULL,
  `id_itemgroup1` int(11) NOT NULL,
  `id_itemgroup2` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_gate_pass_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `grn_document`
--

CREATE TABLE IF NOT EXISTS `grn_document` (
  `id_grn_document` int(11) NOT NULL AUTO_INCREMENT,
  `id_inventory` int(11) NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `document_path` varchar(255) NOT NULL,
  `document_file_type` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_grn_document`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `id_history` int(11) NOT NULL AUTO_INCREMENT,
  `id_refer_history` int(11) NOT NULL,
  `refer_table` varchar(255) NOT NULL,
  `trans_head` varchar(255) NOT NULL,
  `trans_type` varchar(255) NOT NULL,
  `trans_head_number` varchar(255) NOT NULL,
  `id_trans_head` int(11) NOT NULL,
  `trans_description` text NOT NULL,
  `trans_status` int(11) NOT NULL,
  `sql_query` text NOT NULL,
  `request_params` text NOT NULL,
  `error_log` text NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id_history`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE IF NOT EXISTS `insurance` (
  `id_insurance` int(11) NOT NULL AUTO_INCREMENT,
  `id_vendor` int(11) DEFAULT NULL,
  `policy_amount` double DEFAULT NULL,
  `premium_amount` double DEFAULT NULL,
  `insurance_policy_name` text,
  `reference` text NOT NULL,
  `ins_start_date` datetime DEFAULT NULL,
  `ins_end_date` datetime DEFAULT NULL,
  `remark` text NOT NULL,
  `renewal_date` date NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_insurance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_contact`
--

CREATE TABLE IF NOT EXISTS `insurance_contact` (
  `id_insurance_contact` int(11) NOT NULL AUTO_INCREMENT,
  `id_insurance` int(11) NOT NULL,
  `id_vendor_contact` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_insurance_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `insurance_doc`
--

CREATE TABLE IF NOT EXISTS `insurance_doc` (
  `id_ins_doc` int(11) NOT NULL AUTO_INCREMENT,
  `id_insurance` int(11) DEFAULT NULL,
  `id_document` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_ins_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `id_inventory` int(11) NOT NULL AUTO_INCREMENT,
  `grn_no` varchar(255) NOT NULL,
  `dc_number` varchar(255) NOT NULL,
  `dc_date` date NOT NULL,
  `direct_order` varchar(50) NOT NULL,
  `id_po` varchar(255) NOT NULL,
  `po_date` date NOT NULL,
  `id_vendor` varchar(255) NOT NULL,
  `id_store` int(11) NOT NULL,
  `bill_number` varchar(255) NOT NULL,
  `bill_date` date NOT NULL,
  `grant_total` float NOT NULL,
  `total` float NOT NULL,
  `net_total` float NOT NULL,
  `round_off` varchar(255) NOT NULL,
  `remark` text NOT NULL,
  `id_inventory_tax` int(11) NOT NULL,
  `invendory_date` date NOT NULL,
  `inspection_status` tinyint(4) NOT NULL COMMENT '1-open,2-delete,3-passed,4-reject',
  `asset_status` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1-new/open,2-delete,3-completed',
  PRIMARY KEY (`id_inventory`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_item`
--

CREATE TABLE IF NOT EXISTS `inventory_item` (
  `id_inventory_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_po` int(11) DEFAULT NULL,
  `id_vendor` int(11) NOT NULL,
  `id_grn` int(11) NOT NULL,
  `po_number` varchar(20) DEFAULT NULL,
  `id_po_item` int(11) NOT NULL,
  `id_itemgroup1` int(11) NOT NULL,
  `id_itemgroup2` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `unit_cost` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `balanced_qty` int(11) NOT NULL,
  `return_qty` int(11) NOT NULL,
  `qty_received` double DEFAULT NULL,
  `id_uom` int(11) DEFAULT NULL,
  `id_manufacturer` int(11) NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `remark` text NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `inspection_status` tinyint(4) NOT NULL,
  `asset_status` tinyint(4) NOT NULL,
  `return_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_inventory_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_tax`
--

CREATE TABLE IF NOT EXISTS `inventory_tax` (
  `id_inventory_tax` int(11) NOT NULL AUTO_INCREMENT,
  `id_inventory` int(11) NOT NULL,
  `id_taxform` int(11) NOT NULL,
  `addless` varchar(50) NOT NULL,
  `tax_price` float NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_inventory_tax`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) DEFAULT NULL,
  `lookup` varchar(10) DEFAULT NULL,
  `id_itemgroup2` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `itemcategory`
--

CREATE TABLE IF NOT EXISTS `itemcategory` (
  `item_cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_parent_cat_id` int(11) DEFAULT NULL,
  `item_cat_name` varchar(100) DEFAULT NULL,
  `item_cat_desc` text,
  `status` tinyint(4) DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`item_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `itemgroup1`
--

CREATE TABLE IF NOT EXISTS `itemgroup1` (
  `id_itemgroup1` int(11) NOT NULL AUTO_INCREMENT,
  `itemgroup1_name` varchar(150) DEFAULT NULL,
  `lookup` varchar(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_itemgroup1`),
  UNIQUE KEY `itemgroup1_name` (`itemgroup1_name`),
  KEY `itemgroup1_name_2` (`itemgroup1_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `itemgroup2`
--

CREATE TABLE IF NOT EXISTS `itemgroup2` (
  `id_itemgroup2` int(11) NOT NULL AUTO_INCREMENT,
  `itemgroup2_name` varchar(150) DEFAULT NULL,
  `lookup` varchar(10) DEFAULT NULL,
  `id_itemgroup1` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_itemgroup2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `itemgroup_item_map`
--

CREATE TABLE IF NOT EXISTS `itemgroup_item_map` (
  `id_itemgroup_item_map` int(11) NOT NULL AUTO_INCREMENT,
  `id_itemgroup1` int(11) NOT NULL,
  `id_itemgroup2` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_itemgroup_item_map`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `linkcattable`
--

CREATE TABLE IF NOT EXISTS `linkcattable` (
  `db_lcatId` int(11) NOT NULL AUTO_INCREMENT,
  `db_lcatName` varchar(255) NOT NULL DEFAULT '',
  `db_lcatStatus` tinyint(1) NOT NULL DEFAULT '0',
  `db_lsOrder` tinyint(1) NOT NULL,
  `db_createdOn` date NOT NULL DEFAULT '0000-00-00',
  `db_lastModifiedOn` date NOT NULL DEFAULT '0000-00-00',
  `db_createdBy` varchar(255) NOT NULL DEFAULT '',
  `db_lastModifiedBy` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`db_lcatId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `linkcattable`
--

INSERT INTO `linkcattable` (`db_lcatId`, `db_lcatName`, `db_lcatStatus`, `db_lsOrder`, `db_createdOn`, `db_lastModifiedOn`, `db_createdBy`, `db_lastModifiedBy`) VALUES
(1, 'Asset Masters', 1, 2, '2013-04-13', '0000-00-00', '', ''),
(2, 'Purchase', 1, 3, '2013-04-13', '0000-00-00', '', ''),
(3, 'Territory', 1, 4, '2013-04-13', '0000-00-00', '', ''),
(7, 'Company', 1, 5, '2013-11-30', '2013-11-30', '', ''),
(8, 'Participants', 1, 6, '0000-00-00', '0000-00-00', '', ''),
(9, 'Maintenance', 1, 7, '0000-00-00', '0000-00-00', '', ''),
(10, 'Setup', 1, 8, '0000-00-00', '0000-00-00', '', ''),
(11, 'Asset', 1, 1, '2013-12-04', '2013-12-04', '1', '1'),
(12, 'Approvals', 1, 9, '2014-01-09', '0000-00-00', '', ''),
(13, 'Reports', 1, 10, '0000-00-00', '0000-00-00', 'k7', ''),
(14, 'Transport', 1, 11, '0000-00-00', '0000-00-00', 'k7', ''),
(15, 'Sales ', 1, 12, '2014-02-20', '0000-00-00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `linksubcattable`
--

CREATE TABLE IF NOT EXISTS `linksubcattable` (
  `db_lscatId` int(11) NOT NULL AUTO_INCREMENT,
  `db_lcatId` int(11) NOT NULL DEFAULT '0',
  `db_lscatName` varchar(255) NOT NULL DEFAULT '',
  `db_lscatLink` varchar(255) NOT NULL DEFAULT '',
  `ls_catParentId` int(11) NOT NULL,
  `ls_catMenuType` int(11) NOT NULL,
  `db_lscatmenu_param` varchar(255) NOT NULL,
  `db_target` tinyint(1) NOT NULL DEFAULT '0',
  `db_lsOrder` smallint(6) NOT NULL,
  `db_lscatStatus` tinyint(1) NOT NULL DEFAULT '0',
  `db_createdOn` date DEFAULT '0000-00-00',
  `db_lastModifiedOn` date DEFAULT '0000-00-00',
  `db_createdBy` varchar(255) DEFAULT NULL,
  `db_lastModifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`db_lscatId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=123 ;

--
-- Dumping data for table `linksubcattable`
--

INSERT INTO `linksubcattable` (`db_lscatId`, `db_lcatId`, `db_lscatName`, `db_lscatLink`, `ls_catParentId`, `ls_catMenuType`, `db_lscatmenu_param`, `db_target`, `db_lsOrder`, `db_lscatStatus`, `db_createdOn`, `db_lastModifiedOn`, `db_createdBy`, `db_lastModifiedBy`) VALUES
(3, 1, 'Asset Category', 'AssetCategory', 0, 1, '', 0, 1, 0, '2003-04-13', '0000-00-00', NULL, NULL),
(5, 1, 'Asset Type', 'AssetType', 0, 1, '', 0, 2, 1, '2003-04-13', '0000-00-00', NULL, NULL),
(6, 3, 'Country', 'Country', 0, 1, '', 0, 1, 1, '2003-04-13', '0000-00-00', NULL, NULL),
(14, 3, 'Currency', 'Currency', 0, 1, '', 0, 2, 1, '2003-04-13', '0000-00-00', NULL, NULL),
(16, 3, 'State', 'State', 0, 1, '', 0, 4, 1, '2003-04-13', '0000-00-00', NULL, NULL),
(17, 3, 'City', 'City', 0, 1, '', 0, 5, 1, '2003-04-13', '0000-00-00', NULL, NULL),
(26, 3, 'Port', 'Port', 0, 1, '', 0, 6, 2, '2003-04-28', '2003-05-09', 'mPera', 'mPera'),
(31, 3, 'Shift', 'Shift', 0, 1, '', 0, 7, 2, '2003-05-13', '0000-00-00', 'prema', NULL),
(32, 10, 'U O M Type', 'Uom', 0, 1, '', 0, 3, 1, '2003-05-13', '0000-00-00', 'mpera', NULL),
(33, 1, 'Item Group 1', 'ItemGroup1', 0, 1, '', 0, 3, 1, '2003-05-20', '0000-00-00', 'Subash', NULL),
(34, 1, 'Item Group 2', 'ItemGroup2', 0, 1, '', 0, 4, 1, '2003-05-20', '0000-00-00', 'Subash', NULL),
(37, 1, 'Item', 'Item', 0, 1, '', 0, 5, 1, '2003-06-19', '0000-00-00', 'mpera', NULL),
(40, 2, 'Purchase Request', 'PurchaseRequest', 0, 1, '', 0, 1, 1, '2003-07-16', '0000-00-00', 'Don', NULL),
(41, 2, 'Purchase Order', 'PurchaseOrder', 0, 1, '', 0, 2, 1, '2003-07-17', '0000-00-00', 'Don', NULL),
(50, 7, 'Company', 'Company', 0, 1, '', 0, 1, 1, '2004-03-31', '0000-00-00', 'Don', NULL),
(51, 7, 'Unit', 'AssetUnit', 0, 1, '', 0, 2, 1, '2004-05-27', '0000-00-00', 'mPera', 'mPera'),
(53, 7, 'Department', 'AssetDepartment', 0, 1, '', 0, 3, 2, '2004-09-23', '0000-00-00', 'mPera', 'mPera'),
(55, 7, 'Division', 'Division', 0, 1, '', 0, 4, 1, '2005-03-23', '2005-03-23', 'Don', 'Don'),
(62, 7, 'Store', 'Store', 0, 1, '', 0, 5, 1, '2007-09-11', NULL, 'Don', NULL),
(63, 8, 'Bank', 'Bank', 0, 1, '', 0, 1, 1, '2007-10-02', '0000-00-00', 'Don', NULL),
(64, 8, 'Supplier', 'Supplier', 0, 1, '', 0, 2, 1, '2007-10-02', '0000-00-00', 'mPera', 'mPera'),
(65, 8, 'Customer', 'Customer', 0, 1, '', 0, 3, 2, '2007-11-13', '0000-00-00', 'mPera', 'mPera'),
(66, 8, 'Employee', 'Employee', 0, 1, '', 0, 4, 1, '2007-11-16', '0000-00-00', 'Don', NULL),
(68, 9, 'Maintenance Group', 'MaintenanceGroup', 0, 1, '', 0, 1, 0, '2008-03-28', '0000-00-00', 'mpera', 'mpera'),
(69, 9, 'Maintenance', 'Maintenance', 0, 1, '', 0, 2, 1, '2008-04-18', '0000-00-00', 'Don', NULL),
(70, 9, 'Fault', 'Fault', 0, 1, '', 0, 3, 0, '2008-05-16', '0000-00-00', 'Don', NULL),
(71, 10, 'Tax Form', 'TaxForm', 0, 1, '', 0, 1, 1, '2008-06-30', '0000-00-00', 'mpera', NULL),
(72, 10, 'User Role', 'UserRole', 0, 1, '', 0, 2, 1, '2008-07-07', '0000-00-00', 'mPera', NULL),
(73, 2, 'Goods Received Note', 'AssetItem', 0, 1, '', 0, 3, 1, '2008-07-15', '2008-07-15', 'Rich', NULL),
(74, 2, 'Inspection', 'Inspection', 0, 1, '', 0, 4, 1, '2008-07-17', '0000-00-00', 'Don', NULL),
(75, 11, 'Stock List', 'StockList', 0, 1, '', 0, 4, 1, '2008-08-04', '2008-08-04', 'Subash', NULL),
(76, 8, 'Manufacturer', 'Manufacturer', 0, 1, '', 0, 5, 1, '2013-12-24', '2013-12-24', 'Subash', NULL),
(78, 2, 'Store Delivery List', 'StoreDeliveryList', 0, 1, '', 0, 10, 1, '2008-12-23', '0000-00-00', 'k7', NULL),
(79, 13, 'Report List', 'Reports', 0, 1, '', 0, 2, 1, '2009-01-29', '0000-00-00', 'Don', NULL),
(80, 3, 'Machine Type', 'Machine', 0, 1, '', 0, 1, 0, '0000-00-00', '0000-00-00', 'mpera', NULL),
(81, 2, 'Query Builder', 'QueryBuilder', 0, 0, '', 0, 16, 0, '2009-03-05', '2009-03-05', 'Don', 'Don'),
(82, 3, 'Validate Customer Update', 'ValidateCustomerUpdate', 80, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(83, 2, 'Order Detials', 'OrderDetails', 6, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(84, 2, 'Update Personal Info', 'UpdatePersonalInfo', 6, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(85, 2, 'Add Dependents', 'AddDependents', 6, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(86, 6, 'Update Dependent Info', 'UpdateDependentInfo', 6, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(87, 6, 'Update Product Info', 'UpdateProductInfo', 6, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(88, 6, 'View Billing History', 'ViewBillingHistory', 6, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(89, 6, 'Update Payment Info', 'UpdatePaymentInfo', 6, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(90, 2, 'Update Rep Info', 'UpdateRepInfo', 6, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(91, 2, 'Update Order', 'UpdateOrder', 6, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(92, 2, 'Change Order Price', 'ChangeOrderPrice', 6, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(93, 2, 'Skip Billing', 'SkipBilling', 6, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(94, 2, 'Change Bill Date', 'ChangeBillDate', 6, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(95, 14, 'Service', 'ServiceList', 0, 1, '', 0, 2, 1, '0000-00-00', '0000-00-00', NULL, NULL),
(96, 2, 'OrderNewCard', 'Order New Card', 6, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(97, 2, 'Message', 'Message', 6, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(98, 3, 'Process Payment Due', 'ProcessPaymentDue', 33, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(99, 15, 'Sales Invoice', 'SalesInvoice', 0, 1, '', 0, 1, 1, '2014-02-20', '0000-00-00', NULL, NULL),
(100, 3, 'VendorExport_1002_Full', 'VendorExport_1002_Full', 32, 2, '', 0, 0, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(101, 2, 'Order New Card', 'OrderNewCard', 6, 2, '', 0, 0, 0, '2009-05-11', '0000-00-00', 'Ramya', NULL),
(102, 13, 'stock Report', 'StockReport', 0, 1, '', 0, 1, 1, '0000-00-00', '0000-00-00', NULL, NULL),
(105, 3, 'Currency', 'Currency', 0, 1, '', 0, 2, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(106, 12, 'PO Approval', 'PurchaseOrder', 0, 1, '?action=approval', 0, 2, 1, '2009-06-04', '0000-00-00', 'k7', NULL),
(107, 10, 'Trems and Conditions', 'TermsList', 0, 1, '', 0, 4, 1, '2009-06-04', '0000-00-00', 'Ramya', NULL),
(108, 2, 'Contract', 'ContractList', 0, 1, '', 0, 6, 1, '2009-06-04', '0000-00-00', 'Ramya', NULL),
(109, 2, 'Internal / External Delivery ', 'DeliveryList', 0, 1, '', 0, 7, 1, '2009-06-04', '0000-00-00', 'k7', NULL),
(110, 1, 'Currency', 'Currency', 0, 3, '', 0, 3, 0, '2009-10-08', '0000-00-00', 'mpera', 'mpera'),
(111, 1, 'State', 'State', 0, 3, '', 0, 4, 0, '0000-00-00', '0000-00-00', NULL, NULL),
(112, 3, 'Country', 'Country', 0, 1, '', 0, 1, 0, '2009-10-24', '2009-10-24', 'mpera', 'mpera'),
(113, 2, 'Purchase Return', 'PurchaseReturn', 0, 1, '', 0, 11, 1, '2009-10-24', '2009-10-24', 'mpera', 'mpera'),
(114, 3, 'Add Stock', 'AddStock', 0, 1, '', 0, 1, 0, '2009-10-24', '2009-10-24', 'mpera', 'mpera'),
(115, 1, 'City', 'City', 0, 3, '', 0, 5, 0, '2009-10-27', '2009-10-27', 'mPera', 'mPera'),
(116, 1, 'Port', 'Port', 0, 3, '', 0, 6, 0, '2009-10-27', '2009-10-27', 'mPera', 'mPera'),
(117, 2, 'Add Asset', 'AssetList', 0, 1, '', 0, 5, 1, '0000-00-00', '0000-00-00', 'k7', NULL),
(118, 12, 'PR Approval', 'PurchaseRequest', 0, 1, '?action=approval', 0, 1, 1, '2009-06-04', '0000-00-00', 'k7', NULL),
(119, 14, 'Fuel ', 'FuelList', 0, 1, '', 0, 1, 1, '0000-00-00', '0000-00-00', 'k7', NULL),
(120, 2, 'StoreDelivery', '', 0, 1, '', 0, 0, 0, '0000-00-00', '0000-00-00', 'k7', NULL),
(121, 2, 'Internal / External Receipt', 'ConfirmDelivery', 0, 1, '', 0, 8, 1, '0000-00-00', '0000-00-00', NULL, NULL),
(122, 14, 'Fuel Limit', 'FuelLimit', 0, 1, '', 0, 1, 1, '0000-00-00', '0000-00-00', 'k7', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lscrud`
--

CREATE TABLE IF NOT EXISTS `lscrud` (
  `db_lscrudId` int(11) NOT NULL AUTO_INCREMENT,
  `db_lcatId` int(11) NOT NULL DEFAULT '0',
  `db_lscatName` varchar(255) NOT NULL DEFAULT '',
  `db_lscatLink` varchar(255) NOT NULL DEFAULT '',
  `ls_catParentId` int(11) NOT NULL,
  `ls_catMenuType` int(11) NOT NULL,
  `db_lscatmenu_param` varchar(255) NOT NULL,
  `db_target` tinyint(1) NOT NULL DEFAULT '0',
  `db_lsOrder` smallint(6) NOT NULL,
  `db_lscatStatus` tinyint(1) NOT NULL DEFAULT '0',
  `db_linkcat_type` text NOT NULL COMMENT '1=add,2=edit,3=view,4=delete,5=pdf',
  `db_createdOn` date DEFAULT '0000-00-00',
  `db_lastModifiedOn` date DEFAULT '0000-00-00',
  `db_createdBy` varchar(255) DEFAULT NULL,
  `db_lastModifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`db_lscrudId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `lscrud`
--

INSERT INTO `lscrud` (`db_lscrudId`, `db_lcatId`, `db_lscatName`, `db_lscatLink`, `ls_catParentId`, `ls_catMenuType`, `db_lscatmenu_param`, `db_target`, `db_lsOrder`, `db_lscatStatus`, `db_linkcat_type`, `db_createdOn`, `db_lastModifiedOn`, `db_createdBy`, `db_lastModifiedBy`) VALUES
(1, 33, 'ItemGroup1 Edit', 'ItemGroup1Edit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(2, 34, 'ItemGroup2 Edit', 'ItemGroup2Edit', 0, 1, '', 0, 2, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(3, 40, 'Download Purchase Request', 'PurchaseRequestPDF', 0, 1, '', 0, 3, 1, '3,5', '0000-00-00', '0000-00-00', NULL, NULL),
(4, 40, 'Purchase Request Edit', 'PurchaseRequestEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(5, 40, 'Print Purchase Request', 'PurchaseRequestView', 0, 1, '', 0, 2, 1, '3', '0000-00-00', '0000-00-00', NULL, NULL),
(6, 72, 'User Role Menu Edit', 'UserRoleMenuEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(7, 37, 'Item Edit', 'ItemEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(8, 41, 'Purchase Orde rCreate', 'PurchaseOrderCreate', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(9, 41, 'Download Purchase Order', 'PurchaseOrderPDF', 0, 1, '', 0, 2, 1, '5,3', '0000-00-00', '0000-00-00', NULL, NULL),
(10, 41, 'Purchase Order View', 'PurchaseOrderView', 0, 1, '', 0, 3, 1, '3', '0000-00-00', '0000-00-00', NULL, NULL),
(11, 40, 'Assign Vendor', 'PrVendorMapEdit', 0, 1, '', 0, 4, 1, '1,3', '0000-00-00', '0000-00-00', NULL, NULL),
(12, 40, 'Quotation List', 'QuotationList', 0, 1, '', 0, 5, 1, '1,3', '0000-00-00', '0000-00-00', NULL, NULL),
(13, 40, 'Compare Quotation', 'CompareQuotation', 0, 1, '', 0, 6, 1, '2,3', '0000-00-00', '0000-00-00', NULL, NULL),
(14, 40, 'Quotation Edit', 'QuotationEdit', 0, 1, '', 0, 7, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(15, 73, 'GRN ', 'AssetItemEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(16, 73, 'Purchase Goods View', 'PurchaseGoodsView', 0, 1, '', 0, 2, 1, '3', '0000-00-00', '0000-00-00', NULL, NULL),
(17, 74, 'Inspection Edit', 'InspectionEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(18, 117, 'Asset Info', 'AssetInfo', 0, 1, '', 0, 1, 1, '3', '0000-00-00', '0000-00-00', NULL, NULL),
(19, 117, 'Maintenance Edit', 'MaintenanceEdit', 0, 1, '', 0, 2, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(20, 117, 'Insurance', 'Insurance', 0, 1, '', 0, 3, 1, '1,2,3', '0000-00-00', '0000-00-00', NULL, NULL),
(21, 117, 'Contract', 'Contract', 0, 1, '', 0, 3, 1, '1,2,3', '0000-00-00', '0000-00-00', NULL, NULL),
(22, 75, 'AddStock', 'AddStock', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(23, 117, 'Asset Image', 'AssetImage', 0, 1, '', 0, 7, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(24, 108, 'Contracts', 'Contracts', 0, 1, '', 0, 1, 1, '1,2,3', '0000-00-00', '0000-00-00', NULL, NULL),
(25, 109, 'Store Delivery', 'StoreDelivery', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(26, 109, 'Store Delivery View', 'StoreDeliveryView', 0, 1, '', 0, 2, 1, '3', '0000-00-00', '0000-00-00', NULL, NULL),
(27, 78, 'Store Division Delivery', 'StoreDivisionDelivery', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(28, 113, 'Purchase Return View', 'PurchaseReturnView', 0, 1, '', 0, 1, 1, '3', '0000-00-00', '0000-00-00', NULL, NULL),
(29, 6, 'Country Edit', 'CountryEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(30, 14, 'Currency Edit', 'CurrencyEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(31, 16, 'State Edit', 'StateEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(32, 17, 'CityEdit', 'CityEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(33, 50, 'CompanyEdit', 'CompanyEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(34, 66, 'Employee Edit', 'EmployeeEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(35, 63, 'BankEdit', 'BankEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(36, 64, 'Supplier Edit', 'SupplierEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(37, 64, 'Contact', 'Contact', 0, 1, '', 0, 2, 1, '3', '0000-00-00', '0000-00-00', NULL, NULL),
(38, 64, 'ContactEdit', 'ContactEdit', 0, 1, '', 0, 3, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(39, 76, 'ManufacturerEdit', 'ManufacturerEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(40, 69, 'MaintenanceEdit', 'MaintenanceEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(41, 71, 'TaxFormEdit', 'TaxFormEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(42, 32, 'UomEdit', 'UomEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(43, 107, 'Terms', 'Terms', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(44, 102, 'Stock Report', 'StockReport', 0, 1, '', 0, 1, 1, '3', '0000-00-00', '0000-00-00', NULL, NULL),
(45, 102, 'StockReportList', 'StockReportList', 0, 1, '', 0, 2, 1, '3', '0000-00-00', '0000-00-00', NULL, NULL),
(46, 79, 'ViewReport.', 'ViewReport.', 0, 1, '', 0, 1, 1, '3', '0000-00-00', '0000-00-00', NULL, NULL),
(47, 119, 'FuelEdit', 'FuelEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(48, 95, 'ServiceEdit.', 'ServiceEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(49, 117, 'Add Asset Details', 'AssetDetails', 0, 1, '', 1, 8, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(50, 51, 'Add Asse tUnit Edit', 'AssetUnitEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(51, 55, 'Division Edit', 'DivisionEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(52, 62, 'StoreEdit', 'StoreEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(53, 99, 'SalesInvoiceEdit', 'SalesInvoiceEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(54, 99, 'SalesInvoice', 'SalesInvoice', 0, 1, '', 0, 2, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(55, 118, 'PR Approval', 'PurchaseRequestApproval', 0, 1, '', 0, 1, 1, '2', '0000-00-00', '0000-00-00', NULL, NULL),
(56, 106, 'Purchase Order Approval', 'PurchaseOrderApproval', 0, 1, '', 0, 1, 1, '2', '0000-00-00', '0000-00-00', NULL, NULL),
(57, 79, 'view report', 'ViewReport', 0, 1, '', 0, 1, 1, '3', '0000-00-00', '0000-00-00', NULL, NULL),
(58, 79, 'stock report', 'StockReport', 0, 1, '', 0, 2, 1, '3', '0000-00-00', '0000-00-00', NULL, NULL),
(59, 79, 'Idle Stock Report', 'IdleStockReport', 0, 1, '', 0, 3, 1, '3', '0000-00-00', '0000-00-00', NULL, NULL),
(60, 79, 'Transport Report', 'TransportReport', 0, 1, '', 0, 4, 1, '3', '0000-00-00', '0000-00-00', NULL, NULL),
(61, 79, 'TransportReportList', 'TransportReportList', 0, 1, '', 0, 5, 1, '3', '0000-00-00', '0000-00-00', NULL, NULL),
(62, 5, 'Asset Type Edit', 'AssetTypeEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL),
(63, 119, 'FuelDetailEdit', 'FuelDetailEdit', 0, 1, '', 0, 1, 1, '1,2', '0000-00-00', '0000-00-00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_doc`
--

CREATE TABLE IF NOT EXISTS `maintenance_doc` (
  `id_maintenance_doc` int(11) NOT NULL AUTO_INCREMENT,
  `id_service_invoice` int(11) NOT NULL,
  `id_maintenance` int(11) NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_maintenance_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_group`
--

CREATE TABLE IF NOT EXISTS `maintenance_group` (
  `id_maintenance_group` int(11) NOT NULL AUTO_INCREMENT,
  `maintenance_group_name` varchar(30) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_maintenance_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `id_manufacturer` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lookup` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_manufacturer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `port`
--

CREATE TABLE IF NOT EXISTS `port` (
  `id_port` int(11) NOT NULL AUTO_INCREMENT,
  `port_name` varchar(50) DEFAULT NULL,
  `lookup` varchar(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_port`),
  UNIQUE KEY `port_name` (`port_name`),
  UNIQUE KEY `lookup` (`lookup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `po_address`
--

CREATE TABLE IF NOT EXISTS `po_address` (
  `id_po_address` int(11) NOT NULL AUTO_INCREMENT,
  `id_po` int(11) DEFAULT NULL,
  `id_address_type` varchar(20) DEFAULT NULL,
  `id_address` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_po_address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `po_item`
--

CREATE TABLE IF NOT EXISTS `po_item` (
  `id_po_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_po` int(11) DEFAULT NULL,
  `id_pr` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `po_number` varchar(20) DEFAULT NULL,
  `id_asset` int(11) DEFAULT NULL,
  `vendor_part_no` varchar(30) DEFAULT NULL,
  `id_itemgroup1` int(11) NOT NULL,
  `id_itemgroup2` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `po_item_name` varchar(100) DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `qty_received` double DEFAULT NULL,
  `balanced_qty` double NOT NULL,
  `id_uom` int(11) DEFAULT NULL,
  `id_manufacturer` int(11) NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `remark` text NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_po_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `po_order_qty`
--

CREATE TABLE IF NOT EXISTS `po_order_qty` (
  `id_po_order_qty` int(11) NOT NULL AUTO_INCREMENT,
  `id_po` int(11) NOT NULL,
  `id_pr` int(11) NOT NULL,
  `id_pr_item` int(11) NOT NULL,
  `order_qty` int(11) NOT NULL,
  `po_qty` int(11) NOT NULL,
  `balanced_qty` int(11) NOT NULL,
  `po_status` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id_po_order_qty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `po_status_log`
--

CREATE TABLE IF NOT EXISTS `po_status_log` (
  `id_po_status_log` int(11) NOT NULL AUTO_INCREMENT,
  `id_po` int(11) DEFAULT NULL,
  `id_from_status` varchar(30) DEFAULT NULL,
  `id_to_status` varchar(30) DEFAULT NULL,
  `id_from_state` varchar(30) DEFAULT NULL,
  `id_to_state` varchar(30) DEFAULT NULL,
  `comment` text,
  `changed_by` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_po_status_log`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `po_tax`
--

CREATE TABLE IF NOT EXISTS `po_tax` (
  `id_po_tax` int(11) NOT NULL AUTO_INCREMENT,
  `id_po` int(11) NOT NULL,
  `id_taxform` int(11) NOT NULL,
  `addless` varchar(50) NOT NULL,
  `tax_price` float NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_po_tax`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pr_item`
--

CREATE TABLE IF NOT EXISTS `pr_item` (
  `id_pr_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_po` int(11) DEFAULT NULL,
  `id_pr` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `po_number` varchar(20) DEFAULT NULL,
  `id_asset` int(11) DEFAULT NULL,
  `vendor_part_no` varchar(30) DEFAULT NULL,
  `id_itemgroup1` int(11) NOT NULL,
  `id_itemgroup2` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `pr_item_name` varchar(100) DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `qty_received` double DEFAULT NULL,
  `balanced_qty` double NOT NULL,
  `id_uom` int(11) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_pr_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pr_vendor_map`
--

CREATE TABLE IF NOT EXISTS `pr_vendor_map` (
  `id_pr_vendor_map` int(11) NOT NULL AUTO_INCREMENT,
  `id_pr` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `creatred_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `quote_received_status` int(11) NOT NULL,
  PRIMARY KEY (`id_pr_vendor_map`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE IF NOT EXISTS `purchase_order` (
  `id_po` int(11) NOT NULL AUTO_INCREMENT,
  `po_number` varchar(50) DEFAULT NULL,
  `id_pr` int(11) NOT NULL,
  `id_company` int(11) DEFAULT NULL,
  `id_unit` int(11) DEFAULT NULL,
  `id_department` int(11) DEFAULT NULL,
  `id_division` int(11) DEFAULT NULL,
  `id_store` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `id_state` int(11) DEFAULT NULL,
  `id_billing_addr` int(11) DEFAULT NULL,
  `id_shipping_addr` int(11) DEFAULT NULL,
  `id_vendor` int(11) DEFAULT NULL,
  `id_vendor_contact` int(11) DEFAULT NULL,
  `po_date` datetime DEFAULT NULL,
  `tax_percent` varchar(255) NOT NULL,
  `tax_value` float NOT NULL,
  `grant_total` float NOT NULL,
  `total` float NOT NULL,
  `net_total` float NOT NULL,
  `round_off` varchar(255) NOT NULL,
  `po_duedate` datetime DEFAULT NULL,
  `id_po_tax` int(11) NOT NULL,
  `remarks` text,
  `terms_and_conditions` longtext NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `return_status` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) DEFAULT '1' COMMENT '0 =notapproved,1=pending,2=delete,3=approved',
  PRIMARY KEY (`id_po`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_request`
--

CREATE TABLE IF NOT EXISTS `purchase_request` (
  `id_pr` int(11) NOT NULL AUTO_INCREMENT,
  `request_no` varchar(255) NOT NULL,
  `id_department` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `terms_and_conditions` longtext NOT NULL,
  `require_date` date NOT NULL,
  `request_by` varchar(255) NOT NULL,
  `approved_by` int(11) NOT NULL,
  `verified_by` int(11) NOT NULL,
  `verified_on` datetime NOT NULL,
  `approved_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `request_date` datetime NOT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0=notapproved,1=pending,2=deleted,3=approved',
  PRIMARY KEY (`id_pr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return`
--

CREATE TABLE IF NOT EXISTS `purchase_return` (
  `id_purchase_return` int(11) NOT NULL AUTO_INCREMENT,
  `rtn_number` varchar(255) NOT NULL,
  `id_po` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `id_pr` int(11) NOT NULL,
  `id_grn` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_purchase_return`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_item`
--

CREATE TABLE IF NOT EXISTS `purchase_return_item` (
  `id_purchase_return_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_po` int(11) NOT NULL,
  `id_pr` int(11) NOT NULL,
  `id_grn` int(11) NOT NULL,
  `id_inventory_item` int(11) NOT NULL,
  `id_purchase_return` int(11) NOT NULL,
  `id_itemgroup1` int(11) NOT NULL,
  `id_itemgroup2` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `id_uom` int(11) NOT NULL,
  `unit_price` double NOT NULL,
  `return_qty` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_purchase_return_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `quote`
--

CREATE TABLE IF NOT EXISTS `quote` (
  `id_quote` int(11) NOT NULL AUTO_INCREMENT,
  `id_pr` int(11) DEFAULT NULL,
  `po_number` varchar(20) DEFAULT NULL,
  `id_vendor` int(11) DEFAULT NULL,
  `id_division` int(11) DEFAULT NULL,
  `id_unit` int(11) DEFAULT NULL,
  `quote_number` varchar(30) DEFAULT NULL,
  `quote_date` datetime DEFAULT NULL,
  `quote_amount` varchar(20) DEFAULT NULL,
  `quote_valid_date` datetime DEFAULT NULL,
  `remarks` text NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `approved_by` tinyint(4) DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_quote`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `quote_approval`
--

CREATE TABLE IF NOT EXISTS `quote_approval` (
  `id_quote_approval` int(11) NOT NULL AUTO_INCREMENT,
  `id_quote` int(11) DEFAULT NULL,
  `id_pr` int(11) DEFAULT NULL,
  `id_vendor` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_quote_approval`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `quote_document`
--

CREATE TABLE IF NOT EXISTS `quote_document` (
  `id_quote_document` int(11) NOT NULL AUTO_INCREMENT,
  `id_quote` int(11) DEFAULT NULL,
  `id_document` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_quote_document`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `quote_item`
--

CREATE TABLE IF NOT EXISTS `quote_item` (
  `id_quote_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_quote` int(11) DEFAULT NULL,
  `id_pr` int(11) DEFAULT NULL,
  `id_pr_item` int(11) DEFAULT NULL,
  `id_itemgroup1` int(11) DEFAULT NULL,
  `id_itemgroup2` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL,
  `pr_item_name` varchar(100) DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `id_uom` int(11) DEFAULT NULL,
  `quote_item_name` varchar(100) DEFAULT NULL,
  `quote_unit_cost` double DEFAULT NULL,
  `quote_qty` double NOT NULL,
  `negotiated_unit_cost` double DEFAULT NULL,
  `tax_percent` double DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `quote_due_date` datetime DEFAULT NULL,
  `terms_conditions` text,
  `remarks` text,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_quote_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reason`
--

CREATE TABLE IF NOT EXISTS `reason` (
  `id_reason` int(11) NOT NULL AUTO_INCREMENT,
  `reason_name` varchar(30) DEFAULT NULL,
  `lookup` varchar(10) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `efficiency_effect` varchar(15) DEFAULT NULL,
  `sequence` varchar(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_reason`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `id_service` int(11) NOT NULL AUTO_INCREMENT,
  `service_no` varchar(255) NOT NULL,
  `id_itemgroup1` int(11) NOT NULL,
  `id_itemgroup2` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `id_asset_item` int(11) NOT NULL,
  `mileage_at_service` int(11) NOT NULL,
  `mileage_after_service` int(11) NOT NULL,
  `service_date` date NOT NULL,
  `service_return_date` date NOT NULL,
  `bill_number` varchar(255) NOT NULL,
  `bill_date` date NOT NULL,
  `bill_amount` double NOT NULL,
  `idledays` int(11) NOT NULL,
  `service_type` int(11) NOT NULL,
  `next_service_date` date NOT NULL,
  `next_service_mileage` double NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `service_invoice`
--

CREATE TABLE IF NOT EXISTS `service_invoice` (
  `id_service_invoice` int(11) NOT NULL AUTO_INCREMENT,
  `id_asset_item` int(11) NOT NULL,
  `id_asset_maintenance` int(11) NOT NULL,
  `service_type` varchar(255) NOT NULL,
  `id_asset_delivery` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `for_depreciation` int(11) NOT NULL,
  `service_cost` double NOT NULL,
  `bill_number` varchar(255) NOT NULL,
  `bill_amount` double NOT NULL,
  `bill_total_amt` double NOT NULL,
  `bill_date` date NOT NULL,
  `remarks` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_service_invoice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE IF NOT EXISTS `shift` (
  `id_shift` int(11) NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(30) DEFAULT NULL,
  `id_unit` int(11) DEFAULT NULL,
  `in_time` varchar(20) DEFAULT NULL,
  `out_time` varchar(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_shift`),
  UNIQUE KEY `shift_name` (`shift_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `id_state` int(11) NOT NULL AUTO_INCREMENT,
  `id_country` int(11) DEFAULT NULL,
  `state_name` varchar(200) DEFAULT NULL,
  `lookup` varchar(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_state`),
  UNIQUE KEY `state_name` (`state_name`),
  UNIQUE KEY `lookup` (`lookup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE IF NOT EXISTS `store` (
  `id_store` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(250) DEFAULT NULL,
  `lookup` varchar(10) DEFAULT NULL,
  `id_unit` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_store`),
  UNIQUE KEY `store_name` (`store_name`),
  UNIQUE KEY `lookup` (`lookup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `taxform`
--

CREATE TABLE IF NOT EXISTS `taxform` (
  `id_taxform` int(11) NOT NULL AUTO_INCREMENT,
  `taxform_name` varchar(20) DEFAULT NULL,
  `tax_percentage` float NOT NULL,
  `addless` varchar(100) NOT NULL,
  `lookup` varchar(15) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_taxform`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `terms_conditions`
--

CREATE TABLE IF NOT EXISTS `terms_conditions` (
  `id_terms_conditions` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_terms_conditions`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `id_transaction` int(11) NOT NULL AUTO_INCREMENT,
  `from_store` int(11) NOT NULL,
  `to_store` int(11) NOT NULL,
  `from_division` int(11) NOT NULL,
  `to_division` int(11) NOT NULL,
  `from_unit` int(11) NOT NULL,
  `to_unit` int(11) NOT NULL,
  `transaction_type` varchar(255) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `id_asset_item` int(11) NOT NULL,
  `id_itemgroup1` int(11) NOT NULL,
  `id_itemgroup2` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `asset_no` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `id_uom` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `transaction_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `received_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_transaction`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_asset`
--

CREATE TABLE IF NOT EXISTS `transaction_asset` (
  `id_transaction_asset` int(11) NOT NULL AUTO_INCREMENT,
  `id_asset_item` int(11) NOT NULL,
  `id_grn` int(11) NOT NULL,
  `id_inventory_item` int(11) NOT NULL,
  `from_location` int(11) NOT NULL,
  `from_ref_table` varchar(255) NOT NULL,
  `to_location` int(11) NOT NULL,
  `to_ref_table` varchar(255) NOT NULL,
  `action_name` varchar(255) NOT NULL,
  `action_by` int(11) NOT NULL,
  `action_date` datetime NOT NULL,
  `remarks` text NOT NULL,
  `db_query` text NOT NULL,
  `request_arr` text NOT NULL,
  `error_log` text NOT NULL,
  PRIMARY KEY (`id_transaction_asset`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_grn_item`
--

CREATE TABLE IF NOT EXISTS `transaction_grn_item` (
  `id_transaction_grn_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_grn` int(11) NOT NULL,
  `id_inventory_item` int(11) NOT NULL,
  `id_po` int(11) NOT NULL,
  `id_pr` int(11) NOT NULL,
  `id_po_item` int(11) NOT NULL,
  `action_by` int(11) NOT NULL,
  `action_date` datetime NOT NULL,
  `action_name` varchar(255) NOT NULL,
  `remarks` text NOT NULL,
  `db_query` text NOT NULL,
  `request_arr` text NOT NULL,
  `error_log` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_transaction_grn_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_po_item`
--

CREATE TABLE IF NOT EXISTS `transaction_po_item` (
  `id_transaction_po_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_po` int(11) NOT NULL,
  `id_pr` int(11) NOT NULL,
  `id_po_item` int(11) NOT NULL,
  `action_by` int(11) NOT NULL,
  `action_date` datetime NOT NULL,
  `action_name` varchar(255) NOT NULL,
  `remarks` text NOT NULL,
  `db_query` text NOT NULL,
  `request_arr` text NOT NULL,
  `error_log` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_transaction_po_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_pr_item`
--

CREATE TABLE IF NOT EXISTS `transaction_pr_item` (
  `id_transaction_pr_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_pr` int(11) NOT NULL,
  `id_pr_item` int(11) NOT NULL,
  `action_by` int(11) NOT NULL,
  `action_date` datetime NOT NULL,
  `action_name` varchar(255) NOT NULL,
  `remarks` text NOT NULL,
  `db_query` text NOT NULL,
  `request_arr` text NOT NULL,
  `error_log` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_transaction_pr_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_quote`
--

CREATE TABLE IF NOT EXISTS `transaction_quote` (
  `id_trans_quote` int(11) NOT NULL AUTO_INCREMENT,
  `id_quote` int(11) DEFAULT NULL,
  `id_vendor` int(11) DEFAULT NULL,
  `action_by` int(11) DEFAULT NULL,
  `action_name` varchar(255) DEFAULT NULL,
  `action_date` datetime DEFAULT NULL,
  `remarks` text,
  `db_query` text,
  `request_arr` text NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_trans_quote`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE IF NOT EXISTS `trip` (
  `id_trip` int(11) NOT NULL AUTO_INCREMENT,
  `omr` int(11) NOT NULL DEFAULT '0',
  `cmr` int(11) NOT NULL DEFAULT '0',
  `id_asset_item` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id_trip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uom`
--

CREATE TABLE IF NOT EXISTS `uom` (
  `id_uom` int(11) NOT NULL AUTO_INCREMENT,
  `uom_name` varchar(50) DEFAULT NULL,
  `lookup` varchar(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_uom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `address3` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `id_country` int(11) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phonenumber` varchar(25) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `login_id` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `db_roleId` int(11) DEFAULT NULL,
  `db_lcatId` text,
  `db_lscatId` text,
  `create_crud` text NOT NULL,
  `retrieve_crud` text NOT NULL,
  `update_crud` text NOT NULL,
  `delete_crud` text NOT NULL,
  `download_crud` text NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `db_roleId` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `db_lcatId` text NOT NULL,
  `db_lscatId` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`db_roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE IF NOT EXISTS `vendor` (
  `id_vendor` int(11) NOT NULL AUTO_INCREMENT,
  `id_vendor_address` int(11) DEFAULT NULL,
  `vendor_name` varchar(200) DEFAULT NULL,
  `user_type` varchar(255) NOT NULL,
  `tin_no` varchar(255) NOT NULL,
  `cst_no` varchar(100) NOT NULL,
  `lookup` varchar(255) NOT NULL,
  `id_itemgroup1` text,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_vendor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_contact_map`
--

CREATE TABLE IF NOT EXISTS `vendor_contact_map` (
  `id_vendor_contact_map` int(11) NOT NULL AUTO_INCREMENT,
  `id_vendor` int(11) DEFAULT NULL,
  `id_contact` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_vendor_contact_map`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_group_map`
--

CREATE TABLE IF NOT EXISTS `vendor_group_map` (
  `id_vendor_group_map` int(11) NOT NULL AUTO_INCREMENT,
  `id_vendor` int(11) NOT NULL,
  `id_itemgroup1` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_vendor_group_map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
