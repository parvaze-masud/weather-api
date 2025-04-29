terraform {
  backend "s3" {
    bucket         = "luna-chat"  # Only bucket name
    key            = "ml-data/eks-cluster/terraform.tfstate"  # Key (folder/object path inside bucket)
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

