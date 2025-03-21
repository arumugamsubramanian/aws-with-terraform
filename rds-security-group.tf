resource "aws_security_group" "rds_sg" {
  name        = "rds-private-sg"
  description = "Allow web tier and ssh traffic"
  vpc_id      = aws_vpc.two-tier-vpc.id

  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
    security_groups = [ "${module.ec2-security-group.ec2-sg-id}" ]
  }
  ingress {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }
}