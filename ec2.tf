
provider "aws" {
  region     = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = "ami-0521cb2d60cfbb1a6"
  instance_type = "t2.nano"

  tags = {
    Name = "Black-Server"
  }
}
