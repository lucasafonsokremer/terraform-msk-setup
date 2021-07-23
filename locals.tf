locals {
  msk_cluster_name = "${lower(var.common_tags["Product"])}-${lower(var.common_tags["CreatedBy"])}-${lower(var.common_tags["Environment"])}"
}
