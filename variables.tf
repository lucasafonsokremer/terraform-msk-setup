variable "region" {
  description = "Region in which resources will be provisioned"
  type        = string
  default     = "sa-east-1"
}

variable "profile" {
  description = "Profile containing AWS authentication credentials"
  type        = string
  default     = "role"
}

variable "common_tags" {
  description = "Commun TAGs associed with resources"
  type        = map(string)
  default = {
    Environment = "test"
    Product     = "msk"
    Provisioned = "terraform"
    CreatedBy   = "companyname"
  }
}

# https://docs.aws.amazon.com/msk/latest/developerguide/supported-kafka-versions.html#2.7.1
variable "msk_kafka_version" {
  description = "MSK kafka version"
  type        = string
  default     = "2.7.1"
}

variable "msk_number_nodes" {
  description = "MSK number of broker nodes"
  type        = number
  default     = 3
}

variable "msk_instance_type" {
  description = "Instance type used to provision brokers"
  type        = string
  default     = "kafka.t3.small"
}

variable "msk_ebs_volume_size" {
  description = "EBS volume size used to broker storage"
  type        = number
  default     = 200
}

variable "sg_rule" {
  description = "Ports allowed to incoming traffic to MSK"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      description = "Allow access SSH",
      from_port   = 22,
      to_port     = 22,
      protocol    = "tcp",
      cidr_blocks = ["YOUR NETWORK"],
      }, {
      description = "Apache Zookeeper nodes",
      from_port   = 2181,
      to_port     = 2181,
      protocol    = "tcp",
      cidr_blocks = ["YOUR NETWORK"],
      }, {
      description = "To communicate with a cluster by using TLS encryption",
      from_port   = 9094,
      to_port     = 9094,
      protocol    = "tcp",
      cidr_blocks = ["YOUR NETWORK"],
      }, {
      description = "To communicate with with a cluster in plaintext",
      from_port   = 9092,
      to_port     = 9092,
      protocol    = "tcp",
      cidr_blocks = ["YOUR NETWORK"],
    }
  ]
}

variable "secrets_manager_value" {
  description = "Simple string value containing user and password to connecting on MSK"
  type = map(string)
  default = {
    username = ""
    password = ""
  }
}
