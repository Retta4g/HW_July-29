resource "aws_instance" "web" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  network_interface {
    network_interface_id = var.network_interface_id
    device_index         = 0
  }

  key_name = var.key_name

  tags = {
    Name = var.instance_name
  }
}

