variable "ami" {
  type = string
  default = "099720109477"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "associate_public_ip" {
  type = bool
  default = true
  description = "Associate public ip address to AWS instrance or not"
}

variable "instance_name" {
  type = any
  default = ""
  description = "Name of ec2 instance"
}

variable "user_data" {
  type = string
  default = "docker_install.sh"
}

variable "rsa_algorithm" {
  type = string
  default = "RSA"
  description = "Choose key algorithm(RSA, ECDSA, ed25519)"
}

variable "rsa_bit" {
  type = number
  default = 2048
}
