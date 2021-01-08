resource "aws_instance" "eniworks" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true

  key_name = "eniworks"

  user_data              = <<-EOF
                  #!/bin/bash
                  sudo su
                  apt-get update
                  apt-get upgrade
                  apt-get -y install haproxy
                  hostnamectl set-hostname eniworks.net
                  EOF
  vpc_security_group_ids = [aws_security_group.eniworks.id]

  tags = {
    Name = "eniworks.net"
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.eniworks.id
}