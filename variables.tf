variable "region" {
  type        = string
  default     = "us-west-2"
  description = "The AWS region where the resources will be created."
}

variable "vpc_id" {
  type        = string
  default     = "vpc-0123456789abcdef0"
  description = "The ID of the VPC where the resources will be created."
}

variable "existing_route_table_id" {
  type        = string
  default     = "rtb-0123456789abcdef0"
  description = "The ID of the existing route table."
}

variable "subnet_id" {
  type        = string
  default     = "subnet-0123456789abcdef0"
  description = "The ID of the subnet associated with the route table."
}

variable "existing_routes" {
  type        = list(object({
    destination_cidr_block = string
    gateway_id           = string
  }))
  description = "A list of existing routes in the existing route table."
}


