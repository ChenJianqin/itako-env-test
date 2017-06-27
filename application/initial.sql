
--
-- データベース: `itako`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `access_ranking`
--

CREATE TABLE IF NOT EXISTS `access_ranking` (
  `rank` int(10) unsigned NOT NULL auto_increment,
  `menu_id` int(10) unsigned NOT NULL,
  `access_count` int(10) unsigned NOT NULL,
  `summary_start_time` datetime NOT NULL,
  `summary_end_time` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`rank`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(100) character set utf8 collate utf8_bin NOT NULL,
  `name` varchar(100) default NULL,
  `password` varchar(255) character set utf8 collate utf8_bin NOT NULL,
  `role` varchar(50) character set utf8 collate utf8_bin NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `affiliate_asp`
--

CREATE TABLE IF NOT EXISTS `affiliate_asp` (
  `asp_cd` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `conv_url` varchar(255) default NULL,
  `conv_condition` smallint(5) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`asp_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `affiliate_conv`
--

CREATE TABLE IF NOT EXISTS `affiliate_conv` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_unique_id` varchar(180) character set utf8 collate utf8_bin NOT NULL,
  `course` smallint(5) unsigned NOT NULL,
  `asp_cd` varchar(20) NOT NULL,
  `yyyymm` int(11) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `conv_url` varchar(500) NOT NULL,
  `error_flag` smallint(5) unsigned NOT NULL,
  `response` tinyblob,
  `error_message` varchar(255) default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ix1` (`user_unique_id`,`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `affiliate_lp`
--

CREATE TABLE IF NOT EXISTS `affiliate_lp` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `asp_cd` varchar(20) NOT NULL,
  `lp_name` varchar(50) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `course` smallint(5) unsigned NOT NULL,
  `replace_tag1` varchar(20) default NULL,
  `replace_type1` smallint(5) unsigned default NULL,
  `replace_param1` varchar(20) default NULL,
  `replace_tag2` varchar(20) default NULL,
  `replace_type2` smallint(5) unsigned default NULL,
  `replace_param2` varchar(20) default NULL,
  `replace_tag3` varchar(20) default NULL,
  `replace_type3` smallint(5) unsigned default NULL,
  `replace_param3` varchar(20) default NULL,
  `replace_tag4` varchar(20) default NULL,
  `replace_type4` smallint(5) unsigned default NULL,
  `replace_param4` varchar(20) default NULL,
  `replace_tag5` varchar(20) default NULL,
  `replace_type5` smallint(5) unsigned default NULL,
  `replace_param5` varchar(20) default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `ix1` (`ref`,`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `auto_login`
--

CREATE TABLE IF NOT EXISTS `auto_login` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `member_id` int(10) unsigned NOT NULL,
  `token` varchar(128) character set utf8 collate utf8_bin NOT NULL,
  `expiration_time` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`token`),
  KEY `ix1` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `batch_lock`
--

CREATE TABLE IF NOT EXISTS `batch_lock` (
  `batch_id` smallint(5) unsigned NOT NULL,
  `lock_flag` smallint(5) unsigned NOT NULL,
  `start_datetime` datetime NOT NULL,
  PRIMARY KEY  (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `batch_log`
--

CREATE TABLE IF NOT EXISTS `batch_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `batch_id` smallint(5) unsigned NOT NULL,
  `status` smallint(5) unsigned NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `before_next_charge_day_site`
--

CREATE TABLE IF NOT EXISTS `before_next_charge_day_site` (
  `id` int(10) NOT NULL auto_increment,
  `date` date NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `uid` varchar(128) NOT NULL,
  `member_type` smallint(5) unsigned NOT NULL,
  `member_status1` smallint(5) unsigned NOT NULL default '0',
  `continue_flag1` smallint(5) unsigned NOT NULL default '0',
  `next_charge_day1` date default NULL,
  `charge_date_no1` smallint(5) unsigned default NULL,
  `member_status2` smallint(5) unsigned NOT NULL default '0',
  `continue_flag2` smallint(5) unsigned NOT NULL default '0',
  `next_charge_day2` date default NULL,
  `charge_date_no2` smallint(5) unsigned default NULL,
  `member_status3` smallint(5) unsigned NOT NULL default '0',
  `continue_flag3` smallint(5) unsigned NOT NULL default '0',
  `next_charge_day3` date default NULL,
  `charge_date_no3` smallint(5) unsigned default NULL,
  `member_status4` smallint(5) unsigned NOT NULL default '0',
  `continue_flag4` smallint(5) unsigned NOT NULL default '0',
  `next_charge_day4` date default NULL,
  `charge_date_no4` smallint(5) unsigned default NULL,
  `member_status5` smallint(5) unsigned NOT NULL default '0',
  `continue_flag5` smallint(5) unsigned NOT NULL default '0',
  `next_charge_day5` date default NULL,
  `charge_date_no5` smallint(5) unsigned default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`date`,`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `corner_id` int(10) unsigned NOT NULL,
  `list_page_flag` smallint(5) unsigned NOT NULL default '1',
  `sort` int(10) unsigned NOT NULL default '9999',
  `open_flag` smallint(5) unsigned NOT NULL default '1',
  `group_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ix1` (`corner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `category_menu_relation`
--

CREATE TABLE IF NOT EXISTS `category_menu_relation` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `category_id` int(10) unsigned NOT NULL,
  `menu_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ix1` (`menu_id`),
  KEY `ix2` (`category_id`),
  KEY `inx_1` (`menu_id`,`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `contents_charge`
--

CREATE TABLE IF NOT EXISTS `contents_charge` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `member_id` int(10) unsigned NOT NULL,
  `trans_id` varchar(100) character set utf8 collate utf8_bin NOT NULL,
  `charge_id` smallint(5) unsigned NOT NULL,
  `contents_id` smallint(5) unsigned NOT NULL,
  `member_type` smallint(5) unsigned NOT NULL,
  `price` mediumint(8) unsigned NOT NULL,
  `charge_time` datetime NOT NULL,
  `settlement_data` varchar(255) default NULL,
  `ref` varchar(50) default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`trans_id`,`member_id`),
  KEY `ix1` (`member_id`,`contents_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `contents_daily_ref_sales`
--

CREATE TABLE IF NOT EXISTS `contents_daily_ref_sales` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `date` date NOT NULL,
  `charge_id` smallint(5) unsigned NOT NULL,
  `contents_id` smallint(5) unsigned NOT NULL,
  `member_type` smallint(5) unsigned NOT NULL,
  `ref` varchar(50) NOT NULL default '',
  `count` int(10) unsigned NOT NULL default '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`date`,`charge_id`,`contents_id`,`member_type`,`ref`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `contents_daily_sales`
--

CREATE TABLE IF NOT EXISTS `contents_daily_sales` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `date` date NOT NULL,
  `charge_id` smallint(5) unsigned NOT NULL,
  `contents_id` smallint(5) unsigned NOT NULL,
  `member_type` smallint(5) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL default '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`date`,`charge_id`,`contents_id`,`member_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `contents_daily_this_month_sales`
--

CREATE TABLE IF NOT EXISTS `contents_daily_this_month_sales` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `date` date NOT NULL,
  `charge_id` smallint(5) unsigned NOT NULL,
  `contents_id` smallint(5) unsigned NOT NULL,
  `member_type` smallint(5) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL default '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`date`,`charge_id`,`contents_id`,`member_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `corner`
--

CREATE TABLE IF NOT EXISTS `corner` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `sort` int(10) unsigned NOT NULL default '9999',
  `open_flag` smallint(5) unsigned NOT NULL default '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- テーブルの構造 `daily_ref_summary`
--

CREATE TABLE IF NOT EXISTS `daily_ref_summary` (
  `id` int(11) NOT NULL auto_increment,
  `date` date NOT NULL,
  `course` int(10) unsigned NOT NULL,
  `member_type` smallint(5) unsigned NOT NULL,
  `ref` varchar(50) NOT NULL,
  `regist` int(10) unsigned NOT NULL default '0',
  `trial_conv` int(10) unsigned NOT NULL default '0',
  `inherit_in` int(10) unsigned NOT NULL default '0',
  `unregist` int(10) unsigned NOT NULL default '0',
  `inherit_out` int(10) unsigned NOT NULL default '0',
  `increase` int(11) NOT NULL default '0',
  `trial_regist` int(10) unsigned NOT NULL default '0',
  `trial_inherit_in` int(10) unsigned NOT NULL default '0',
  `trial_unregist` int(10) unsigned NOT NULL default '0',
  `trial_inherit_out` int(10) unsigned NOT NULL default '0',
  `trial_increase` int(11) NOT NULL default '0',
  `regist_charge` int(10) unsigned NOT NULL default '0',
  `regist_charge_own` int(10) unsigned NOT NULL default '0',
  `regist_charge_pair` int(10) unsigned NOT NULL default '0',
  `continuation_charge` int(10) unsigned NOT NULL default '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`date`,`course`,`member_type`,`ref`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `daily_summary`
--

CREATE TABLE IF NOT EXISTS `daily_summary` (
  `id` int(11) NOT NULL auto_increment,
  `date` date NOT NULL,
  `course` int(10) unsigned NOT NULL,
  `member_type` smallint(5) unsigned NOT NULL,
  `regist` int(10) unsigned NOT NULL default '0',
  `trial_conv` int(10) unsigned NOT NULL default '0',
  `inherit_in` int(10) unsigned NOT NULL default '0',
  `unregist` int(10) unsigned NOT NULL default '0',
  `inherit_out` int(10) unsigned NOT NULL default '0',
  `increase` int(11) NOT NULL default '0',
  `trial_regist` int(10) unsigned NOT NULL default '0',
  `trial_inherit_in` int(10) unsigned NOT NULL default '0',
  `trial_unregist` int(10) unsigned NOT NULL default '0',
  `trial_inherit_out` int(10) unsigned NOT NULL default '0',
  `trial_increase` int(11) NOT NULL default '0',
  `member_count` int(10) unsigned NOT NULL default '0',
  `trial_member_count` int(10) unsigned NOT NULL default '0',
  `regist_charge` int(10) unsigned NOT NULL default '0',
  `regist_charge_own` int(10) unsigned NOT NULL default '0',
  `regist_charge_pair` int(10) unsigned NOT NULL default '0',
  `continuation_charge` int(10) unsigned NOT NULL default '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`date`,`course`,`member_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `device`
--

CREATE TABLE IF NOT EXISTS `device` (
  `device` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `carrier` varchar(20) NOT NULL,
  `contents_flag` smallint(5) unsigned NOT NULL,
  `display_time` datetime NOT NULL,
  `cache_size` int(10) unsigned NOT NULL,
  `flash_flag` smallint(5) unsigned NOT NULL,
  `flash_ver` int(10) unsigned default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `empty_mail`
--

CREATE TABLE IF NOT EXISTS `empty_mail` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `hash_code` varchar(100) character set utf8 collate utf8_bin NOT NULL,
  `func` varchar(10) character set utf8 collate utf8_bin NOT NULL,
  `mag_id` int(10) unsigned default NULL,
  `expire_time` datetime NOT NULL,
  `member_type` smallint(5) unsigned default NULL,
  `uid` varchar(100) character set utf8 collate utf8_bin default NULL,
  `member_id` int(10) unsigned default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`hash_code`),
  UNIQUE KEY `uix2` (`uid`,`func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `enquete`
--

CREATE TABLE IF NOT EXISTS `enquete` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` varchar(128) character set utf8 collate utf8_bin default NULL,
  `regist_time` datetime NOT NULL,
  `answer1` varchar(20) default NULL,
  `answer2` varchar(20) default NULL,
  `answer3` varchar(20) default NULL,
  `answer4` varchar(20) default NULL,
  `comment` text,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `favorite`
--

CREATE TABLE IF NOT EXISTS `favorite` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `member_id` int(10) unsigned NOT NULL,
  `menu_type` smallint(5) unsigned NOT NULL,
  `menu_key` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`member_id`,`menu_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `feature`
--

CREATE TABLE IF NOT EXISTS `feature` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) default NULL,
  `point` int(10) unsigned NOT NULL,
  `itunes_product_id` varchar(100) character set utf8 collate utf8_bin default NULL,
  `expiry_config` smallint(5) unsigned NOT NULL,
  `type` smallint(6) NOT NULL,
  `com_passed_month` smallint(6) default NULL,
  `sea_disp_month` smallint(6) default NULL,
  `irr_open_time` datetime default NULL,
  `irr_close_time` datetime default NULL,
  `sort` int(10) unsigned NOT NULL default '9999',
  `recommend_flag` smallint(5) unsigned NOT NULL default '1',
  `open_flag` smallint(5) unsigned NOT NULL default '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ix1` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- テーブルの構造 `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` varchar(128) character set utf8 collate utf8_bin default NULL,
  `regist_time` datetime NOT NULL,
  `type` smallint(5) unsigned NOT NULL,
  `comment` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `fortune_access_log`
--

CREATE TABLE IF NOT EXISTS `fortune_access_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menu_type` smallint(5) unsigned NOT NULL,
  `menu_key` varchar(10) NOT NULL,
  `member_id` int(10) unsigned default NULL,
  `member_type` smallint(6) default NULL,
  `access_time` datetime NOT NULL,
  `summary_flag` smallint(5) unsigned NOT NULL default '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ix1` (`member_id`,`menu_key`,`menu_type`),
  KEY `ix_2` (`summary_flag`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `fortune_result_log`
--

CREATE TABLE IF NOT EXISTS `fortune_result_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pid` varchar(20) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `partner_id` int(10) unsigned NOT NULL,
  `contents_charge_id` int(10) unsigned default NULL,
  `param` text NOT NULL,
  `body` text NOT NULL,
  `manuscript` text NOT NULL,
  `menu_id` int(10) unsigned NOT NULL,
  `expire_time` datetime NOT NULL default '2999-12-31 23:59:59',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ix_1` (`pid`,`member_id`,`partner_id`,`contents_charge_id`),
  KEY `ix_2` (`expire_time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `fp_access_control`
--

CREATE TABLE IF NOT EXISTS `fp_access_control` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` varchar(17) character set utf8 collate utf8_bin NOT NULL,
  `free_word` varchar(30) default NULL,
  `maintenance_flag` smallint(5) unsigned NOT NULL,
  `time_modify_flag` smallint(5) unsigned NOT NULL,
  `dummy_access_time` datetime default NULL,
  `dummy_regist_time` datetime default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `if_log`
--

CREATE TABLE IF NOT EXISTS `if_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `if_code` varchar(50) character set utf8 collate utf8_bin NOT NULL,
  `key1` varchar(100) character set utf8 collate utf8_bin default NULL,
  `key2` varchar(100) character set utf8 collate utf8_bin default NULL,
  `data` text,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ix1` (`key1`,`if_code`),
  KEY `ix2` (`key2`,`if_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `publish_time` datetime NOT NULL,
  `open_time` datetime NOT NULL default '1970-01-01 00:00:00',
  `close_time` datetime NOT NULL default '2038-12-31 23:59:59',
  `link_url` varchar(255) default NULL,
  `info_type` smallint(5) unsigned NOT NULL,
  `open_flag` tinyint(3) unsigned NOT NULL default '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ix1` (`open_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `mag`
--

CREATE TABLE IF NOT EXISTS `mag` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(100) character set utf8 collate utf8_bin NOT NULL,
  `adbook` varchar(8) character set utf8 collate utf8_bin default NULL,
  `charge_flag` smallint(5) unsigned NOT NULL,
  `open_flag` smallint(5) unsigned NOT NULL,
  `sort` mediumint(8) unsigned NOT NULL default '9999',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `mag_mail_address`
--

CREATE TABLE IF NOT EXISTS `mag_mail_address` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `mag_id` int(10) unsigned NOT NULL,
  `mail_address_id` int(10) unsigned NOT NULL,
  `regist_time` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`mail_address_id`,`mag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `mag_mail_address_log`
--

CREATE TABLE IF NOT EXISTS `mag_mail_address_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `change_type` smallint(5) unsigned NOT NULL,
  `reason` smallint(5) unsigned NOT NULL,
  `mag_mail_address_id` int(10) unsigned NOT NULL,
  `mag_id` int(10) unsigned NOT NULL,
  `mail_address_id` int(10) unsigned NOT NULL,
  `regist_time` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `mail_address`
--

CREATE TABLE IF NOT EXISTS `mail_address` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `mail` varchar(100) character set utf8 collate utf8_bin NOT NULL,
  `member_type` smallint(5) unsigned default NULL,
  `uid` varchar(128) character set utf8 collate utf8_bin default NULL,
  `member_id` int(10) unsigned default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`mail`),
  UNIQUE KEY `uix2` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `manuscript_multiple`
--

CREATE TABLE IF NOT EXISTS `manuscript_multiple` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menu_id` int(10) unsigned NOT NULL,
  `result_id` int(10) unsigned NOT NULL,
  `manuscript_id` int(10) unsigned NOT NULL,
  `manuscript` text NOT NULL,
  `open_flag` smallint(5) unsigned NOT NULL default '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`menu_id`,`result_id`,`manuscript_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- テーブルの構造 `manuscript_single`
--

CREATE TABLE IF NOT EXISTS `manuscript_single` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menu_id` int(10) unsigned NOT NULL,
  `result_id` int(10) unsigned NOT NULL,
  `manuscript` text NOT NULL,
  `open_flag` smallint(5) unsigned NOT NULL default '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`menu_id`,`result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- テーブルの構造 `manuscript_special`
--

CREATE TABLE IF NOT EXISTS `manuscript_special` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menu_id` int(10) unsigned NOT NULL,
  `page_number` int(10) unsigned NOT NULL,
  `result_id` int(10) unsigned NOT NULL,
  `manuscript` text NOT NULL,
  `open_flag` smallint(5) unsigned NOT NULL default '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`menu_id`,`page_number`,`result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- テーブルの構造 `manuscript_special_multiple`
--

CREATE TABLE IF NOT EXISTS `manuscript_special_multiple` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menu_id` int(10) unsigned NOT NULL,
  `page_number` int(10) unsigned NOT NULL,
  `result_id` int(10) unsigned NOT NULL,
  `manuscript_id` int(10) unsigned NOT NULL,
  `manuscript` text NOT NULL,
  `open_flag` smallint(5) unsigned NOT NULL default '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`menu_id`,`page_number`,`result_id`,`manuscript_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- テーブルの構造 `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` varchar(128) character set utf8 collate utf8_bin NOT NULL,
  `member_type` smallint(5) unsigned NOT NULL,
  `member_status1` smallint(5) unsigned NOT NULL default '0',
  `continue_flag1` smallint(5) unsigned NOT NULL default '0',
  `trial_flag1` smallint(5) unsigned NOT NULL default '0',
  `inherit_flag1` smallint(5) unsigned NOT NULL default '0',
  `ref1` varchar(50) default NULL,
  `regist_time1` datetime default NULL,
  `tregist_time1` datetime default NULL,
  `inherit_time1` datetime default NULL,
  `unregist_time1` datetime default NULL,
  `next_charge_day1` date default NULL,
  `charge_date_no1` smallint(5) unsigned default NULL,
  `reg_unreg_id1` int(10) unsigned default NULL,
  `settlement_no1` varchar(50) default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`uid`),
  KEY `ix1` (`regist_time1`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `member_info`
--

CREATE TABLE IF NOT EXISTS `member_info` (
  `member_id` int(10) unsigned NOT NULL,
  `nickname` varchar(20) default NULL,
  `birthday` date default NULL,
  `gender` varchar(1) default NULL,
  `love_status` smallint(5) unsigned default NULL,
  `marriage_status` smallint(5) unsigned default NULL,
  `stay_starting_point` date default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `member_menu_access`
--

CREATE TABLE IF NOT EXISTS `member_menu_access` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menu_type` smallint(5) unsigned NOT NULL,
  `menu_key` varchar(10) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `access_count` int(10) unsigned NOT NULL default '0',
  `last_access_time` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`member_id`,`menu_type`,`menu_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pid` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `line_fortune_name` varchar(100) default NULL,
  `logic` smallint(5) unsigned NOT NULL,
  `point` int(10) unsigned NOT NULL,
  `itunes_product_id` varchar(100) character set utf8 collate utf8_bin default NULL,
  `fortune_param` varchar(50) default NULL,
  `fortune_param_2` varchar(50) default NULL,
  `feature_id` smallint(5) unsigned default NULL,
  `disp_dd` smallint(5) unsigned default NULL,
  `sort` int(10) unsigned NOT NULL default '9999',
  `open_time` datetime NOT NULL default '1970-01-01 00:00:00',
  `close_time` datetime NOT NULL default '2038-12-31 23:59:59',
  `stay_days` int(10) unsigned NOT NULL default '0',
  `days_to_release` int(11) unsigned NOT NULL default '0' COMMENT '会員登録からこの日数が経過するとメニューが公開される',
  `ranking_flag` smallint(5) unsigned NOT NULL default '1',
  `nonmember_ok_flag` smallint(5) unsigned NOT NULL default '0',
  `charge_type` smallint(5) unsigned NOT NULL default '0',
  `midnight_flag` smallint(5) unsigned NOT NULL default '0',
  `recommend_flag` smallint(5) unsigned NOT NULL default '1',
  `lead_sentence` text,
  `open_flag` smallint(5) unsigned NOT NULL default '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ix1` (`disp_dd`),
  KEY `menu_idx1` (`open_flag`,`open_time`,`close_time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- テーブルの構造 `menu_attribute`
--

CREATE TABLE IF NOT EXISTS `menu_attribute` (
  `menu_id` int(10) unsigned NOT NULL,
  `love_status_1` smallint(5) unsigned NOT NULL default '0',
  `love_status_2` smallint(5) unsigned NOT NULL default '0',
  `love_status_3` smallint(5) unsigned NOT NULL default '0',
  `love_status_4` smallint(5) unsigned NOT NULL default '0',
  `love_status_5` smallint(5) unsigned NOT NULL default '0',
  `love_status_6` smallint(5) unsigned NOT NULL default '0',
  `love_status_7` smallint(5) unsigned NOT NULL default '0',
  `love_status_8` smallint(5) unsigned NOT NULL default '0',
  `love_status_9` smallint(5) unsigned NOT NULL default '0',
  `fortune_type_1` smallint(5) unsigned NOT NULL default '0',
  `fortune_type_2` smallint(5) unsigned NOT NULL default '0',
  `fortune_type_3` smallint(5) unsigned NOT NULL default '0',
  `fortune_type_4` smallint(5) unsigned NOT NULL default '0',
  `fortune_type_5` smallint(5) unsigned NOT NULL default '0',
  `fortune_type_6` smallint(5) unsigned NOT NULL default '0',
  `fortune_type_7` smallint(5) unsigned NOT NULL default '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`menu_id`),
  KEY `love_status_1` (`love_status_1`),
  KEY `love_status_2` (`love_status_2`),
  KEY `love_status_3` (`love_status_3`),
  KEY `love_status_4` (`love_status_4`),
  KEY `love_status_5` (`love_status_5`),
  KEY `love_status_6` (`love_status_6`),
  KEY `love_status_7` (`love_status_7`),
  KEY `love_status_8` (`love_status_8`),
  KEY `love_status_9` (`love_status_9`),
  KEY `fortune_type_1` (`fortune_type_1`),
  KEY `fortune_type_2` (`fortune_type_2`),
  KEY `fortune_type_3` (`fortune_type_3`),
  KEY `fortune_type_4` (`fortune_type_4`),
  KEY `fortune_type_5` (`fortune_type_5`),
  KEY `fortune_type_6` (`fortune_type_6`),
  KEY `fortune_type_7` (`fortune_type_7`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `menu_chunk_process`
--

CREATE TABLE IF NOT EXISTS `menu_chunk_process` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `type` varchar(10) NOT NULL,
  `menu_id` int(10) unsigned NOT NULL,
  `manuscript_key` varchar(10) NOT NULL,
  `open_time` datetime NOT NULL default '1970-01-01 00:00:00',
  `close_time` datetime NOT NULL default '2038-12-31 23:59:59',
  `open_flag` smallint(5) unsigned NOT NULL default '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ix1` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- テーブルの構造 `menu_evaluation`
--

CREATE TABLE IF NOT EXISTS `menu_evaluation` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主キー',
  `menu_id` int(10) unsigned NOT NULL COMMENT 'メニューID',
  `evaluation` int(10) unsigned NOT NULL COMMENT '評価平均',
  `created` datetime NOT NULL COMMENT '作成日',
  `modified` datetime NOT NULL COMMENT '更新日',
  PRIMARY KEY  (`id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='メニュー評価テーブル';

-- --------------------------------------------------------

--
-- テーブルの構造 `menu_line_fortune`
--

CREATE TABLE IF NOT EXISTS `menu_line_fortune` (
  `id` int(11) NOT NULL auto_increment,
  `line_menu_id` int(11) NOT NULL COMMENT 'Line･ﾑ･ﾃ･ｯ ﾄﾌ､ｷﾈﾖｹ',
  `line_menu_title` varchar(128) NOT NULL COMMENT 'Line･ﾑ･ﾃ･ｯﾌｾ',
  `explanation` varchar(128) NOT NULL COMMENT '･ﾑ･ﾃ･ｯﾀ篶ﾀﾊｸ',
  `menu_id` varchar(255) NOT NULL COMMENT 'ｴﾞ､ﾞ､??皈ﾋ･蝪ｼID(･ｫ･?ﾞｶ霏ﾚ､熙ﾇﾊ｣ｿ?ﾘﾄ?ﾄ)',
  `price` int(8) NOT NULL default '0' COMMENT '0､ﾎｾ?遉ﾏﾌｵﾎﾁLine･ﾑ･ﾃ･ｯ',
  `open_flag` smallint(5) NOT NULL default '1' COMMENT 'ﾍｭｸ?ｵｸ?ﾕ･鬣ｰ',
  `created` datetime NOT NULL COMMENT 'ｺ?ｮﾆ?',
  `modified` datetime NOT NULL COMMENT 'ｺﾇｽｪｹｹｿｷﾆ?',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `line_menu_id` (`line_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Line占い';

-- --------------------------------------------------------

--
-- テーブルの構造 `menu_sale`
--

CREATE TABLE IF NOT EXISTS `menu_sale` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menu_id` int(10) unsigned NOT NULL,
  `open_time` datetime NOT NULL default '1970-01-01 00:00:00',
  `close_time` datetime NOT NULL default '2038-12-31 23:59:59',
  `charge_type` smallint(5) unsigned NOT NULL default '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `menu_idx1` (`open_time`,`close_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- テーブルの構造 `mymenu_inherit_log`
--

CREATE TABLE IF NOT EXISTS `mymenu_inherit_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `file` varchar(30) NOT NULL,
  `suid` varchar(29) character set utf8 collate utf8_bin NOT NULL,
  `uid` varchar(10) character set utf8 collate utf8_bin NOT NULL,
  `settlement_no` varchar(50) NOT NULL,
  `status` smallint(5) unsigned NOT NULL,
  `inherit_time` datetime NOT NULL,
  `course` smallint(5) unsigned NOT NULL default '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `onetime_mail`
--

CREATE TABLE IF NOT EXISTS `onetime_mail` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `hash_code` varchar(100) character set utf8 collate utf8_bin NOT NULL,
  `func` varchar(10) character set utf8 collate utf8_bin NOT NULL,
  `mail` varchar(100) character set utf8 collate utf8_bin NOT NULL,
  `member_id` int(10) unsigned default NULL,
  `mag_id` int(10) unsigned default NULL,
  `expire_time` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`hash_code`),
  UNIQUE KEY `uix2` (`member_id`,`func`),
  KEY `ix1` (`mail`,`func`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `partner_info`
--

CREATE TABLE IF NOT EXISTS `partner_info` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `member_id` int(10) unsigned NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `birthday` date default NULL,
  `gender` varchar(1) NOT NULL,
  `priority_flag` smallint(5) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ix1` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `personal_fortune`
--

CREATE TABLE IF NOT EXISTS `personal_fortune` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `member_id` int(10) unsigned NOT NULL,
  `uid` varchar(128) character set utf8 collate utf8_bin NOT NULL,
  `family_name` varchar(20) default NULL,
  `family_name_yomi` varchar(20) default NULL,
  `name` varchar(20) default NULL,
  `name_yomi` varchar(20) default NULL,
  `nickname` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(2) default NULL,
  `ask_category` smallint(6) NOT NULL,
  `asking` text NOT NULL,
  `answer` text,
  `selected` smallint(6) NOT NULL default '0',
  `open_flag` smallint(5) unsigned NOT NULL default '0',
  `display_date` date default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `selected` (`selected`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `premium_mail`
--

CREATE TABLE IF NOT EXISTS `premium_mail` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `member_id` int(10) unsigned NOT NULL,
  `regist_ym` varchar(6) NOT NULL,
  `mail` varchar(100) character set utf8 collate utf8_bin NOT NULL,
  `content` text NOT NULL,
  `regist_time` datetime NOT NULL,
  `image_cnt` smallint(5) unsigned default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`member_id`,`regist_ym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- テーブルの構造 `reg_unreg`
--

CREATE TABLE IF NOT EXISTS `reg_unreg` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `status` smallint(5) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `uid` varchar(128) character set utf8 collate utf8_bin NOT NULL,
  `old_uid` varchar(128) character set utf8 collate utf8_bin default NULL,
  `member_type` smallint(5) unsigned NOT NULL,
  `course` smallint(5) unsigned NOT NULL,
  `trial_flag` smallint(5) unsigned NOT NULL,
  `trial_conv_flag` smallint(5) unsigned NOT NULL,
  `inherit_flag` smallint(5) unsigned NOT NULL,
  `continue_flag` smallint(5) unsigned NOT NULL,
  `ref` varchar(50) default NULL,
  `regist_time` datetime default NULL,
  `tregist_time` datetime default NULL,
  `inherit_time` datetime default NULL,
  `unregist_time` datetime default NULL,
  `settlement_no` varchar(50) default NULL,
  `start_func` varchar(20) NOT NULL default 'regist',
  `close_func` varchar(20) default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ix1` (`old_uid`,`inherit_flag`,`inherit_time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `code` varchar(20) character set utf8 collate utf8_bin NOT NULL,
  `descripion` varchar(50) default NULL,
  `str_value` varchar(100) character set utf8 collate utf8_bin default NULL,
  `int_value` int(11) default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `special_fortune_element`
--

CREATE TABLE IF NOT EXISTS `special_fortune_element` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menu_id` int(10) unsigned NOT NULL,
  `page_number` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `line_fortune_name` varchar(100) default NULL,
  `logic` int(10) unsigned NOT NULL,
  `fortune_param` varchar(50) default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`menu_id`,`page_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- テーブルの構造 `special_fortune_log`
--

CREATE TABLE IF NOT EXISTS `special_fortune_log` (
  `contents_charge_id` int(10) unsigned NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `fortune_date` date default NULL,
  `partner_id` int(10) unsigned default NULL,
  `partner_nickname` varchar(20) default NULL,
  `partner_birthday` date default NULL,
  `partner_gender` varchar(1) default NULL,
  `expire_time` datetime NOT NULL,
  `status_flag` smallint(5) unsigned NOT NULL default '0',
  `evaluation` int(10) unsigned NOT NULL default '0' COMMENT '評価ポイント',
  `rc_result` smallint(5) unsigned NOT NULL default '0' COMMENT 'リコメンド購入結果',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`contents_charge_id`),
  KEY `inx_1` (`expire_time`,`evaluation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `sp_access_control`
--

CREATE TABLE IF NOT EXISTS `sp_access_control` (
  `hash_key` varchar(100) character set utf8 collate utf8_bin NOT NULL,
  `approve_flag` smallint(5) unsigned NOT NULL,
  `free_word` varchar(30) default NULL,
  `user_agent` varchar(100) default NULL,
  `expire_time` datetime NOT NULL,
  `maintenance_flag` smallint(5) unsigned NOT NULL,
  `time_modify_flag` smallint(5) unsigned NOT NULL,
  `dummy_access_time` datetime default NULL,
  `dummy_regist_time` datetime default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`hash_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `trial_member`
--

CREATE TABLE IF NOT EXISTS `trial_member` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `member_id` int(10) unsigned NOT NULL,
  `course` smallint(5) unsigned NOT NULL,
  `tregist_time` datetime default NULL,
  `tcharge_date` date default NULL,
  `ref` varchar(50) default NULL,
  `params` varchar(2000) default NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uix1` (`member_id`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
