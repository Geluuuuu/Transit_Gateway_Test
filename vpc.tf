resource "aws_vpc" "vpc_test_transit_1" {
    provider   = aws.local
    cidr_block = "30.0.0.0/16"
    tags = {
      Name = "vpc_test_transit_1"
    }
}

resource "aws_vpc" "vpc_test_transit_2" {
    provider   = aws.local
    cidr_block = "40.0.0.0/16"

    tags = {
        Name = "vpc_test_transit_2"
    }
}

resource "aws_vpc" "vpc_test_transit_1_us" {
    provider   = aws.peer
    cidr_block = "50.0.0.0/16"

    tags = {
        Name = "vpc_test_transit_1_us"
    }
}