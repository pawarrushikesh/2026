resource "aws_key_pair" "server_key" {
  key_name   = "two-server-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzgx7cJkA4totnf1Hfyez8Xb73UWijZjQTw2cFwQs38V9AVfhA5SDKS6AM2IpHhOQCi2tQEnlaGUgEgIQoq37HBXFtI0Ap4L1UBdmbiqhD4SxmEo0+lyy/Kd3OhDm06NxzxQAEO+A6DaffKvvoehfQU2ZVo8Q4Tj3DpbzIPCe4jQx1/hSHIo7Hj/jIRTbSF98tmBP5zb9IuiXQaDfJx/ALkdKQkPL0jBhBgJMG+cgY5dkP33DBrQdVAYS2tDG4bXg191ItNzd0gmYtpI0TtBFrVo+ZMefKHmfFy/GJYq1rikQ1PLaq+r3nP8m/j7w8co6V66Jo9Z9n48wniZJuUQu3GSutAk/D3unHiDYTK2ZY9fRKn/Uch8zPh7cEBXJZqBSSIxFppU6UMcH+q0nqhttex/2U1k6YdhtEUTbQp0SVCtSnW/czBOS24tgtWryjKWVf1l1u01rZr+wAA/orXpSAfNi7So4FpE6tSvw6Fyu94Tqtl+Xc4ZQqm49iLR9p+90= ansible-user-key"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "server_sg" {
  name        = "two-server-sg"
  description = "Allow SSH access for web and db servers"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "two-server-sg"
  }
}

resource "aws_instance" "web_server" {
  ami                         = "ami-08f44e8eca9095668"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.server_key.key_name
  vpc_security_group_ids      = [aws_security_group.server_sg.id]
  associate_public_ip_address = true

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "web-server-1"
    Role = "webserver"
  }
}

resource "aws_instance" "db_server" {
  ami                         = "ami-08f44e8eca9095668"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.server_key.key_name
  vpc_security_group_ids      = [aws_security_group.server_sg.id]
  associate_public_ip_address = true

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "db-server-1"
    Role = "dbserver"
  }
}
