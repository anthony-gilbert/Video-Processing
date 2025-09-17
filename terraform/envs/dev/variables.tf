variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_name" {
  type    = string
  default = "default_vpc"
}

variable "private_subnets" {
  type = map(number)
  default = {
    "private_subnet_1" = 1
  }
}

variable "public_subnets" {
  type = map(number)
  default = {
    "public_subnet_1" = 1
  }
}