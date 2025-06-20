resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}
resource "aws_subnet" "mysubterra" {
  cidr_block        = var.subnet_cidr
  vpc_id            = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.available.names[0]
}
data "aws_availability_zones" "available" {}
