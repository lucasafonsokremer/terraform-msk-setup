output "msk_cluster_arn" {
  description = "The ARN of MSK service"
  value = aws_msk_cluster.msk.arn
}

output "msk_boorstrap_brokers" {
  description = "A comma separated list of one or more hostname:port pairs to use to connect to the Apache Zookeeper cluster"
  value       = aws_msk_cluster.msk.bootstrap_brokers
}

output "msk_zookeeper_connect_string" {
  description = "A comma separated list of one or more hostname:port pairs to use to connect to the Apache Zookeeper cluster"
  value       = aws_msk_cluster.msk.zookeeper_connect_string
}

output "msk_sasl_scram" {
  description = "One on more DNS names (or IP address) and SASL SCRAM port pairs."
  value = aws_msk_cluster.msk.bootstrap_brokers_sasl_scram
}