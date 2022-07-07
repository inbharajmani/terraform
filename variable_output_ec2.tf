terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-south-1"
}

variable "instance_name" {
default = "TF_built_this_instance"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08df646e18b182346"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

output "instance_public_ip" {
value = aws_instance.app_server.public_ip
}

output "instance_id" {
value = aws_instance.app_server.id
}
