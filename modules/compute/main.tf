resource "aws_instance" "web_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "tutorial-key"
  subnet_id              = var.subnet_id
  associate_public_ip_address = true
  security_groups        = [var.security_group_id]

  user_data = file("${path.module}/../../web-userdata.sh") 
  tags = {
    Name = "Global-web-server"
  }
}