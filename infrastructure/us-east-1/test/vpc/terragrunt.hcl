terraform {
    source = "../../../../aws-module/vpc"
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path = find_in_parent_folders("env.hcl")
  expose = true
  merge_strategy = "no_merge" 
}

inputs = {
    env = include.env.locals.env
    vpc_cidr_block = "10.0.0.0/16"
    azs = ["us-east-1a", "us-east-1b"]
    private_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
    public_subnets =  ["10.0.64.0/19", "10.0.96.0/19"]
    private_subnet_tags = {
    "Environment" = include.env.locals.env
    "Terraform"  = "true"
  }

  public_subnet_tags = {
    "Environment" = include.env.locals.env
    "Terraform"  = "true"
  }
}
