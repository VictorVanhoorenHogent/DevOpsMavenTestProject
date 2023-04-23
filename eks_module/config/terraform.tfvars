region = "eu-north-1"

vpc_cidr = "192.168.0.0/16"

vpc_name = {Name = "Victor_vpc_test"}

vpc_enable_dns_hostnames = true

vpc_enable_dns_support = true

aws_internet_gateway_name = {Name = "victorsgateway"}

private_subnet_config = {
    subnet1 = {

        private_subnet_cidr = "192.168.64.0/18"
        private_subnet_tags = {"Name" = "private-eu-north-1a"
        "kubernetes.io/cluster/eks" = "shared"
        "kubernetes.io/role/internal-elb" = 1
        }
        private_subnet_availability_zone = "eu-north-1a"

        aws_eip_name = {Name="nat1"}

        aws_nat_gateway_name = {Name="NAT1"}

        aws_route_table_private_cidr = "0.0.0.0/0"
        aws_route_table_private_name = {Name="myprivateroute1"}
    }

    subnet2 = {

        private_subnet_cidr = "192.168.192.0/18"
        private_subnet_tags = {"Name" = "private-eu-north-1b"
        "kubernetes.io/cluster/eks" = "shared"
        "kubernetes.io/role/internal-elb" = 1
        }
        private_subnet_availability_zone = "eu-north-1b"

        aws_eip_name = {Name="nat2"}

        aws_nat_gateway_name = {Name="NAT2"}

        aws_route_table_private_cidr = "0.0.0.0/0"
        aws_route_table_private_name = {Name="myprivateroute2"}
    }

}

public_subnet_config = {
    
    subnet1 = {
        public_subnet_cidr = "192.168.0.0/18"
        public_subnet_tags = {"Name" = "public-eu-north-1a"
        "kubernetes.io/cluster/eks" = "shared"
        "kubernetes.io/role/elb" = 1
        }
        public_subnet_availability_zone = "eu-north-1a"
        public_subnet_publicip_onlaunch = true

        
    },

    subnet2 = {
        public_subnet_cidr = "192.168.128.0/18"
        public_subnet_tags = {"Name" = "public-eu-north-1b"
        "kubernetes.io/cluster/eks" = "shared"
        "kubernetes.io/role/elb" = 1
        }
        public_subnet_availability_zone = "eu-north-1b"
        public_subnet_publicip_onlaunch = true
    }

}

aws_route_table_public_cidr = "0.0.0.0/0"
aws_route_table_public_name = {Name="mypublicroute"}

aws_eks_cluster_name = "example"

aws_eks_iam_role_name = "test_role"

aws_eks_node_group_ami = "AL2_x86_64"
  
aws_eks_node_group_capacity_type = "ON_DEMAND"

aws_eks_node_group_disk_size = 100
  
aws_eks_node_group_force_update = false
  
aws_eks_node_group_instance_type = ["t3.small"]

aws_eks_node_group_role = {role = "nodes-general"}

aws_eks_node_group = "example"

aws_node_group_iam_role_name = "test_role3"



