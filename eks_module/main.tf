module "aws_vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
    vpc_enable_dns_hostnames = var.vpc_enable_dns_hostnames
    vpc_enable_dns_support = var.vpc_enable_dns_support     
}

module "aws_internet_gateway" {
    source = "./modules/aws_internet_gateway"
    vpc_id = module.aws_vpc.vpc_id
    aws_internet_gateway_name = var.aws_internet_gateway_name
}

module "private_subnet" {
    source = "./modules/privateSubnet"
    vpc_id = module.aws_vpc.vpc_id

    for_each = var.private_subnet_config

    private_subnet_availability_zone = each.value.private_subnet_availability_zone
    private_subnet_cidr = each.value.private_subnet_cidr
    private_subnet_tags = each.value.private_subnet_tags
  
}

module "public_subnet" {
    source = "./modules/publicSubnet"
    vpc_id = module.aws_vpc.vpc_id

    for_each = var.public_subnet_config

    public_subnet_availability_zone = each.value.public_subnet_availability_zone
    public_subnet_cidr = each.value.public_subnet_cidr
    public_subnet_tags = each.value.public_subnet_tags
    public_subnet_publicip_onlaunch = each.value.public_subnet_publicip_onlaunch
  
}

module "aws_eip" {
    source = "./modules/aws_eip"
    depends_on = [
      module.aws_internet_gateway   
    ]

    for_each = var.private_subnet_config

    aws_eip_name = each.value.aws_eip_name
  
}

module "aws_nat_gateway" {
    source = "./modules/aws_nat_gateway"
    depends_on = [
      module.aws_eip,module.public_subnet
    ]

    for_each = var.private_subnet_config

    aws_eip_id = module.aws_eip[each.key].aws_eip_id
    public_subnet_id = module.public_subnet[each.key].public_subnet_id
    aws_nat_gateway_name = each.value.aws_nat_gateway_name

}

module "aws_route_table_private" {
    source = "./modules/aws_route_table_private"
    depends_on = [
      module.aws_nat_gateway
    ]

    for_each = var.private_subnet_config

    aws_nat_gateway_id = module.aws_nat_gateway[each.key].aws_nat_gateway_id
    aws_route_table_private_cidr = each.value.aws_route_table_private_cidr
    aws_route_table_private_name = each.value.aws_route_table_private_name
    aws_vpc_id = module.aws_vpc.vpc_id
  
}

module "aws_route_table_public" {
    source = "./modules/aws_route_table_public"
    depends_on = [
      module.aws_nat_gateway
    ]
    aws_internet_gateway_id = module.aws_internet_gateway.aws_internet_gateway_id
    aws_route_table_public_cidr = var.aws_route_table_public_cidr
    aws_route_table_public_name = var.aws_route_table_public_name
    aws_vpc_id = module.aws_vpc.vpc_id
}

module "aws_route_table_association_private" {
  source = "./modules/aws_route_table_association_private"
  depends_on = [
    module.aws_route_table_private
  ]

  for_each = var.private_subnet_config

  aws_route_table_private_id = module.aws_route_table_private[each.key].aws_route_table_private_id
  aws_subnet_private_id = module.private_subnet[each.key].private_subnet_id

}

module "aws_route_table_association_public" {
  source = "./modules/aws_route_table_association_public"
  depends_on = [
    module.aws_route_table_public
  ]

  for_each = var.public_subnet_config

  aws_route_table_public_id = module.aws_route_table_public.aws_route_table_public_id
  aws_subnet_public_id = module.public_subnet[each.key].public_subnet_id
  
}

module "aws_eks_cluster" {
    source = "./modules/aws_eks_cluster"
    depends_on = [
      module.private_subnet, module.public_subnet
    ]
    aws_eks_cluster_name = var.aws_eks_cluster_name
    vpc_id = module.aws_vpc.vpc_id
    aws_eks_iam_role_name = var.aws_eks_iam_role_name   
}

module "aws_eks_node_group" {
  source = "./modules/aws_eks_node_group"
  depends_on = [
    module.aws_eks_cluster, module.private_subnet
  ]
  
  aws_eks_node_group_ami = var.aws_eks_node_group_ami
  aws_eks_node_group_capacity_type = var.aws_eks_node_group_capacity_type
  aws_eks_node_group_disk_size = var.aws_eks_node_group_disk_size
  aws_eks_node_group_force_update = var.aws_eks_node_group_force_update
  aws_eks_node_group_instance_type = var.aws_eks_node_group_instance_type
  aws_eks_node_group_role = var.aws_eks_node_group_role
  aws_eks_cluster_name = module.aws_eks_cluster.aws_eks_cluster_name
  aws_eks_node_group = var.aws_eks_node_group
  aws_node_group_iam_role_name = var.aws_node_group_iam_role_name

}



