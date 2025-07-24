variable "ami_id" {}
variable "instance_type" {}
variable "vpc_id" {}
variable "private_subnet_id" {}
variable "key_name" {}


variable "iam_instance_profile" {
  description = "IAM instance profile name to attach to EC2 instance"
  type        = string
  default     = null
}