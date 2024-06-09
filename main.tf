resource "aws_instance" "custom_ec2" {
  ami = "099720109477"
  instance_type = "t3.micro"
  associate_public_ip_address = true
  key_name = aws_key_pair.key.key_name
  user_data = "${path.module}/.user_data/install_docker.sh"
  tags = {
    Name = "Custom EC2"
  }
}

resource "tls_private_key" "key_gen" {
  algorithm = "RSA"
  rsa_bits = 2048
}

resource "aws_key_pair" "key" {
  key_name = "priv-key"
  public_key = tls_private_key.key_gen.public_key_openssh
}

resource "local_file" "key-file" {
  content = tls_private_key.key_gen.private_key_pem
  filename = "private-key"
}
