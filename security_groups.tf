resource "aws_security_group" "Allow_all" {
  name        = "SG-${var.env}"
  description = "Public internet access"
  vpc_id      = aws_vpc.main.id
}

resource "aws_security_group_rule" "public_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.Allow_all.id
}