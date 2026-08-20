variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "publicsubnet1_az" {
  description = "The availability zone for the first public subnet"
  type        = string
}

variable "publicsubnet2_az" {
  description = "The availability zone for the second public subnet"
  type        = string
}

variable "privatesubnet1_az" {
  description = "The availability zone for the first private subnet"
  type        = string
}

variable "privatesubnet2_az" {
  description = "The availability zone for the second private subnet"
  type        = string
}

variable "publicsubnet1_cidr" {
  description = "The CIDR block for the first public subnet"
  type        = string
}

variable "publicsubnet2_cidr" {
  description = "The CIDR block for the second public subnet"
  type        = string
}

variable "privatesubnet1_cidr" {
  description = "The CIDR block for the first private subnet"
  type        = string
}

variable "privatesubnet2_cidr" {
  description = "The CIDR block for the second private subnet"
  type        = string
}
