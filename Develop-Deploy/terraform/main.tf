module "vpc" {
  source = "./modules/vpc"
  aws_region = var.aws_region
}

module "iam" {
  source = "./modules/iam"
}

module "eks" {
  source = "./modules/eks"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.public_subnet_ids
  eks_role_arn = module.iam.eks_role_arn
  node_role_arn = module.iam.eks_node_role_arn
}


