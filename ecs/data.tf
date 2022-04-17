# Find the default VPC
data "aws_vpc" "default" {
  default = true
}

# Get the subnet IDs in the default VPC
data "aws_subnet_ids" "default" {
  vpc_id = "${data.aws_vpc.default.id}"
}

# Fetch AZs in the current region
data "aws_availability_zones" "available" {
}

