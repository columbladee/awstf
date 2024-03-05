terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "instance" {
    name = "Demo-Instance"

    ingress {
        from_port 8080
        to_port 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
}

resource "aws_instance" "app_server" {
  ami           = "ami-05fb0b8c1424f266b"
  instance_type = "t2.micro"
  vpc_security_group_id = "sg-0ad073e5f8f6599d7"

  user_data == <<-EOF
    #!/bin/bash
        echo "Just a demonstration. Love busybox." > index.html
        nohup busybox httpd -f -p 8080 &
        EOF
    user_data_replace_on_change = true

  tags = {
    Name = "Just-a-Demonstration"
  }
}

