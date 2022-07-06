//net gateway for vpc 1
resource "aws_internet_gateway" "net_gtw_1" {
    provider = aws.local
    vpc_id   = aws_vpc.vpc_test_transit_1.id
}

//net gateway for vpc 2
resource "aws_internet_gateway" "net_gtw_2" {
    provider = aws.local
    vpc_id = aws_vpc.vpc_test_transit_2.id
}

//net gateway for vpc 1 us
resource "aws_internet_gateway" "net_gtw_1_us" {
    provider = aws.peer
    vpc_id   = aws_vpc.vpc_test_transit_1_us.id
}

//route table for vpc 1
resource "aws_route_table" "route_table_vpc_1"{
    provider = aws.local
    vpc_id   = aws_vpc.vpc_test_transit_1.id

      route {
        cidr_block         = "40.0.0.0/16"
        transit_gateway_id = aws_ec2_transit_gateway.transit_gateway_test.id
      }
      route {
        cidr_block         = "50.0.0.0/16"
        transit_gateway_id = aws_ec2_transit_gateway.transit_gateway_test.id
      }
      route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.net_gtw_1.id
      }
}

resource "aws_main_route_table_association" "main_route_table_vpc_1" {
    provider       = aws.local
    route_table_id = aws_route_table.route_table_vpc_1.id
    vpc_id         = aws_vpc.vpc_test_transit_1.id
}

resource "aws_route_table_association" "route_table_subnet_1" {
    provider       = aws.local
    route_table_id = aws_route_table.route_table_vpc_1.id
    subnet_id      = aws_subnet.subnet_test_transit_1_vpc_1.id
}

//route table for vpc 2
resource "aws_route_table" "route_table_vpc_2"{
    provider = aws.local
    vpc_id   = aws_vpc.vpc_test_transit_2.id

    route {
      cidr_block = "30.0.0.0/16"
      transit_gateway_id = aws_ec2_transit_gateway.transit_gateway_test.id
    }
    route {
        cidr_block = "50.0.0.0/16"
        transit_gateway_id = aws_ec2_transit_gateway.transit_gateway_test.id
    }
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.net_gtw_2.id
    }
}

resource "aws_main_route_table_association" "main_route_table_vpc_2" {
    provider       = aws.local
    route_table_id = aws_route_table.route_table_vpc_2.id
    vpc_id         = aws_vpc.vpc_test_transit_2.id
}

resource "aws_route_table_association" "route_table_subnet_2" {
    provider       = aws.local
    route_table_id = aws_route_table.route_table_vpc_2.id
    subnet_id      = aws_subnet.subnet_test_transit_1_vpc_2.id
}

//transit gateway route
resource "aws_ec2_transit_gateway_route" "route_transit_to_us" {
    provider                       = aws.local
    destination_cidr_block         = "50.0.0.0/16"
    transit_gateway_route_table_id = aws_ec2_transit_gateway.transit_gateway_test.association_default_route_table_id
    transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment.peer_eu_us.id
}


///////////////
//////US///////
//////////////
//route table for vpc 1 us
resource "aws_route_table" "route_table_vpc_1_us"{
    provider = aws.peer
    vpc_id   = aws_vpc.vpc_test_transit_1_us.id

    route {
        cidr_block         = "40.0.0.0/16"
        transit_gateway_id = aws_ec2_transit_gateway.transit_gateway_test_us.id
    }
    route {
        cidr_block         = "30.0.0.0/16"
        transit_gateway_id = aws_ec2_transit_gateway.transit_gateway_test_us.id
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.net_gtw_1_us.id
    }
}

resource "aws_main_route_table_association" "main_route_table_vpc_1_us" {
    provider       = aws.peer
    route_table_id = aws_route_table.route_table_vpc_1_us.id
    vpc_id         = aws_vpc.vpc_test_transit_1_us.id
}

resource "aws_route_table_association" "route_table_subnet_1_us" {
    provider       = aws.peer
    route_table_id = aws_route_table.route_table_vpc_1_us.id
    subnet_id      = aws_subnet.subnet_test_transit_1_vpc_1_us.id
}

//transit
resource "aws_ec2_transit_gateway_route" "route_transit_to_eu_vpc_1" {
    provider                       = aws.peer
    destination_cidr_block         = "30.0.0.0/16"
    transit_gateway_route_table_id = aws_ec2_transit_gateway.transit_gateway_test_us.association_default_route_table_id
    transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment_accepter.peer_eu_us_accept.id
}

resource "aws_ec2_transit_gateway_route" "route_transit_to_eu_vpc_2" {
    provider                       = aws.peer
    destination_cidr_block         = "40.0.0.0/16"
    transit_gateway_route_table_id = aws_ec2_transit_gateway.transit_gateway_test_us.association_default_route_table_id
    transit_gateway_attachment_id  = aws_ec2_transit_gateway_peering_attachment_accepter.peer_eu_us_accept.id
}