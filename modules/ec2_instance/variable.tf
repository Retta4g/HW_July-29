variable "instance_type" {
  description = "Type of instance to launch"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the instance"
  type        = string
}

variable "instance_ami" {
  description = "AMI ID to launch"
  type        = string
}

variable "network_interface_id" {
  description = "Network interface ID to attach to the instance"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair to use for the instance"
  type        = string
}

