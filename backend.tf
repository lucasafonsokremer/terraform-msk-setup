terraform {
  backend "s3" {
    region         = "sa-east-1"
    bucket         = "yourbucket"
    key            = "yourpath/terraform.tfstate"
    profile        = "role"
    encrypt        = true
    dynamodb_table = "my_dynamo"
  }
}
