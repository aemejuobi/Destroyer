terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.33.0"
    }

  }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_connect_instance" "practice_instance" {
    id = "0c1deacb-e3e4-4d18-817b-e57aaa3c0784"
    identity_management_type = "CONNECT_MANAGED"
    inbound_calls_enabled    = true
    outbound_calls_enabled   = true
    
# timeouts {
#     delete = "2m"
# }
}