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
    Name = "Linux"
    Env  = var.env
  }
  depends_on = [
    aws_security_group.Allow_all
  ]

  lifecycle {
    create_before_destroy = true

    ignore_changes = [
      tags
    ]
  }


}