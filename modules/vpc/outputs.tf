output "this_vpc_id" {
  value = concat(aws_vpc.main.*.id, [""])[0]
}

output "this_vpc_cidr" {
  value = concat(aws_vpc.main.*.cidr_block, [""])[0]
}

output "this_subnet_private_cidrs" {
  value = compact(concat(aws_subnet.private.*.cidr_block))
}

output "this_subnet_public_cidrs" {
  value = compact(concat(aws_subnet.public.*.cidr_block))
}
