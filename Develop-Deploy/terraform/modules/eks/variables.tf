variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}

variable "eks_role_arn" {
  description = "EKS Role ARN"
  type        = string
}

variable "node_role_arn" {
  description = "Node IAM Role ARN for worker nodes"
  type        = string
}

