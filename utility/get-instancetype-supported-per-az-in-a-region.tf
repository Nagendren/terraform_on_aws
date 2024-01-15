# Get List of Availability Zones in a Specific Region
# Region is set in versions.tf in Provider Block
# Datasource-1
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# Check if that respective Instance Type is supported in that Specific Region in list of availability Zones
# Get the List of Availability Zones in a Particular region where that respective Instance Type is supported
# Datasource-2

data "aws_ec2_instance_type_offerings" "my_ins_type" {
    for_each = toset(data.aws_availability_zones.my_azones.names)
    filter {
    name   = "instance-type"
    values = ["t3.micro"]
    }
    filter {
        name   = "location"
        values = [each.key]
    }
    location_type = "availability-zone"
  
}

#output test

/*output "list_of_azones" {
    value = data.aws_ec2_instance_type_offerings.my1-ins-type
  
}*/

output "supported_regions_v1" {
    value = {for k, v in data.aws_ec2_instance_type_offerings.my_ins_type: k => v.instance_types}
  
}

# Output-2
# Filtered Output: Exclude Unsupported Availability Zones
output "supported_regions_v2" {
    value = {
    for k, val in data.aws_ec2_instance_type_offerings.my_ins_type: 
    k => val.instance_types if length(val.instance_types) != 0
    }
  
}

# Output-3
# Filtered Output: with Keys Function - Which gets keys from a Map
# This will return the list of availability zones supported for a instance type
output "supported_regions_v3" {
  value = keys({ 
    for k, val in data.aws_ec2_instance_type_offerings.my_ins_type:
  
    k => val.instance_types if length(val.instance_types) != 0
  })
}