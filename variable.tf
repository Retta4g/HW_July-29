variable "instance_type" {
  default = "t2.micro"
}

variable "instance_name" {
  default = "HelloWorld"
}

variable "instance_ami" {
  default = "ami-01b799c439fd5516a"
}

variable "subnet_name" {
  default = "tf-example"
}

variable "vpc_name" {
  default = "tf-example"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with"
  type        = list(string)
  default     = ["sg-0a1234567890abcdef"]
}

variable "key_name" {
  description = "Name of the SSH key pair to use for the instance"
  type        = string
  default     = "mv-key"
}
