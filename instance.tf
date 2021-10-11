resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.instance_type
  subnet_id = aws_subnet.main-public-0.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name = aws_key_pair.demo-key.key_name
  tags = {
    Name = "instance-1"
  } 

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = local.ssh_user
      private_key = file(aws_key_pair.demo-key.key_name)
      host        = aws_instance.example.public_ip
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.example.public_ip}, --key-file ${aws_key_pair.demo-key.key_name} nginx.yaml"
  }
}

resource "aws_instance" "example2" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.instance_type
  subnet_id = aws_subnet.main-public-1.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name = aws_key_pair.demo-key.key_name
  tags = {
    Name = "instance-2"
  }  

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = local.ssh_user
      private_key = file(aws_key_pair.demo-key.key_name)
      host        = aws_instance.example2.public_ip
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.example2.public_ip}, --key-file ${aws_key_pair.demo-key.key_name} nginx.yaml"
  }
}


