variable "aws-region" {
  type    = string
  default = "us-east-1"
}

variable "aws-access-key-id" {
  type      = string
  sensitive = true
}

variable "aws-secret-access-key" {
  type      = string
  sensitive = true
}

variable "availability-zone" {
  type    = string
  default = "us-east-1a"
}

variable "instance-type" {
  type    = string
  default = "t2.micro"
}

variable "ami" {
  type    = string
  default = "ami-005fc0f236362e99f"
}

variable "key-pair-name" {
  type    = string
  default = "web-key-pair"
}

variable "ssh-public-key" {
  type = string
}
