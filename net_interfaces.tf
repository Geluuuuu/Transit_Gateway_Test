resource "aws_network_interface" "net_interface_vpc_transit_1" {
    provider        = aws.local
    subnet_id       = aws_subnet.subnet_test_transit_1_vpc_1.id
    security_groups = [aws_security_group.allow_ssh_vpc_transit_1.id]
    private_ips     = ["30.0.0.50"]
    tags = {
        Name = "net_interface_vpc_transit_1"
    }
}

resource "aws_network_interface" "net_interface_vpc_transit_2" {
    provider        = aws.local
    subnet_id       = aws_subnet.subnet_test_transit_1_vpc_2.id
    security_groups = [aws_security_group.allow_ssh_vpc_transit_2.id]
    private_ips     = ["40.0.0.50"]
    tags = {
      Name = "net_interface_vpc_transit_2"
    }
}

//us
resource "aws_network_interface" "net_interface_vpc_transit_1_us" {
    provider        = aws.peer
    subnet_id       = aws_subnet.subnet_test_transit_1_vpc_1_us.id
    security_groups = [aws_security_group.allow_ssh_vpc_transit_1_us.id]
    private_ips     = ["50.0.0.50"]
    tags = {
        Name = "net_interface_vpc_transit_1_us"
    }
}