variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "Ubuntu AMI ID for the region"
  type        = string
  default     = "ami-0de53d8956e8dcf80" # example: update per region
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "EC2 keypair name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to deploy into"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  type        = string
}

variable "admin_ip_cidr" {
  description = "Your public IP in CIDR (e.g., 203.0.113.5/32) for SSH access"
  type        = string
}
