variable "region" {
  default = "us-east-1"
}
variable "vpc_cidr" {
  default = "172.33.0.0/16"
}

variable "subnets" {
  type = list(string)
  default = ["webtier-public-subnet1","webtier-public-subnet2","dbtier-private-subnet1","dbtier-private-subnet2"]
}

variable "ec2_ami" {
  description = "AMI to Launch Instance"
  default =  "ami-0c3c7db9cf7af3078"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "key_name"{
  description = "Key pair for ec2 instance"
  default = "cisnge_infra_key_2"
}




