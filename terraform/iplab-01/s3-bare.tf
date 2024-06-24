# Terraform template to create a basic s3 bucket

resource "aws_s3_bucket" "iplab" {
  bucket = "ipbucket-10000"

  tags = {
    Name        = "iplab"
    Environment = "Dev"
  }
}
