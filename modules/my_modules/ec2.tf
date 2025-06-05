# EC2 Key Pair
resource "aws_key_pair" "main" {
  key_name   = var.ssh_key_name
  public_key = file("${var.ssh_key_name}.pub")
}

# EC2 Security Group
resource "aws_security_group" "ec2" {
  name        = "${var.environment}-ec2-sg"
  description = "Allow SSH and HTTP access"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment
  }
}

# EC2 Instances
resource "aws_instance" "main" {
  count =var.ec2_instances.instance_count 
   root_block_device {
    volume_size = each.value.storage_size
    volume_type = "gp3"
  }

  tags = {
    Name        = "${var.environment}-${each.key}"
    Environment = var.environment
  }

  # Ensure Terraform state is properly locked during creation
  depends_on = [aws_dynamodb_table.terraform_locks]
}