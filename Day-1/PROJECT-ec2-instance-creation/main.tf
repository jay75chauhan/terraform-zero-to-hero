provider "aws" {
    region = "ap-south-1"  # Set your desired AWS region
}

resource "aws_instance" "tf" {
    ami           = "ami-08e5424edfe926b43"  # Specify an appropriate AMI ID
    instance_type = "t2.micro"
    subnet_id = "subnet-08a9a27f9e3cf6fe4"
    key_name = "nathiyo"
}


output "public_ip" {
    value = aws_instance.tf.public_ip
}