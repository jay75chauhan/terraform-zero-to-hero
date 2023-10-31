provider "aws" {
  region = "ap-south-1"
}


import {
  id = "i-092d2e9ae3cb5e508"
  to = aws_instance.ec2
}

