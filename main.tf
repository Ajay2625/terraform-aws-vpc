resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
    var.common_tags,
    {
        Name = local.resource_name
    }
  )
  
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge (
    var.common_tags,
    {
        Name = local.resource_name
    }
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zones = local.azs_names[count.index]
  map_public_ip_on_launch = true
  tags = merge (
    var.common_tags,
    {
        Name = "${local.resource_name}-public-$(local.azs_names[count.index]"
    }
  )
}
