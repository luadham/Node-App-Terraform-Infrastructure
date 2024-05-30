resource "aws_s3_bucket" "lb-access-logs" {
  bucket = "lb-access-log-${random_id.random_number.hex}"
  tags = {
    Name = "LB-Access-Log"
  }
}