terraform {
  backend "s3" {
    bucket = "muskan-devops-tf-state"
    key = "dev/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-lock"
    encrypt = true
  }
}

module "vpc" {
  source = "../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
}

module "ec2" {
  source    = "../modules/ec2"
  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.subnet_id
  key_name  = var.key_name
}

module "ecr" {
  source = "../modules/ecr"
}