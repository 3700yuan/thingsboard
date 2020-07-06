--
-- Copyright © 2016-2020 The Thingsboard Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--


CREATE TABLE `admin_settings` (
  `id` varchar(31) NOT NULL,
  `json_value` json,
  `key` varchar(255) DEFAULT NULL,
  CONSTRAINT admin_settings_pkey PRIMARY KEY (`id`)
);

CREATE TABLE `asset` (
  `id` varchar(31) NOT NULL,
  `additional_info` longtext,
  `customer_id` varchar(31) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  CONSTRAINT asset_pkey PRIMARY KEY (`id`),
  UNIQUE KEY `asset_name_unq_key` (`tenant_id`,`name`)
);

CREATE TABLE `alarm` (
  `id` varchar(31) NOT NULL,
  `ack_ts` bigint(20) DEFAULT NULL,
  `clear_ts` bigint(20) DEFAULT NULL,
  `additional_info` longtext,
  `end_ts` bigint(20) DEFAULT NULL,
  `originator_id` varchar(31) DEFAULT NULL,
  `originator_type` int(11) DEFAULT NULL,
  `propagate` tinyint(1) DEFAULT NULL,
  `severity` varchar(255) DEFAULT NULL,
  `start_ts` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `propagate_relation_types` longtext,
  `type` varchar(255) DEFAULT NULL,
  CONSTRAINT alarm_pkey PRIMARY KEY (`id`)
);

CREATE TABLE `attribute_kv` (
  `entity_type` varchar(255) DEFAULT NULL,
  `entity_id` varchar(31) DEFAULT NULL,
  `attribute_type` varchar(255) DEFAULT NULL,
  `attribute_key` varchar(255) DEFAULT NULL,
  `bool_v` tinyint(1) DEFAULT NULL,
  `str_v` longtext,
  `long_v` bigint(20) DEFAULT NULL,
  `dbl_v` double DEFAULT NULL,
  `json_v` longtext,
  `last_update_ts` bigint(20) DEFAULT NULL,
  UNIQUE KEY `attribute_kv_pkey` (`entity_type`,`entity_id`,`attribute_type`,`attribute_key`)
);

CREATE TABLE `audit_log` (
  `id` varchar(31) NOT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `customer_id` varchar(31) DEFAULT NULL,
  `entity_id` varchar(31) DEFAULT NULL,
  `entity_type` varchar(255) DEFAULT NULL,
  `entity_name` varchar(255) DEFAULT NULL,
  `user_id` varchar(31) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `action_type` varchar(255) DEFAULT NULL,
  `action_data` longtext,
  `action_status` varchar(255) DEFAULT NULL,
  `action_failure_details` longtext,
  CONSTRAINT `audit_log_pkey` PRIMARY KEY (`id`)
);

CREATE TABLE `component_descriptor` (
  `id` varchar(31) NOT NULL,
  `actions` varchar(255) DEFAULT NULL,
  `clazz` longtext,
  `configuration_descriptor` longtext,
  `name` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  CONSTRAINT `component_descriptor_pkey` PRIMARY KEY (`id`)
);

CREATE TABLE `customer` (
  `id` varchar(31) NOT NULL,
  `additional_info` longtext,
  `address` longtext,
  `address2` longtext,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  CONSTRAINT `customer_pkey` PRIMARY KEY (`id`)
);

CREATE TABLE `dashboard` (
  `id` varchar(31) NOT NULL,
  `configuration` longtext,
  `assigned_customers` longtext,
  `search_text` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  CONSTRAINT `dashboard_pkey` PRIMARY KEY (`id`)
);

CREATE TABLE `device` (
  `id` varchar(31) NOT NULL,
  `additional_info` longtext,
  `customer_id` varchar(31) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  CONSTRAINT `device_pkey` PRIMARY KEY (`id`),
  UNIQUE KEY `device_name_unq_key` (`tenant_id`,`name`)
);

CREATE TABLE `device_credentials` (
  `id` varchar(31) NOT NULL,
  `credentials_id` longtext,
  `credentials_type` varchar(255) DEFAULT NULL,
  `credentials_value` longtext,
  `device_id` varchar(31) DEFAULT NULL,
  CONSTRAINT `device_credentials_pkey` PRIMARY KEY (`id`)
--  UNIQUE KEY `device_credentials_id_unq_key` (`credentials_id`)
);

