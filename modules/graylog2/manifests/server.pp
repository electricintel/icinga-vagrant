# == Class: graylog2::server
#
# === Authors
#
# Johannes Graf <graf@synyx.de>
#
# === Copyright
#
# Copyright 2014 synyx GmbH & Co. KG
#
class graylog2::server (
  $package_version = $graylog2::server::params::package_version,
  $service_ensure  = $graylog2::server::params::service_ensure,
  $service_enable  = $graylog2::server::params::service_enable,
  $config_file     = $graylog2::server::params::config_file,
  $daemon_username = $graylog2::server::params::daemon_username,

  $alert_check_interval                               = $graylog2::server::params::alert_check_interval,
  $allow_highlighting                                 = $graylog2::server::params::allow_highlighting,
  $allow_leading_wildcard_searches                    = $graylog2::server::params::allow_leading_wildcard_searches,
  $async_eventbus_processors                          = $graylog2::server::params::async_eventbus_processors,
  $collector_expiration_threshold                     = $graylog2::server::params::collector_expiration_threshold,
  $collector_inactive_threshold                       = $graylog2::server::params::collector_inactive_threshold,
  $command_wrapper                                    = $graylog2::server::params::command_wrapper,
  $dashboard_widget_default_cache_time                = $graylog2::server::params::dashboard_widget_default_cache_time,
  $dead_letters_enabled                               = $graylog2::server::params::dead_letters_enabled,
  $disable_index_optimization                         = $graylog2::server::params::disable_index_optimization,
  $disable_index_range_calculation                    = $graylog2::server::params::disable_index_range_calculation,
  $disable_sigar                                      = $graylog2::server::params::disable_sigar,
  $elasticsearch_analyzer                             = $graylog2::server::params::elasticsearch_analyzer,
  $elasticsearch_cluster_discovery_timeout            = $graylog2::server::params::elasticsearch_cluster_discovery_timeout,
  $elasticsearch_cluster_name                         = $graylog2::server::params::elasticsearch_cluster_name,
  $elasticsearch_config_file                          = $graylog2::server::params::elasticsearch_config_file,
  $elasticsearch_disable_version_check                = $graylog2::server::params::elasticsearch_disable_version_check,
  $elasticsearch_discovery_initial_state_timeout      = $graylog2::server::params::elasticsearch_discovery_initial_state_timeout,
  $elasticsearch_discovery_zen_ping_multicast_enabled = $graylog2::server::params::elasticsearch_discovery_zen_ping_multicast_enabled,
  $elasticsearch_discovery_zen_ping_unicast_hosts     = $graylog2::server::params::elasticsearch_discovery_zen_ping_unicast_hosts,
  $elasticsearch_http_enabled                         = $graylog2::server::params::elasticsearch_http_enabled,
  $elasticsearch_index_prefix                         = $graylog2::server::params::elasticsearch_index_prefix,
  $elasticsearch_max_docs_per_index                   = $graylog2::server::params::elasticsearch_max_docs_per_index,
  $elasticsearch_max_number_of_indices                = $graylog2::server::params::elasticsearch_max_number_of_indices,
  $elasticsearch_max_size_per_index                   = $graylog2::server::params::elasticsearch_max_size_per_index,
  $elasticsearch_max_time_per_index                   = $graylog2::server::params::elasticsearch_max_time_per_index,
  $elasticsearch_network_bind_host                    = $graylog2::server::params::elasticsearch_network_bind_host,
  $elasticsearch_network_host                         = $graylog2::server::params::elasticsearch_network_host,
  $elasticsearch_network_publish_host                 = $graylog2::server::params::elasticsearch_network_publish_host,
  $elasticsearch_node_data                            = $graylog2::server::params::elasticsearch_node_data,
  $elasticsearch_node_master                          = $graylog2::server::params::elasticsearch_node_master,
  $elasticsearch_node_name                            = $graylog2::server::params::elasticsearch_node_name,
  $elasticsearch_replicas                             = $graylog2::server::params::elasticsearch_replicas,
  $elasticsearch_shards                               = $graylog2::server::params::elasticsearch_shards,
  $elasticsearch_store_timestamps_as_doc_values       = $graylog2::server::params::elasticsearch_store_timestamps_as_doc_values,
  $elasticsearch_transport_tcp_port                   = $graylog2::server::params::elasticsearch_transport_tcp_port,
  $enable_metrics_collection                          = $graylog2::server::params::enable_metrics_collection,
  $extra_args                                         = $graylog2::server::params::extra_args,
  $gc_warning_threshold                               = $graylog2::server::params::gc_warning_threshold,
  $groovy_shell_enable                                = $graylog2::server::params::groovy_shell_enable,
  $groovy_shell_port                                  = $graylog2::server::params::groovy_shell_port,
  $http_connect_timeout                               = $graylog2::server::params::http_connect_timeout,
  $http_proxy_uri                                     = $graylog2::server::params::http_proxy_uri,
  $http_read_timeout                                  = $graylog2::server::params::http_read_timeout,
  $http_write_timeout                                 = $graylog2::server::params::http_write_timeout,
  $index_optimization_max_num_segments                = $graylog2::server::params::index_optimization_max_num_segments,
  $inputbuffer_processors                             = $graylog2::server::params::inputbuffer_processors,
  $inputbuffer_ring_size                              = $graylog2::server::params::inputbuffer_ring_size,
  $inputbuffer_wait_strategy                          = $graylog2::server::params::inputbuffer_wait_strategy,
  $is_master                                          = $graylog2::server::params::is_master,
  $java_opts                                          = $graylog2::server::params::java_opts,
  $lb_recognition_period_seconds                      = $graylog2::server::params::lb_recognition_period_seconds,
  $ldap_connection_timeout                            = $graylog2::server::params::ldap_connection_timeout,
  $message_journal_dir                                = $graylog2::server::params::message_journal_dir,
  $message_journal_enabled                            = $graylog2::server::params::message_journal_enabled,
  $message_journal_flush_age                          = $graylog2::server::params::message_journal_flush_age,
  $message_journal_flush_interval                     = $graylog2::server::params::message_journal_flush_interval,
  $message_journal_max_age                            = $graylog2::server::params::message_journal_max_age,
  $message_journal_max_size                           = $graylog2::server::params::message_journal_max_size,
  $message_journal_segment_age                        = $graylog2::server::params::message_journal_segment_age,
  $message_journal_segment_size                       = $graylog2::server::params::message_journal_segment_size,
  $mongodb_database                                   = $graylog2::server::params::mongodb_database,
  $mongodb_host                                       = $graylog2::server::params::mongodb_host,
  $mongodb_uri                                        = $graylog2::server::params::mongodb_uri,
  $mongodb_max_connections                            = $graylog2::server::params::mongodb_max_connections,
  $mongodb_password                                   = $graylog2::server::params::mongodb_password,
  $mongodb_port                                       = $graylog2::server::params::mongodb_port,
  $mongodb_replica_set                                = $graylog2::server::params::mongodb_replica_set,
  $mongodb_threads_allowed_to_block_multiplier        = $graylog2::server::params::mongodb_threads_allowed_to_block_multiplier,
  $mongodb_useauth                                    = $graylog2::server::params::mongodb_useauth,
  $mongodb_user                                       = $graylog2::server::params::mongodb_user,
  $node_id_file                                       = $graylog2::server::params::node_id_file,
  $no_retention                                       = $graylog2::server::params::no_retention,
  $output_batch_size                                  = $graylog2::server::params::output_batch_size,
  $outputbuffer_processor_keep_alive_time             = $graylog2::server::params::outputbuffer_processor_keep_alive_time,
  $outputbuffer_processors                            = $graylog2::server::params::outputbuffer_processors,
  $outputbuffer_processor_threads_core_pool_size      = $graylog2::server::params::outputbuffer_processor_threads_core_pool_size,
  $outputbuffer_processor_threads_max_pool_size       = $graylog2::server::params::outputbuffer_processor_threads_max_pool_size,
  $output_fault_count_threshold                       = $graylog2::server::params::output_fault_count_threshold,
  $output_fault_penalty_seconds                       = $graylog2::server::params::output_fault_penalty_seconds,
  $output_flush_interval                              = $graylog2::server::params::output_flush_interval,
  $output_module_timeout                              = $graylog2::server::params::output_module_timeout,
  $password_secret                                    = $graylog2::server::params::password_secret,
  $plugin_dir                                         = $graylog2::server::params::plugin_dir,
  $processbuffer_processors                           = $graylog2::server::params::processbuffer_processors,
  $processor_wait_strategy                            = $graylog2::server::params::processor_wait_strategy,
  $rest_enable_cors                                   = $graylog2::server::params::rest_enable_cors,
  $rest_enable_gzip                                   = $graylog2::server::params::rest_enable_gzip,
  $rest_enable_tls                                    = $graylog2::server::params::rest_enable_tls,
  $rest_listen_uri                                    = $graylog2::server::params::rest_listen_uri,
  $rest_max_chunk_size                                = $graylog2::server::params::rest_max_chunk_size,
  $rest_max_header_size                               = $graylog2::server::params::rest_max_header_size,
  $rest_max_initial_line_length                       = $graylog2::server::params::rest_max_initial_line_length,
  $rest_thread_pool_size                              = $graylog2::server::params::rest_thread_pool_size,
  $rest_tls_cert_file                                 = $graylog2::server::params::rest_tls_cert_file,
  $rest_tls_key_file                                  = $graylog2::server::params::rest_tls_key_file,
  $rest_tls_key_password                              = $graylog2::server::params::rest_tls_key_password,
  $rest_transport_uri                                 = $graylog2::server::params::rest_transport_uri,
  $rest_worker_threads_max_pool_size                  = $graylog2::server::params::rest_worker_threads_max_pool_size,
  $retention_strategy                                 = $graylog2::server::params::retention_strategy,
  $ring_size                                          = $graylog2::server::params::ring_size,
  $rotation_strategy                                  = $graylog2::server::params::rotation_strategy,
  $root_email                                         = $graylog2::server::params::root_email,
  $root_password_sha2                                 = $graylog2::server::params::root_password_sha2,
  $root_timezone                                      = $graylog2::server::params::root_timezone,
  $root_username                                      = $graylog2::server::params::root_username,
  $rules_file                                         = $graylog2::server::params::rules_file,
  $shutdown_timeout                                   = $graylog2::server::params::shutdown_timeout,
  $stale_master_timeout                               = $graylog2::server::params::stale_master_timeout,
  $stream_processing_max_faults                       = $graylog2::server::params::stream_processing_max_faults,
  $stream_processing_timeout                          = $graylog2::server::params::stream_processing_timeout,
  $transport_email_auth_password                      = $graylog2::server::params::transport_email_auth_password,
  $transport_email_auth_username                      = $graylog2::server::params::transport_email_auth_username,
  $transport_email_enabled                            = $graylog2::server::params::transport_email_enabled,
  $transport_email_from_email                         = $graylog2::server::params::transport_email_from_email,
  $transport_email_hostname                           = $graylog2::server::params::transport_email_hostname,
  $transport_email_port                               = $graylog2::server::params::transport_email_port,
  $transport_email_subject_prefix                     = $graylog2::server::params::transport_email_subject_prefix,
  $transport_email_use_auth                           = $graylog2::server::params::transport_email_use_auth,
  $transport_email_use_ssl                            = $graylog2::server::params::transport_email_use_ssl,
  $transport_email_use_tls                            = $graylog2::server::params::transport_email_use_tls,
  $transport_email_web_interface_url                  = $graylog2::server::params::transport_email_web_interface_url,
  $udp_recvbuffer_sizes                               = $graylog2::server::params::udp_recvbuffer_sizes,
  $usage_statistics_cache_timeout                     = $graylog2::server::params::usage_statistics_cache_timeout,
  $usage_statistics_dir                               = $graylog2::server::params::usage_statistics_dir,
  $usage_statistics_enabled                           = $graylog2::server::params::usage_statistics_enabled,
  $usage_statistics_gzip_enabled                      = $graylog2::server::params::usage_statistics_gzip_enabled,
  $usage_statistics_initial_delay                     = $graylog2::server::params::usage_statistics_initial_delay,
  $usage_statistics_max_queue_size                    = $graylog2::server::params::usage_statistics_max_queue_size,
  $usage_statistics_offline_mode                      = $graylog2::server::params::usage_statistics_offline_mode,
  $usage_statistics_report_interval                   = $graylog2::server::params::usage_statistics_report_interval,
  $usage_statistics_url                               = $graylog2::server::params::usage_statistics_url,
  $versionchecks                                      = $graylog2::server::params::versionchecks,
  $versionchecks_uri                                  = $graylog2::server::params::versionchecks_uri,
) inherits graylog2::server::params {

  anchor {'graylog2::server::start': }->
  class {'graylog2::server::package':
    package => $graylog2::server::params::package_name,
    version => $package_version,
  } ->
  class {'graylog2::server::configure':
    config_file     => $config_file,
    daemon_username => $daemon_username,

    alert_check_interval                               => $alert_check_interval,
    allow_highlighting                                 => $allow_highlighting,
    allow_leading_wildcard_searches                    => $allow_leading_wildcard_searches,
    async_eventbus_processors                          => $async_eventbus_processors,
    collector_expiration_threshold                     => $collector_expiration_threshold,
    collector_inactive_threshold                       => $collector_inactive_threshold,
    command_wrapper                                    => $command_wrapper,
    dashboard_widget_default_cache_time                => $dashboard_widget_default_cache_time,
    dead_letters_enabled                               => $dead_letters_enabled,
    disable_index_optimization                         => $disable_index_optimization,
    disable_index_range_calculation                    => $disable_index_range_calculation,
    disable_sigar                                      => $disable_sigar,
    elasticsearch_analyzer                             => $elasticsearch_analyzer,
    elasticsearch_cluster_discovery_timeout            => $elasticsearch_cluster_discovery_timeout,
    elasticsearch_cluster_name                         => $elasticsearch_cluster_name,
    elasticsearch_config_file                          => $elasticsearch_config_file,
    elasticsearch_disable_version_check                => $elasticsearch_disable_version_check,
    elasticsearch_discovery_initial_state_timeout      => $elasticsearch_discovery_initial_state_timeout,
    elasticsearch_discovery_zen_ping_multicast_enabled => $elasticsearch_discovery_zen_ping_multicast_enabled,
    elasticsearch_discovery_zen_ping_unicast_hosts     => $elasticsearch_discovery_zen_ping_unicast_hosts,
    elasticsearch_http_enabled                         => $elasticsearch_http_enabled,
    elasticsearch_index_prefix                         => $elasticsearch_index_prefix,
    elasticsearch_max_docs_per_index                   => $elasticsearch_max_docs_per_index,
    elasticsearch_max_number_of_indices                => $elasticsearch_max_number_of_indices,
    elasticsearch_max_size_per_index                   => $elasticsearch_max_size_per_index,
    elasticsearch_max_time_per_index                   => $elasticsearch_max_time_per_index,
    elasticsearch_network_bind_host                    => $elasticsearch_network_bind_host,
    elasticsearch_network_host                         => $elasticsearch_network_host,
    elasticsearch_network_publish_host                 => $elasticsearch_network_publish_host,
    elasticsearch_node_data                            => $elasticsearch_node_data,
    elasticsearch_node_master                          => $elasticsearch_node_master,
    elasticsearch_node_name                            => $elasticsearch_node_name,
    elasticsearch_replicas                             => $elasticsearch_replicas,
    elasticsearch_shards                               => $elasticsearch_shards,
    elasticsearch_store_timestamps_as_doc_values       => $elasticsearch_store_timestamps_as_doc_values,
    elasticsearch_transport_tcp_port                   => $elasticsearch_transport_tcp_port,
    enable_metrics_collection                          => $enable_metrics_collection,
    extra_args                                         => $extra_args,
    gc_warning_threshold                               => $gc_warning_threshold,
    groovy_shell_enable                                => $groovy_shell_enable,
    groovy_shell_port                                  => $groovy_shell_port,
    http_connect_timeout                               => $http_connect_timeout,
    http_proxy_uri                                     => $http_proxy_uri,
    http_read_timeout                                  => $http_read_timeout,
    http_write_timeout                                 => $http_write_timeout,
    index_optimization_max_num_segments                => $index_optimization_max_num_segments,
    inputbuffer_processors                             => $inputbuffer_processors,
    inputbuffer_ring_size                              => $inputbuffer_ring_size,
    inputbuffer_wait_strategy                          => $inputbuffer_wait_strategy,
    is_master                                          => $is_master,
    java_opts                                          => $java_opts,
    lb_recognition_period_seconds                      => $lb_recognition_period_seconds,
    ldap_connection_timeout                            => $ldap_connection_timeout,
    message_journal_dir                                => $message_journal_dir,
    message_journal_enabled                            => $message_journal_enabled,
    message_journal_flush_age                          => $message_journal_flush_age,
    message_journal_flush_interval                     => $message_journal_flush_interval,
    message_journal_max_age                            => $message_journal_max_age,
    message_journal_max_size                           => $message_journal_max_size,
    message_journal_segment_age                        => $message_journal_segment_age,
    message_journal_segment_size                       => $message_journal_segment_size,
    mongodb_database                                   => $mongodb_database,
    mongodb_host                                       => $mongodb_host,
    mongodb_uri                                        => $mongodb_uri,
    mongodb_max_connections                            => $mongodb_max_connections,
    mongodb_password                                   => $mongodb_password,
    mongodb_replica_set                                => $mongodb_replica_set,
    mongodb_port                                       => $mongodb_port,
    mongodb_threads_allowed_to_block_multiplier        => $mongodb_threads_allowed_to_block_multiplier,
    mongodb_useauth                                    => $mongodb_useauth,
    mongodb_user                                       => $mongodb_user,
    node_id_file                                       => $node_id_file,
    no_retention                                       => $no_retention,
    output_batch_size                                  => $output_batch_size,
    outputbuffer_processor_keep_alive_time             => $outputbuffer_processor_keep_alive_time,
    outputbuffer_processors                            => $outputbuffer_processors,
    outputbuffer_processor_threads_core_pool_size      => $outputbuffer_processor_threads_core_pool_size,
    outputbuffer_processor_threads_max_pool_size       => $outputbuffer_processor_threads_max_pool_size,
    output_fault_count_threshold                       => $output_fault_count_threshold,
    output_fault_penalty_seconds                       => $output_fault_penalty_seconds,
    output_flush_interval                              => $output_flush_interval,
    output_module_timeout                              => $output_module_timeout,
    password_secret                                    => $password_secret,
    plugin_dir                                         => $plugin_dir,
    processbuffer_processors                           => $processbuffer_processors,
    processor_wait_strategy                            => $processor_wait_strategy,
    rest_enable_cors                                   => $rest_enable_cors,
    rest_enable_gzip                                   => $rest_enable_gzip,
    rest_enable_tls                                    => $rest_enable_tls,
    rest_listen_uri                                    => $rest_listen_uri,
    rest_max_chunk_size                                => $rest_max_chunk_size,
    rest_max_header_size                               => $rest_max_header_size,
    rest_max_initial_line_length                       => $rest_max_initial_line_length,
    rest_thread_pool_size                              => $rest_thread_pool_size,
    rest_tls_cert_file                                 => $rest_tls_cert_file,
    rest_tls_key_file                                  => $rest_tls_key_file,
    rest_tls_key_password                              => $rest_tls_key_password,
    rest_transport_uri                                 => $rest_transport_uri,
    rest_worker_threads_max_pool_size                  => $rest_worker_threads_max_pool_size,
    retention_strategy                                 => $retention_strategy,
    ring_size                                          => $ring_size,
    rotation_strategy                                  => $rotation_strategy,
    root_email                                         => $root_email,
    root_password_sha2                                 => $root_password_sha2,
    root_timezone                                      => $root_timezone,
    root_username                                      => $root_username,
    rules_file                                         => $rules_file,
    shutdown_timeout                                   => $shutdown_timeout,
    stale_master_timeout                               => $stale_master_timeout,
    stream_processing_max_faults                       => $stream_processing_max_faults,
    stream_processing_timeout                          => $stream_processing_timeout,
    transport_email_auth_password                      => $transport_email_auth_password,
    transport_email_auth_username                      => $transport_email_auth_username,
    transport_email_enabled                            => $transport_email_enabled,
    transport_email_from_email                         => $transport_email_from_email,
    transport_email_hostname                           => $transport_email_hostname,
    transport_email_port                               => $transport_email_port,
    transport_email_subject_prefix                     => $transport_email_subject_prefix,
    transport_email_use_auth                           => $transport_email_use_auth,
    transport_email_use_ssl                            => $transport_email_use_ssl,
    transport_email_use_tls                            => $transport_email_use_tls,
    transport_email_web_interface_url                  => $transport_email_web_interface_url,
    udp_recvbuffer_sizes                               => $udp_recvbuffer_sizes,
    usage_statistics_cache_timeout                     => $usage_statistics_cache_timeout,
    usage_statistics_dir                               => $usage_statistics_dir,
    usage_statistics_enabled                           => $usage_statistics_enabled,
    usage_statistics_gzip_enabled                      => $usage_statistics_gzip_enabled,
    usage_statistics_initial_delay                     => $usage_statistics_initial_delay,
    usage_statistics_max_queue_size                    => $usage_statistics_max_queue_size,
    usage_statistics_offline_mode                      => $usage_statistics_offline_mode,
    usage_statistics_report_interval                   => $usage_statistics_report_interval,
    usage_statistics_url                               => $usage_statistics_url,
    versionchecks                                      => $versionchecks,
    versionchecks_uri                                  => $versionchecks_uri,
  }~>
  class {'graylog2::server::service':
    service_name   => $graylog2::server::params::service_name,
    service_ensure => $service_ensure,
    service_enable => $service_enable,
  } ->
  anchor {'graylog2::server::end': }

}