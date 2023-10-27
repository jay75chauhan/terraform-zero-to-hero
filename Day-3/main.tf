provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-08e5424edfe926b43" # replace this
  instance_type_value = "t2.micro"
  subnet_id_value = "subnet-08a9a27f9e3cf6fe4" 
  key_name = "nathiyo"# replace this
}