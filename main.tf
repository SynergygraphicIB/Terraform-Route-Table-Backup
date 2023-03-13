# Fetch the data for the existing route table
data "aws_route_table" "existing_routes" {
  route_table_id = var.existing_route_table_id
  
  # Specify the ID of the existing route table to retrieve its data
}

# Flatten the routes from the existing route table into a list
locals {
  routes = flatten([
    for r in data.aws_route_table.existing_routes.routes : [
      {
        destination_cidr_block = r.destination_cidr_block,
        gateway_id = r.gateway_id,
      },
    ]
  ])
}

# Create the backup route table
resource "aws_route_table" "backup" {
  vpc_id = var.vpc_id

  # The ID of the VPC associated with the route table
}

# Associate the backup route table with the specified subnet
resource "aws_route_table_association" "backup" {
  subnet_id = var.subnet_id
  route_table_id = aws_route_table.backup.id

  # The subnet and route table association
}

# Create the routes in the backup route table
resource "aws_route" "backup_routes" {
  count = length(local.routes)
  route_table_id = aws_route_table.backup.id
  destination_cidr_block = local.routes[count.index].destination_cidr_block
  gateway_id = local.routes[count.index].gateway_id

  # The routes in the backup route table
}
