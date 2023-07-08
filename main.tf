terraform {
  backend "s3" {
    bucket = "my-terraform-bucket-blog"   # Replace with your S3 bucket name
    key    = "terraform.tfstate"
    region = "ap-south-1"          # Replace with your desired AWS region
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"   # Replace with your desired AWS region
}

resource "aws_instance" "app_server" {
  ami           = "ami-0f5ee92e2d63afc18"   # Replace with your desired AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "AppServerInstance"
  }
}