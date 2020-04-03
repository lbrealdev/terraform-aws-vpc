output "vpc_id" {
  value = module.vpc.this_vpc_id
}

output "vpc_cidr" {
  value = module.vpc.this_vpc_cidr
}

output "subnets_private" {
  value = module.vpc.this_subnet_private_cidrs
}

output "subnets_public" {
  value = module.vpc.this_subnet_public_cidrs
}