module "networking" {
  source                = "./networking"
  vpc_cider             = var.aws_vpc_cider
  public_subnet_a_cider = var.public_subnet_a_cider
  public_subnet_b_cider = var.public_subnet_b_cider
  application_port      = var.application_port
}