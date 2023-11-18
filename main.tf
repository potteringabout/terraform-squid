module "squid_ecr" {
  source   = "./modules/ecr"
  ecr_name = "${var.project}-squid"
  kms_key  = aws_kms_key.key.arn
}


resource "aws_kms_key" "key" {
  description             = "ECR Key"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}
