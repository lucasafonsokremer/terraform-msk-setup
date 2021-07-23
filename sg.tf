resource "aws_security_group" "sg" {
  name        = "${local.msk_cluster_name}-sg"
  description = "Allow traffic on MSK Brokers and Zookeeper"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  dynamic "ingress" {
    for_each = var.sg_rule
    iterator = each
    content {
      description = each.value.description
      from_port   = each.value.port
      to_port     = each.value.port
      protocol    = each.value.protocol
      cidr_blocks = each.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, { Name = "${local.msk_cluster_name}-sg" })
}
