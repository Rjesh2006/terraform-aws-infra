# ========================
# Global Configuration
# ========================
variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment (dev/stage/prod)"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "Valid values: dev, stage, prod"
  }
}

variable "default_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    ManagedBy   = "Terraform"
    Project     = "InfraAutomation"
  }
}

# ========================
# EC2 Configuration
# ========================
variable "ec2_instances" {
  description = "Map of EC2 instance configurations"
  type = map(object({
    instance_type = string
    ami           = string
    storage_size  = number
    enable_public_ip = bool
    instance_count=number
  }))
  default = {
    "web-server" = {
      instance_type     = "t3.micro"
      ami               = "ami-0c55b159cbfafe1f0" # Ubuntu 20.04
      storage_size      = 20
      enable_public_ip  = true
    }
  }
}



variable "ssh_key_name" {
  description = "Name for the SSH key pair"
  type        = string
  default     = "terraform-key"
}

variable "user_data_script" {
  description = "Path to EC2 user data script"
  type        = string
  default     = "init-script.sh"
}

# ========================
# Networking
# ========================
variable "vpc_name" {
  description = "Name tag for default VPC"
  type        = string
  default     = "default-vpc"
}

variable "allowed_ssh_cidrs" {
  description = "CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"] # Restrict in production!
}

variable "allowed_http_cidrs" {
  description = "CIDR blocks allowed for HTTP access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# S3 Bucket Name
variable "s3_bucket_name" {
  description = "Name of the S3 bucket for storing Terraform remote state"
  type        = string
}

# S3 Bucket Tags
variable "s3_bucket_tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
  default     = {}
}

# DynamoDB Table Name
variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for Terraform state locking"
  type        = string
}

# DynamoDB Billing Mode
variable "dynamodb_billing_mode" {
  description = "Billing mode for DynamoDB (e.g., PAY_PER_REQUEST or PROVISIONED)"
  type        = string
  default     = "PAY_PER_REQUEST"
}

# DynamoDB Hash Key Name
variable "dynamodb_hash_key" {
  description = "Hash key for the DynamoDB table (typically LockID)"
  type        = string
  default     = "LockID"
}

# DynamoDB Tags
variable "dynamodb_tags" {
  description = "Tags to apply to the DynamoDB table"
  type        = map(string)
  default     = {}
}
