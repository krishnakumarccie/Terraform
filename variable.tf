# Creating Variables for different AWS Parameters

variable "ec2_instance_type" {
  default = "t3.micro"
  type    = string
}

variable "ec2_stoarge_size" {
  default = 20
  type    = number
}

variable "ec2_stoarge_type" {
  default = "gp3"
  type    = string
}

variable "ec2_public_ip" {
  default = true
  type    = bool
}

variable "ec2_private_ip" {
  default = false
  type    = bool
}

variable "ec2_instance_image" {
  default = "ami-019dad73e93fe94c2"
  type    = string
}

variable env {
  default = "Test"
  type    = string
}