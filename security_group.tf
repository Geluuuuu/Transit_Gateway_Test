resource "aws_security_group" "allow_ssh_vpc_transit_1" {
    provider = aws.local
    name     = "allow_ssh_sg_vpc_transit_1"
    vpc_id   = aws_vpc.vpc_test_transit_1.id

    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "ICMP"
        from_port   = -1
        protocol    = "icmp"
        to_port     = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "allow_ssh_vpc_transit_2" {
    provider = aws.local
    name     = "allow_ssh_sg_vpc_transit_2"
    vpc_id   = aws_vpc.vpc_test_transit_2.id

    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "ICMP"
        from_port   = -1
        protocol    = "icmp"
        to_port     = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
}

//////////
///US////
/////////
resource "aws_security_group" "allow_ssh_vpc_transit_1_us" {
    provider = aws.peer
    name     = "allow_ssh_sg_vpc_transit_1_us"
    vpc_id   = aws_vpc.vpc_test_transit_1_us.id

    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "ICMP"
        from_port   = -1
        protocol    = "icmp"
        to_port     = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
}