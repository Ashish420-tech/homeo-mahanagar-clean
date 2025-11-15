provider "aws" {
  region = var.region
}

resource "aws_security_group" "homeo_sg" {
  name        = "homeo-app-sg"
  description = "Allow SSH (restricted) and app port 5000"
  vpc_id      = var.vpc_id

  ingress {
    description = "App port"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from admin IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_ip_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "homeo-app-sg"
  }
}

resource "aws_instance" "homeo" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.homeo_sg.id]
  subnet_id              = var.subnet_id

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io python3-pip
              usermod -aG docker ubuntu || true
              systemctl enable --now docker
              # optional: pull image from ECR or build from repo
              EOF

  tags = {
    Name = "homeo-app-instance"
  }
}

output "instance_public_ip" {
  value = aws_instance.homeo.public_ip
}

output "security_group_id" {
  value = aws_security_group.homeo_sg.id
}
