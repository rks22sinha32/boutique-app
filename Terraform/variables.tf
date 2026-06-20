# variables.tf

variable "aws_region" {
  description = "AWS region jahan infrastructure banega"
  type        = string
  default     = "ap-south-1" # Mumbai region
}

variable "cluster_name" {
  description = "EKS cluster ka naam"
  type        = string
  default     = "gitops-eks-cluster"
}

variable "vpc_cidr" {
  description = "VPC ka IP range"
  type        = string
  default     = "10.0.0.0/16"
}