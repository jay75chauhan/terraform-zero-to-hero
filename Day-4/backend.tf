terraform {
  backend "s3" {
    bucket         = "jay-s3-demo-tf" # change this
    key            = "jay/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}