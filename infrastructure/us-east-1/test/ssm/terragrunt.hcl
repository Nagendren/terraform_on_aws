terraform {
    source = "../../../../aws-module/ssm"
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
    parameter_name = "example/params"
    parameter_value = "terragrunt_test"
}