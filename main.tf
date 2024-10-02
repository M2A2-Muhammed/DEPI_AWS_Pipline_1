terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "depi-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region     = var.aws-region
  access_key = var.aws-access-key-id
  secret_key = var.aws-secret-access-key
}

# # Create a key pair
# resource "aws_key_pair" "web_key_pair" {
#   key_name   = var.key-pair-name
#   public_key = var.ssh-public-key # Replace with the path to your public key file
# }

# resource "aws_security_group" "web_sg" {
#   name        = "web_sg"
#   description = "Allow SSH and HTTP traffic"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere (consider restricting this for production)
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
#   }

#   ingress {
#     from_port   = 9090
#     to_port     = 9090
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] # Allow Prometheus
#   }

#   ingress {
#     from_port   = 3000
#     to_port     = 3000
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] # Allow Grafana
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1" # Allow all outbound traffic
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_instance" "web-server" {
#   ami                    = var.ami
#   instance_type          = var.instance-type
#   key_name               = aws_key_pair.web_key_pair.key_name
#   vpc_security_group_ids = [aws_security_group.web_sg.id]

#   # User data script to install Apache
#   user_data = <<-EOF
#                   #!/bin/bash

#                   # Install SSH and Apache
#                   sudo apt update
#                   sudo apt install ssh apache2 -y

#                   # Start services
#                   sudo systemctl start sshd apache2
#               EOF

#   tags = {
#     Name = "Web-Server"
#   }
# }



# output "instance_ip" {
#   value = aws_instance.web-server.public_ip
# }
