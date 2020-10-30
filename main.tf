# Create A New VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
    env  = var.env_name
  }

}


# Declare the AZs data source
data "aws_availability_zones" "azs" {}


# create 3 Private Subnets in created VPC
resource "aws_subnet" "private_subnets" {
  count             = length(data.aws_availability_zones.azs.names)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_subs, count.index)
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)
  tags = {
    Name = "pvt-sub-${element(data.aws_availability_zones.azs.names, count.index)}"
    env  = var.env_name
  }
}


# create 3 Public Subnets in created VPC
resource "aws_subnet" "public_subnets" {
  count             = length(data.aws_availability_zones.azs.names)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.public_subs, count.index)
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)

  tags = {
    Name = "pub-sub-${element(data.aws_availability_zones.azs.names, count.index)}"
    env  = var.env_name
  }
}

