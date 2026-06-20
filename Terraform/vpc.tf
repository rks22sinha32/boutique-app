module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "gitops-vpc"
  cidr = "10.0.0.0/16" # Yeh hamare network ka total IP address space hai

  azs             = ["ap-south-1a", "ap-south-1b"] # Availability Zones (Mumbai region)
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"] # Private area ke IPs
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"] # Public area ke IPs

  # NAT Gateway enable karna zaroori hai taaki private subnet ke resources 
  # internet se updates download kar sakein (jaise Docker images)
  enable_nat_gateway = true 
  single_nat_gateway = true

  # EKS ke liye kuch special tags zaroori hote hain
  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}