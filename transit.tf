//europe
resource "aws_ec2_transit_gateway" "transit_gateway_test" {
    provider                        = aws.local
    default_route_table_association = "enable"
    default_route_table_propagation = "enable"

    tags = {
        Name = "transit_gateway_test"
    }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_1_test_attachment" {
    provider           = aws.local
    subnet_ids         = [aws_subnet.subnet_test_transit_1_vpc_1.id]
    transit_gateway_id = aws_ec2_transit_gateway.transit_gateway_test.id
    vpc_id             = aws_vpc.vpc_test_transit_1.id

    tags = {
        Name = "vpc_1_test_attachment"
    }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_2_test_attachment" {
    provider           = aws.local
    subnet_ids         = [aws_subnet.subnet_test_transit_1_vpc_2.id]
    transit_gateway_id = aws_ec2_transit_gateway.transit_gateway_test.id
    vpc_id             = aws_vpc.vpc_test_transit_2.id

    tags = {
        Name = "vpc_2_test_attachment"
    }
}

//us
resource "aws_ec2_transit_gateway" "transit_gateway_test_us" {
    provider                        = aws.peer
    default_route_table_association = "enable"
    default_route_table_propagation = "enable"

    tags = {
        Name = "transit_gateway_test_us"
    }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_1_test_attachment_us" {
    provider           = aws.peer
    subnet_ids         = [aws_subnet.subnet_test_transit_1_vpc_1_us.id]
    transit_gateway_id = aws_ec2_transit_gateway.transit_gateway_test_us.id
    vpc_id             = aws_vpc.vpc_test_transit_1_us.id

    tags = {
        Name = "vpc_1_test_attachment_us"
    }
}

data "aws_region" "peer" {
    provider = aws.peer
}

//peer zones
resource "aws_ec2_transit_gateway_peering_attachment" "peer_eu_us" {
    provider                = aws.local
    peer_transit_gateway_id = aws_ec2_transit_gateway.transit_gateway_test_us.id
    peer_region             = data.aws_region.peer.name
    transit_gateway_id      = aws_ec2_transit_gateway.transit_gateway_test.id

    tags = {
        Name = "peer_eu_us"
    }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "peer_eu_us_accept" {
    provider                      = aws.peer
    transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.peer_eu_us.id

    tags = {
        Name = "peer_eu_us_accept"
    }
}
