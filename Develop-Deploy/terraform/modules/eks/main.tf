# ----------------------
# EKS Cluster Control Plane
# ----------------------
resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = var.eks_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [
    var.eks_role_arn
  ]
}

# ----------------------
# EKS Managed Node Group (Worker Nodes)
# ----------------------
resource "aws_eks_node_group" "weather_node_group" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "weather-node-group"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  instance_types = ["t2.micro"]

  tags = {
    "Name" = "weather-node-group"
  }

  depends_on = [
    aws_eks_cluster.this
  ]
}

