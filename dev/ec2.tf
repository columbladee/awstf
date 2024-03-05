module "ec2" {
  source              = "../modules/ec2"
  name                = "web"
  instance_type       = var.instance_type
  ami                 = var.ami
  security_groups_ids = var.security_groups_ids
}