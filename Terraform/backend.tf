terraform {
  backend "s3" {
    bucket         = "my-gitops-terraform-state-bucket" # Apni s3 bucket ka naam
    key            = "eks-cluster/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}