variable "env_module" {
description = "Define Resource Environment for Module"
type = string
}

variable "ssh_key" {
description = "Define key for Module"
type = string
}

variable "instance_count" {
description = "No. of ec2 instance"
type = number
}

variable "public_ip_association_module" {
description = "Define public ip association for module"
type = bool
default = true
}

variable "bucket_name" {
description = "Bucket name for module"
type = string
}


variable "instance_type" {
description = "Define instance type for module"
type = string
}

variable "ec2_ami_module" {
description = "Define image for module"
type = string
}

variable "hash_key" {
  description = "Define hash key value for dynamodb"
  type = string
}



/*
variable "ec2_vpc_module" {
description = "AWS VPC For Module"
type = string
}


variable "vpc_subnet_module" {
description = "Define Subnet for Module"
type = number
}

variable "aws_igw_module" {
description = "Define igw for Module"
type = number
}

variable "Public_RT_Module" {
description = "Define Public RT for Module"
type = number
}

variable "Private_RT_Module" {
description = "Define Private RT for Module"
type = number
}

variable "Subnet_Public_RT_Module" {
description = "Define Subnet for Public RT Module"
type = string
}

variable "Subnet_Private_RT_Module" {
description = "Define Subnet for Private RT Module"
type = string
}

variable "security_group_module" {
description = "Define Security group for Module"
type = string
}

variable "ec2_instance_module" {
description = "Define instance for Module"
type = string
}
*/

