
# we can use these variables as refrence for the ec2.tf rather hardcoding in ec2.tf 

variable "servers_ami" {
    default = ""
    type = string
}

variable "server_storage" {
    default = 13
    type = number
  
}   

variable "server_type" {
    default = "t2.micro"
    type = string
}

variable "env" {
    default = "dev"
    type = string
  
}
