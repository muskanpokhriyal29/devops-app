resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

  resource "aws_instance" "app_server" {
    ami           = "ami-0c42fad2ea005202d"
    instance_type = "t2.small"
    subnet_id     = var.subnet_id
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    key_name = var.key_name

    user_data = <<-EOF
              #!/bin/bash
              yum install docker -y
              service docker start
              usermod -aG docker ec2-user
              EOF
  }
