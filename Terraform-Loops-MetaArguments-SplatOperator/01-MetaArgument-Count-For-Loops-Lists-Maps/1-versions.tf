terraform {
  required_version = ">= 1.7"
  required_providers {
    aws = {
        source = "hashicrop/aws"
        version = ">= 5.0"
    }
  }
}

provider "aws" {
      
}

/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/