module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.0"

  cluster_name    = "gitops-eks-cluster"
  cluster_version = "1.27" # Kubernetes version

  cluster_endpoint_public_access = true # Taaki hum apne laptop se kubectl use kar sakein

  # Hum batayenge ki hamara cluster usi VPC mein bane jo humne vpc.tf mein banaya hai
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets # Cluster ke nodes private area mein rahenge!

  # EKS Managed Node Groups (Servers jahan pods chalenge)
  eks_managed_node_groups = {
    general = {
      desired_size = 2 # Shuruwat mein 2 servers chalenge (Diagram mein 'Node Group' dekhiye)
      min_size     = 1
      max_size     = 3

      instance_types = ["t3.medium"] # Budget-friendly instance type testing ke liye
      capacity_type  = "ON_DEMAND"
    }
  }

  tags = {
    Environment = "production"
    Project     = "GitOps-Project"
  }
}