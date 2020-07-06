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


CREATE TABLE `ts_kv` (
  `entity_id` varchar(31) NOT NULL,
   `key` int(11) NOT NULL,
  `bool_v` tinyint(1) DEFAULT NULL,
  `ts` bigint(20) NOT NULL,
  `str_v` longtext,
  `long_v` bigint(20) NOT NULL,
  `json_v` longtext,
  `type` varchar(255) DEFAULT NULL,
  `dbl_v` double DEFAULT NULL,
  constraint ts_kv_pkey PRIMARY KEY (`entity_id`,`key`,`ts`)
);

CREATE TABLE `ts_kv_latest` (
  `entity_id` varchar(31) NOT NULL,
   `key` int(11) NOT NULL,
  `bool_v` tinyint(1) DEFAULT NULL,
  `ts` bigint(20) NOT NULL,
  `str_v` longtext,
  `long_v` bigint(20) NOT NULL,
  `json_v` longtext,
  `dbl_v` double DEFAULT NULL,
  constraint ts_kv_latest_pkey PRIMARY KEY (`entity_id`,`key`)
);

CREATE TABLE `ts_kv_dictionary` (
   `key` varchar(255) NOT NULL,
  `key_id` int(11) UNIQUE ,
  constraint ts_key_id_pkey PRIMARY KEY (`key`)
);
