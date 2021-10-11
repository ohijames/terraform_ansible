resource "tls_private_key" "demo-key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "aws_key_pair" "demo-key" {
  key_name   = "demo-key"
  public_key = tls_private_key.demo-key.public_key_openssh
}

resource "local_file" "local_ssh_private_key" {
  content         = tls_private_key.demo-key.private_key_pem
  filename        = "demo-key"
  file_permission = "400"
}

resource "local_file" "local_ssh_public_key" {
  content         = tls_private_key.demo-key.public_key_openssh
  filename        = "demo-key.pub"
  file_permission = "600"
} 
