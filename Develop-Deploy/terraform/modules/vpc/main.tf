resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "weather-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  count = 2

  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(aws_vpc.this.cidr_block, 8, count.index)
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index)
  
  tags = {
    Name = "weather-public-subnet-${count.index}"
  }
}

