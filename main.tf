resource "aws_route_table" "existing" {
  vpc_id = var.vpc_id

  validate {
    check = (var.existing_route_table_id != "")
    error_message = "The ID of the existing route table must be provided."
  }

  route_table_id = var.existing_route_table_id

  # The ID of the existing route table.
}

resource "aws_route" "existing_routes" {
  count = length(var.existing_routes)
  route_table_id = aws_route_table.existing.id
  destination_cidr_block = var.existing_routes[count.index].destination_cidr_block
  gateway_id = var.existing_routes[count.index].gateway_id

  # The list of existing routes in the existing route table.
}

resource "aws_route_table" "backup" {
  vpc_id = var.vpc_id

  validate {
    check = (var.subnet_id != "")
    error_message = "The ID of the subnet associated with the route table must be provided."
  }

  # The ID of the subnet associated with the route table.
}

resource "aws_subnet_route_table_association" "backup" {
  subnet_id = var.subnet_id
  route_table_id = aws_route_table.backup.id

  # The subnet and route table association.
}
