resource "aws_msk_scram_secret_association" "association" {
  cluster_arn     = aws_msk_cluster.msk.arn
  secret_arn_list = [aws_secretsmanager_secret.secret.arn]

  depends_on = [aws_secretsmanager_secret_version.version]
}

resource "aws_secretsmanager_secret" "secret" {
    name = "amazonmsk_${local.msk_cluster_name}"
}

resource "aws_secretsmanager_secret_version" "version" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = "jsonencode({ username = "user", password = "pass" })"
}

resource "aws_secretsmanager_secret_policy" "policy" {
  secret_arn = aws_secretsmanager_secret.secret.arn
  policy     = <<POLICY
{
  "Version" : "2012-10-17",
  "Statement" : [ {
    "Sid": "AWSKafkaResourcePolicy",
    "Effect" : "Allow",
    "Principal" : {
      "Service" : "kafka.amazonaws.com"
    },
    "Action" : "secretsmanager:getSecretValue",
    "Resource" : "${aws_secretsmanager_secret.example.arn}"
  } ]
}
POLICY
}
