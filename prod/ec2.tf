module "ec2" {
  source              = "../modules/ec2"
  name                = "web"
  instance_type       = "t2.micro"
  ami                 = "ami-0c55b159cbfafe1f0"
  security_groups_ids = [aws_security_group.instance_sg.id]
}