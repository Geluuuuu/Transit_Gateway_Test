resource "aws_eip" "elastic_ip_instance_1_vpc_1" {
    provider                  = aws.local
    network_interface         = aws_network_interface.net_interface_vpc_transit_1.id
    vpc                       = true
    associate_with_private_ip = "30.0.0.50"
}

resource "aws_eip" "elastic_ip_instance_1_vpc_2" {
    provider                  = aws.local
    network_interface         = aws_network_interface.net_interface_vpc_transit_2.id
    vpc                       = true
    associate_with_private_ip = "40.0.0.50"
}

resource "aws_eip" "elastic_ip_instance_1_vpc_1_us" {
    provider                  = aws.peer
    network_interface         = aws_network_interface.net_interface_vpc_transit_1_us.id
    vpc                       = true
    associate_with_private_ip = "50.0.0.50"
}