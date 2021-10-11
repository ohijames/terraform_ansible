variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "demo-key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "demo-key.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-west-1 = "ami-0a8e758f5e873d1c1"
  }
}

variable "i-count" {
  default = 2
}

variable "instance_type" {
	type    = string
	default = "t2.micro"
}

locals {
  ssh_user = "ubuntu"
  private_key = "/Users/ohizzy/Documents/sky/nginx-terraform-ansible/terraform/demo-key"
}