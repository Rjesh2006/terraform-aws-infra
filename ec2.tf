# SSH Key Pair
resource "aws_key_pair" "my_key" {
  key_name   = "local-terra-key"
  public_key = file("local-terra-key.pub")
}

# Default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Security Group
resource "aws_security_group" "sg" {
  name        = "automate-sg"
  description = "SG created by Terraform"
  vpc_id      = aws_default_vpc.default.id

  # SSH access from anywhere (consider restricting this in production)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"  # Added quotes
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
  }

  # Outbound rule - allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All protocols
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "automate-sg"
  }
}

# EC2 Instance
resource "aws_instance" "ec2_server" {
    for_each = tomap({
    first_server="t2.medium"
  })

  ami                    = "ami-0c55b159cbfafe1f0"  # Updated to actual Ubuntu AMI
  instance_type          = each.value
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]  # Correct parameter name
  user_data = file("install_nginx.sh")


  root_block_device {
    volume_size = var.env== "prduction" ? 20 : var.server_storage #its just like if else for the server storage allotment as per the enviromen varialbe comparisoon if prd then 20 not then default whicch is also refrence variable var.server.strorage 
    volume_type = "gp3"
  }

  tags = {
    Name=each.key
    Environment=var.env
  }



}