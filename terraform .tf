
#adding a aws provider here 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Recommended to pin a version
    }
  }
}


#adding local backend to store the bacckup of the state.
terraform {
  backend "local" {
    path = "local_state/infra.tfstate"
  }
}
