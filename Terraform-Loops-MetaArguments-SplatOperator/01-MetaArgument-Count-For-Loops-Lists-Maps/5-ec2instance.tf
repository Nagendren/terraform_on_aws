# create ec2 instance
resource "aws_instance" "myec2vm" {
    ami = data.aws_ami.amzlinux2.id
    #instance_type = var.instance_type
    #instance_type = var.instance_type_list[0]
    instance_type = var.instance_type_map[dev]
    user_data = file("${path.module}/app1-install.sh")

  
}