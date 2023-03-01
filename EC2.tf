resource "aws_instance" "Linux" {
  count                       = var.env == "PROD" ? 3 : 1
  ami                         = var.ami
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.public_subnet1.id
  vpc_security_group_ids      = ["${aws_security_group.Allow_all.id}"]
  associate_public_ip_address = true


  tags = {
    Name = "${var.vpc_name}-Public-Server-${count.index + 1}"
    Env  = var.env
  }

  user_data = <<-EOF
  #!/bin/bash
  sudo apt-get update
  sudo apt-grt install -y nginx jq net-tools
  echo "<h1>${var.vpc_name}-Public-Server-${count.index + 1}</h1>" | sudo tee /var/html/index.html
  EOF

}
  