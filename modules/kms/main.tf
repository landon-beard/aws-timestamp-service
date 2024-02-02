variable "key_description" {
  description = "Description for the KMS key"
}

resource "aws_kms_key" "mykey" {
  description             = var.key_description
  deletion_window_in_days = 10
}
