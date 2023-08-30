resource "aws_instance" "example_instance" {
  ami           = "ami-0f34c5ae932e6f0e4" 
  instance_type = "t2.micro"
  subnet_id = aws_subnet.privatesubnets.id
  root_block_device {
    volume_type           = "gp2"
    encrypted             = true
    kms_key_id            = aws_kms_key.my_kms_key.key_id
    delete_on_termination = true
  }
}   











resource "aws_security_group_rule" "example_ssh_rule" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["10.0.1.0/24"]
  security_group_id = aws_kms_key.my_kms_key.key_id
}
