provider "aws" {
  region = "ap-south-1"
}

provider "vault" {
  address = "http://***"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "***"
      secret_id = "***"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "***" // change it according to your mount
  name  = "***" // change it according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-08e5424edfe926b43"
  instance_type = "t2.micro"

  tags = {
    # Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["***"]
  }
}
