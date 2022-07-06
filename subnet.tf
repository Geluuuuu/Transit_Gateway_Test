resource "aws_subnet" "subnet_test_transit_1_vpc_1" {
    provider          = aws.local
    vpc_id            = aws_vpc.vpc_test_transit_1.id
    cidr_block        = "30.0.0.0/24"
    availability_zone = "eu-west-3a"

    tags = {
        Name = "subnet_test_transit_1_vpc_1"
    }
}

resource "aws_subnet" "subnet_test_transit_1_vpc_2" {
    provider          = aws.local
    vpc_id            = aws_vpc.vpc_test_transit_2.id
    cidr_block        = "40.0.0.0/24"
    availability_zone = "eu-west-3a"

    tags = {
        Name = "subnet_test_transit_1_vpc_2"
    }
}

resource "aws_subnet" "subnet_test_transit_1_vpc_1_us" {
    provider          = aws.peer
    vpc_id            = aws_vpc.vpc_test_transit_1_us.id
    cidr_block        = "50.0.0.0/24"
    availability_zone = "us-west-1b"

    tags = {
        Name = "subnet_test_transit_1_vpc_1_us"
    }
}