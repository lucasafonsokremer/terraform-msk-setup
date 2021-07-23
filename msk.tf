resource "aws_msk_cluster" "msk" {
  cluster_name           = local.msk_cluster_name
  kafka_version          = var.msk_kafka_version
  number_of_broker_nodes = var.msk_number_nodes

  broker_node_group_info {
    instance_type   = var.msk_instance_type
    ebs_volume_size = var.msk_ebs_volume_size
    client_subnets = [
      data.terraform_remote_state.vpc.outputs.private_subnets[0].id,
      data.terraform_remote_state.vpc.outputs.private_subnets[1].id,
      data.terraform_remote_state.vpc.outputs.private_subnets[2].id
    ]

    security_groups = [aws_security_group.sg.id]
  }

  client_authentication {
    sasl {
      scram = true
    }
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.key.arn
  }

  open_monitoring {
    prometheus {
      jmx_exporter {
        enabled_in_broker = true
      }
      node_exporter {
        enabled_in_broker = true
      }
    }
  }

  tags = merge(var.common_tags, { Name = local.msk_cluster_name })
}