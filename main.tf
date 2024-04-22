resource "aws_dynamodb_table" "example" {
  name           = "example-13281"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.kms-key.arn
  }
}
resource "aws_dynamodb_table_replica" "example" {
  global_table_arn = aws_dynamodb_table.example.arn
  kms_key_arn      = aws_kms_key.kms-key.arn
}
resource "aws_kms_key" "kms-key" {
  description             = "KMS key 1"
  deletion_window_in_days = 7
}
