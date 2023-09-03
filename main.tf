terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
     
    }
  }
}

# Configure the AWS Provider
provider "aws" {
    region =  var.region
    profile  = var.profile
}
resource "aws_instance" "myec2" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.app_ami.id
  subnet_id              = "subnet-04f5e9d84c3aaab37"
  vpc_security_group_ids = ["sg-0eb420b594579783c"]
  
  
  tags = {
    Name = "import"
  }

}
resource "aws_instance" "myec2-poll" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.app_ami.id
  subnet_id              = "subnet-04f5e9d84c3aaab37"
  vpc_security_group_ids = ["sg-0eb420b594579783c"]
  
  
  tags = {
    Name = "Poll"
  }

}

data "aws_ami" "app_ami" {
    owners      = ["amazon"]
    most_recent = true


  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10**"]
  }
}
