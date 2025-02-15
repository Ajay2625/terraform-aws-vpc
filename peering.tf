resource "aws_vpc_peering_connection" "foo" {
  count = var.is_peering_required ? 1 : 0
  peer_vpc_id   = aws_vpc.default_vpc_id
  vpc_id        = aws_vpc.main.id
  auto_accept = true

  tags = merge (
    var.common_tags,
    {
        Name = "${local.resource_name}-default"
    }
  )
}