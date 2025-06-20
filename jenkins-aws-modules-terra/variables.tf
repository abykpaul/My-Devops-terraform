
variable "region" {
  type = string
}
variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "name" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "bucket_name" {
  type = string
}
variable "subnet_cidr" {
  type = string
}
variable "env" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}
