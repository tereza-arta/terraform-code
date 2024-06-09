resource "aws_instance" "custom_ec2" {
  ami = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_public_ip
  key_name = aws_key_pair.key.key_name
  user_data = "${path.module}/.user_data/${var.user_data}"
  tags = {
    Name = var.instance_name
  }
}

resource "tls_private_key" "key_gen" {
  algorithm = var.rsa_algorithm
  rsa_bits = var.rsa_bit
}

resource "aws_key_pair" "key" {
  key_name = "priv-key"
  public_key = tls_private_key.key_gen.public_key_openssh
}

resource "local_file" "key-file" {
  content = tls_private_key.key_gen.private_key_pem
  filename = "private-key"
}
