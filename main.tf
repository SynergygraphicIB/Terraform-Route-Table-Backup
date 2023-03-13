# Get the existing route table
data "aws_route_table" "existing" {
  route_table_id = var.existing_route_table_id
}

# Create the backup route table
resource "aws_route_table" "backup" {
  vpc_id = var.vpc_id
}

# Associate the subnet with the backup route table
resource "aws_subnet_route_table_association" "backup" {
  subnet_id = var.subnet_id
  route_table_id = aws_route_table.backup.id
}

# Create the backup routes
resource "aws_route" "backup_routes" {
  count = length(data.aws_route_table.existing.route)

  route_table_id = aws_route_table.backup.id
  destination_cidr_block = data.aws_route_table.existing.route[count.index].destination_cidr_block
  gateway_id = data.aws_route_table.existing.route[count.index].gateway_id
}
