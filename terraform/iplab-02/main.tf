# The block below configures Terraform to use the 'remote' backend with Terraform Cloud.
# For more information, see https://www.terraform.io/docs/backends/types/remote.html
# Terraform template to create a vpc, subnets, route tables, security groups, nat gateway, internet gateway, EC2 instances

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.65.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = ">= 1.2.0"
  cloud {
    organization = "dani3lyg"

    workspaces {
      name = "aws-testing-pipeline"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
# resource "aws_default_network_acl" "default" {
#   default_network_acl_id = aws_vpc.mainvpc.default_network_acl_id

#   ingress {
#     protocol   = -1
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 0
#     to_port    = 0
#   }

#   egress {
#     protocol   = -1
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 0
#     to_port    = 0
#   }
# }