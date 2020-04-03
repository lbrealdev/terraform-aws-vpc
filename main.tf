# ---------------------------------------------------------------------------------------------------------------------
# THESE TEMPLATES REQUIRE TERRAFORM VERSION 0.12 AND ABOVE
# ----------------------------------------------------------------------------------------------

provider "aws" {
  region = "eu-central-1"
}

module "vpc" {
  source = "modules/vpc"

  cidr_block = var.cidr_block
}