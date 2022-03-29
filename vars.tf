variable "name" {
  description = "the name of your stack, e.g. \"demo\""
}

variable "environment" {
  description = "the name of your environment, e.g. \"prod\""
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.31.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnets"
}

variable "private_subnets" {
  description = "List of private subnets"
}

variable "availability_zones" {
  description = "List of availability zones"
}

variable "container_port" {
  description = "The port where the Docker is exposed"
  default     = 8000
}

variable "container_image" {
  description = "Docker image to be launched"
}

# variable "aws_alb_target_group_arn" {
#   description = "ARN of the alb target group"
# }

# variable "service_desired_count" {
#   description = "Number of services running in parallel"
# }

variable "container_environment" {
  description = "The container environmnent variables"
  type        = list(any)
}