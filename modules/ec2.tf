resource "aws_security_group" "instance_sg" {
  name = "Demo-SG"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_groups_ids

  user_data                   = <<-EOF
    #!/bin/bash
        echo "Just a demonstration. Love busybox." > index.html
        nohup busybox httpd -f -p 8080 &
        EOF
  user_data_replace_on_change = true

  tags = {
    Name = "Just-a-Demonstration"
  }
}

