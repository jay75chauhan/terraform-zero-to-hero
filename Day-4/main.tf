provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "jayec2" {
  instance_type = "t2.micro"
  ami = "ami-08e5424edfe926b43" # change this
  # subnet_id = "subnet-019ea91ed9b5252e7" # change this
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "jay-s3-demo-tf" # change this
  
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}