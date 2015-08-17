<?php
{%- from "suitecrm/map.jinja" import server with context %}
{%- set app = salt['pillar.get']('suitecrm:server:app:'+app_name) %}
$sugar_config = array (
  'addAjaxBannedModules' =>
  array (
    0 => 'SecurityGroups',
  ),
  'admin_access_control' => false,
  'admin_export_only' => false,
  'aod' =>
  array (
    'enable_aod' => true,
  ),
  'aop' =>
  array (
    'distribution_method' => 'roundRobin',
    'case_closure_email_template_id' => 'a28c52e7-7219-ab6b-4fe5-55d1d5d6f695',
    'joomla_account_creation_email_template_id' => 'a3df63f1-753f-c909-6ea3-55d1d5f814d9',
    'case_creation_email_template_id' => 'a50b0652-33c1-0e46-732b-55d1d56dc68a',
    'contact_email_template_id' => 'a6cf31bb-074c-090d-063c-55d1d537023e',
    'user_email_template_id' => 'a8db2f92-d751-1a5c-b6af-55d1d543e17a',
  ),
  'aos' =>
  array (
    'version' => '5.3.3',
    'contracts' =>
    array (
      'renewalReminderPeriod' => '14',
    ),
    'lineItems' =>
    array (
      'totalTax' => false,
      'enableGroups' => true,
    ),
    'invoices' =>
    array (
      'initialNumber' => '1',
    ),
    'quotes' =>
    array (
      'initialNumber' => '1',
    ),
  ),
  'cache_dir' => 'cache/',
  'calculate_response_time' => true,
  'calendar' =>
  array (
    'default_view' => 'week',
    'show_calls_by_default' => true,
    'show_tasks_by_default' => true,
    'show_completed_by_default' => true,
    'editview_width' => 990,
    'editview_height' => 485,
    'day_timestep' => 15,
    'week_timestep' => 30,
    'items_draggable' => true,
    'items_resizable' => true,
    'enable_repeat' => true,
    'max_repeat_count' => 1000,
  ),
  'chartEngine' => 'Jit',
  'common_ml_dir' => '',
  'create_default_user' => false,
  'cron' =>
  array (
    'max_cron_jobs' => 10,
    'max_cron_runtime' => 30,
    'min_cron_interval' => 30,
  ),
  'currency' => '',
  'dashlet_display_row_options' =>
  array (
    0 => '1',
    1 => '3',
    2 => '5',
    3 => '10',
  ),
  'date_formats' =>
  array (
    'Y-m-d' => '2010-12-23',
    'm-d-Y' => '12-23-2010',
    'd-m-Y' => '23-12-2010',
    'Y/m/d' => '2010/12/23',
    'm/d/Y' => '12/23/2010',
    'd/m/Y' => '23/12/2010',
    'Y.m.d' => '2010.12.23',
    'd.m.Y' => '23.12.2010',
    'm.d.Y' => '12.23.2010',
  ),
  'datef' => 'm/d/Y',
  'dbconfig' =>
  array (
    'db_host_name' => '{{ app.database.host }}',
    'db_host_instance' => 'SQLEXPRESS',
    'db_user_name' => '{{ app.database.user }}',
    'db_password' => '{{ app.database.password }}',
    'db_name' => '{{ app.database.name }}',
    'db_type' => 'mysql',
    'db_port' => '',
    'db_manager' => 'MysqliManager',
  ),
  'dbconfigoption' =>
  array (
    'persistent' => true,
    'autofree' => false,
    'debug' => 0,
    'ssl' => false,
    'collation' => 'utf8_general_ci',
  ),
  'default_action' => 'index',
  'default_charset' => 'UTF-8',
  'default_currencies' =>
  array (
    'AUD' =>
    array (
      'name' => 'Australian Dollars',
      'iso4217' => 'AUD',
      'symbol' => '$',
    ),
    'BRL' =>
    array (
      'name' => 'Brazilian Reais',
      'iso4217' => 'BRL',
      'symbol' => 'R$',
    ),
    'GBP' =>
    array (
      'name' => 'British Pounds',
      'iso4217' => 'GBP',
      'symbol' => '£',
    ),
    'CAD' =>
    array (
      'name' => 'Canadian Dollars',
      'iso4217' => 'CAD',
      'symbol' => '$',
    ),
    'CNY' =>
    array (
      'name' => 'Chinese Yuan',
      'iso4217' => 'CNY',
      'symbol' => '￥',
    ),
    'EUR' =>
    array (
      'name' => 'Euro',
      'iso4217' => 'EUR',
      'symbol' => '€',
    ),
    'HKD' =>
    array (
      'name' => 'Hong Kong Dollars',
      'iso4217' => 'HKD',
      'symbol' => '$',
    ),
    'INR' =>
    array (
      'name' => 'Indian Rupees',
      'iso4217' => 'INR',
      'symbol' => '₨',
    ),
    'KRW' =>
    array (
      'name' => 'Korean Won',
      'iso4217' => 'KRW',
      'symbol' => '₩',
    ),
    'YEN' =>
    array (
      'name' => 'Japanese Yen',
      'iso4217' => 'JPY',
      'symbol' => '¥',
    ),
    'MXM' =>
    array (
      'name' => 'Mexican Pesos',
      'iso4217' => 'MXM',
      'symbol' => '$',
    ),
    'SGD' =>
    array (
      'name' => 'Singaporean Dollars',
      'iso4217' => 'SGD',
      'symbol' => '$',
    ),
    'CHF' =>
    array (
      'name' => 'Swiss Franc',
      'iso4217' => 'CHF',
      'symbol' => 'SFr.',
    ),
    'THB' =>
    array (
      'name' => 'Thai Baht',
      'iso4217' => 'THB',
      'symbol' => '฿',
    ),
    'USD' =>
    array (
      'name' => 'US Dollars',
      'iso4217' => 'USD',
      'symbol' => '$',
    ),
  ),
  'default_currency_iso4217' => 'USD',
  'default_currency_name' => 'US Dollars',
  'default_currency_significant_digits' => 2,
  'default_currency_symbol' => '$',
  'default_date_format' => 'm/d/Y',
  'default_decimal_seperator' => '.',
  'default_email_charset' => 'UTF-8',
  'default_email_client' => 'sugar',
  'default_email_editor' => 'html',
  'default_export_charset' => 'UTF-8',
  'default_language' => 'en_us',
  'default_locale_name_format' => 's f l',
  'default_max_tabs' => 10,
  'default_module' => 'Home',
  'default_navigation_paradigm' => 'gm',
  'default_number_grouping_seperator' => ',',
  'default_password' => '',
  'default_permissions' =>
  array (
    'dir_mode' => 1528,
    'file_mode' => 432,
    'user' => '',
    'group' => '',
  ),
  'default_subpanel_links' => false,
  'default_subpanel_tabs' => true,
  'default_swap_last_viewed' => false,
  'default_swap_shortcuts' => false,
  'default_theme' => 'SuiteR',
  'default_time_format' => 'h:ia',
  'default_user_is_admin' => false,
  'default_user_name' => '',
  'demoData' => 'no',
  'disable_convert_lead' => false,
  'disable_export' => false,
  'disable_persistent_connections' => 'false',
  'display_email_template_variable_chooser' => false,
  'display_inbound_email_buttons' => false,
  'dump_slow_queries' => false,
  'email_address_separator' => ',',
  'email_default_client' => 'sugar',
  'email_default_delete_attachments' => true,
  'email_default_editor' => 'html',
  'enable_line_editing_detail' => true,
  'enable_line_editing_list' => true,
  'export_delimiter' => ',',
  'export_excel_compatible' => false,
  'history_max_viewed' => 50,
  'host_name' => 'suitecrm-single.webapp.dev.nwt.robotice.cz',
  'import_max_execution_time' => 3600,
  'import_max_records_per_file' => 100,
  'import_max_records_total_limit' => '',
  'installer_locked' => true,
  'jobs' =>
  array (
    'min_retry_interval' => 30,
    'max_retries' => 5,
    'timeout' => 86400,
  ),
  'js_custom_version' => '',
  'js_lang_version' => 1,
  'languages' =>
  array (
    'en_us' => 'English (US)',
    'es_es' => 'Español (ES)',
    'ru_ru' => 'Русский (RU)',
  ),
  'large_scale_test' => false,
  'lead_conv_activity_opt' => 'donothing',
  'list_max_entries_per_page' => 20,
  'list_max_entries_per_subpanel' => 10,
  'lock_default_user_name' => false,
  'lock_homepage' => false,
  'lock_subpanels' => false,
  'log_dir' => '.',
  'log_file' => 'suitecrm.log',
  'log_memory_usage' => false,
  'logger' =>
  array (
    'level' => 'fatal',
    'file' =>
    array (
      'ext' => '.log',
      'name' => 'suitecrm',
      'dateFormat' => '%c',
      'maxSize' => '10MB',
      'maxLogs' => 10,
      'suffix' => '',
    ),
  ),
  'max_dashlets_homepage' => '15',
  'name_formats' =>
  array (
    's f l' => 's f l',
    'f l' => 'f l',
    's l' => 's l',
    'l, s f' => 'l, s f',
    'l, f' => 'l, f',
    's l, f' => 's l, f',
    'l s f' => 'l s f',
    'l f s' => 'l f s',
  ),
  'passwordsetting' =>
  array (
    'SystemGeneratedPasswordON' => true,
    'generatepasswordtmpl' => 'db970f14-f868-a52f-7008-55d1d512ea64',
    'lostpasswordtmpl' => 'fb6805ac-f360-3665-1f1d-55d1d5bb6914',
    'forgotpasswordON' => true,
    'linkexpiration' => true,
    'linkexpirationtime' => 24,
    'linkexpirationtype' => 60,
    'systexpiration' => 1,
    'systexpirationtime' => 7,
    'systexpirationtype' => '0',
    'systexpirationlogin' => '',
    'minpwdlength' => 6,
    'oneupper' => false,
    'onelower' => false,
    'onenumber' => false,
  ),
  'portal_view' => 'single_user',
  'require_accounts' => true,
  'resource_management' =>
  array (
    'special_query_limit' => 50000,
    'special_query_modules' =>
    array (
      0 => 'Reports',
      1 => 'Export',
      2 => 'Import',
      3 => 'Administration',
      4 => 'Sync',
    ),
    'default_limit' => 1000,
  ),
  'rss_cache_time' => '10800',
  'save_query' => 'all',
  'search_wildcard_char' => '%',
  'search_wildcard_infront' => false,
  'securitysuite_additive' => true,
  'securitysuite_filter_user_list' => false,
  'securitysuite_inherit_assigned' => true,
  'securitysuite_inherit_creator' => true,
  'securitysuite_inherit_parent' => true,
  'securitysuite_popup_select' => false,
  'securitysuite_strict_rights' => false,
  'securitysuite_user_popup' => true,
  'securitysuite_user_role_precedence' => true,
  'securitysuite_version' => '6.5.17',
  'session_dir' => '',
  'showDetailData' => true,
  'showThemePicker' => true,
  'site_url' => 'http://suitecrm-single.webapp.dev.nwt.robotice.cz',
  'slow_query_time_msec' => '100',
  'sugar_version' => '6.5.20',
  'sugarbeet' => false,
  'suitecrm_version' => '7.3',
  'time_formats' =>
  array (
    'H:i' => '23:00',
    'h:ia' => '11:00pm',
    'h:iA' => '11:00PM',
    'h:i a' => '11:00 pm',
    'h:i A' => '11:00 PM',
    'H.i' => '23.00',
    'h.ia' => '11.00pm',
    'h.iA' => '11.00PM',
    'h.i a' => '11.00 pm',
    'h.i A' => '11.00 PM',
  ),
  'timef' => 'H:i',
  'tmp_dir' => 'cache/xml/',
  'tracker_max_display_length' => 15,
  'translation_string_prefix' => false,
  'unique_key' => '476390117819724f26d79e18cfa36d36',
  'upload_badext' =>
  array (
    0 => 'php',
    1 => 'php3',
    2 => 'php4',
    3 => 'php5',
    4 => 'pl',
    5 => 'cgi',
    6 => 'py',
    7 => 'asp',
    8 => 'cfm',
    9 => 'js',
    10 => 'vbs',
    11 => 'html',
    12 => 'htm',
    13 => 'phtml',
  ),
  'upload_dir' => 'upload/',
  'upload_maxsize' => 30000000,
  'use_common_ml_dir' => false,
  'use_real_names' => true,
  'vcal_time' => '2',
  'verify_client_ip' => true,
);
