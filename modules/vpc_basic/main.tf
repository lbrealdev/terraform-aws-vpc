# ---------------------------------------------------------------------------------------------------------------------
# THESE TEMPLATES REQUIRE TERRAFORM VERSION 0.12 AND ABOVE
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = "~> 0.12"
}

locals {
  tags = {
    Description = "Managed by Terraform"
  }

  workspace = terraform.workspace
}

resource "aws_vpc" "main" {
  count = var.create_vpc && var.cidr_block != null ? 1 : 0

  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = merge(
    {
      Name        = "vpc-${local.workspace}-basic"
      Description = local.workspace
    }
  )

}

data "aws_availability_zones" "main" {
  state = "available"
}

resource "aws_subnet" "private" {
  count = var.create_vpc ? length(var.az) : 0

  vpc_id            = aws_vpc.main[0].id
  cidr_block        = cidrsubnet(aws_vpc.main[0].cidr_block, 8, count.index)
  availability_zone = concat(data.aws_availability_zones.main.names, [""])[count.index]

  tags = merge(
    {
      Name        = "vpc-${local.workspace}-private"
      Description = local.workspace
    }
  )

}

resource "aws_subnet" "public" {
  count = var.create_vpc ? length(var.az) : 0

  vpc_id                  = aws_vpc.main[0].id
  cidr_block              = cidrsubnet(aws_vpc.main[0].cidr_block, 8, length(var.az) + count.index)
  availability_zone       = concat(data.aws_availability_zones.main.names, [""])[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    {
      Name        = "subnet-${local.workspace}-public"
      Description = local.workspace
    }
  )
}