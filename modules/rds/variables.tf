variable "vpc_id" {}
//variable "private_subnet_id" {}
variable "ec2_sg_id" {}
variable "db_username" {}
variable "db_password" {}
variable "private_subnet_ids" {
  type = list(string)
}

