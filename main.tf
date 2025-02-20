module "network" { 
  source              = "./modules/network"
  vpc_cidr            = "10.0.0.0/16"
  vpc_name            = "global-vpc"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
}

module "compute" {
  source            = "./modules/compute"
  ami               = "ami-03a725ae7d906005d"
  instance_type     = "t2.micro"
  key_name          = "tutorial-key"
  subnet_id         = module.network.public_subnet_ids[0]
  security_group_id = module.security.security_group_id
}