resource "aws_kms_key" "key" {
  description             = "KMS key used on MSK Dev"
  deletion_window_in_days = 10
}