CREATE TABLE `event` (
  `id` varchar(31) NOT NULL,
  `body` longtext,
  `entity_id` varchar(31) DEFAULT NULL,
  `entity_type` varchar(255) DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `event_uid` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `ts` bigint(20) DEFAULT NULL,
  CONSTRAINT `event_pkey` PRIMARY KEY (`id`),
  UNIQUE KEY `event_unq_key` (`tenant_id`,`entity_type`,`entity_id`,`event_type`,`event_uid`)
);

CREATE TABLE `relation` (
  `from_id` varchar(31) DEFAULT NULL,
  `from_type` varchar(255) DEFAULT NULL,
  `to_id` varchar(31) DEFAULT NULL,
  `to_type` varchar(255) DEFAULT NULL,
  `relation_type_group` varchar(255) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `additional_info` longtext,
  UNIQUE KEY `relation_pkey` (`from_id`,`from_type`,`relation_type_group`,`relation_type`,`to_id`)
);

CREATE TABLE `tb_user` (
  `id` varchar(31) NOT NULL,
  `additional_info` longtext,
  `authority` varchar(255) DEFAULT NULL,
  `customer_id` varchar(31) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  CONSTRAINT `tb_user_pkey` PRIMARY KEY (`id`)
);

CREATE TABLE `tenant` (
  `id` varchar(31) NOT NULL,
  `additional_info` longtext,
  `address` longtext,
  `address2` longtext,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `isolated_tb_core` tinyint(1) DEFAULT NULL,
  `isolated_tb_rule_engine` tinyint(1) DEFAULT NULL,
  CONSTRAINT `tenant_pkey` PRIMARY KEY (`id`)
);

CREATE TABLE `user_credentials` (
  `id` varchar(31) NOT NULL,
  `activate_token` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `user_id` varchar(31) DEFAULT NULL,
  CONSTRAINT `user_credentials_pkey` PRIMARY KEY (`id`),
  UNIQUE KEY `activate_token` (`activate_token`),
  UNIQUE KEY `reset_token` (`reset_token`),
  UNIQUE KEY `user_id` (`user_id`)
);

CREATE TABLE `widget_type` (
  `id` varchar(31) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `bundle_alias` varchar(255) DEFAULT NULL,
  `descriptor` longtext,
  `name` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  CONSTRAINT `widget_type_pkey` PRIMARY KEY (`id`)
);

CREATE TABLE `widgets_bundle` (
  `id` varchar(31) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  CONSTRAINT `widgets_bundle_pkey` PRIMARY KEY (`id`)
);


CREATE TABLE `rule_chain` (
  `id` varchar(31) NOT NULL,
  `additional_info` longtext,
  `configuration` longtext,
  `name` varchar(255) DEFAULT NULL,
  `first_rule_node_id` varchar(31) DEFAULT NULL,
  `root` tinyint(1) DEFAULT NULL,
  `debug_mode` tinyint(1) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `tenant_id` varchar(31) DEFAULT NULL,
  CONSTRAINT `rule_chain_pkey` PRIMARY KEY (`id`)
);

CREATE TABLE `rule_node` (
  `id` varchar(31) NOT NULL,
  `rule_chain_id` varchar(31) DEFAULT NULL,
  `additional_info` longtext,
  `configuration` longtext,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `debug_mode` tinyint(1) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  CONSTRAINT `rule_node_pkey` PRIMARY KEY (`id`)
);

CREATE TABLE `entity_view` (
  `id` varchar(31) NOT NULL,
  `entity_type` varchar(255) NOT NULL,
  `entity_id` varchar(31) NOT NULL,
  `tenant_id` varchar(31) NOT NULL,
  `customer_id` varchar(31) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `keys` longtext,
  `start_ts` bigint(20) DEFAULT NULL,
  `end_ts` bigint(20) DEFAULT NULL,
  `search_text` varchar(255) DEFAULT NULL,
  `additional_info` longtext,
  CONSTRAINT `entity_view_pkey` PRIMARY KEY (`id`)
);