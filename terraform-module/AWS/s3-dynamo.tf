
# S3 bucket creation
resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.env_module}-krishnas3bucket-module"

  tags = {
    Name = "${var.env_module}-krishnas3bucket-module"
    Environment = var.env_module
  }

}

#==================================
# Dynamo Backend Creation

resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "${var.env_module}-krishnas3dynamo-module"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }

  tags = {
    Name        = "${var.env_module}-krishnas3dynamo-module"
    Environment = var.env_module
  }
}

