
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR values"

}

variable "vpc2_cidr" {
  type        = string
  description = "VPC CIDR values"

}


variable "env" {
  type        = string
  description = "VPC CIDR values"

}
variable "vpc_name" {
}

variable "vpc2_name" {
}
variable "public_subnet1_cidr" {
  type = string
}
variable "public_subnet2_cidr" {
  type = string
}
variable "private_subnet1_cidr" {
  type = string
}
variable "private_subnet2_cidr" {
  type = string
}

variable "ami" {
}
variable "availability_zone" {
}
variable "instance_type" {
}
variable "key_name" {
}