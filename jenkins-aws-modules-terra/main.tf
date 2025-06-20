module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "./modules/iam"
  env    = var.env
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "cloudwatch" {
  source      = "./modules/cloudwatch"
  instance_id = module.ec2.instance_id
}

module "ec2" {
  source               = "./modules/ec2"
  ami                  = var.ami
  instance_type        = var.instance_type
  name                 = var.name
  sg_id                = module.sg.sg_id
  subnet_id            = module.vpc.subnet_id
  iam_instance_profile = module.iam.instance_profile
}

