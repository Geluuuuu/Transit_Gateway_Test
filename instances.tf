resource "aws_instance" "instance_test_vpc_1" {
    provider          = aws.local
    ami               = "ami-0f5094faf16f004eb"
    instance_type     = "t2.micro"
    availability_zone = "eu-west-3a"
    key_name          = "calin_keypair"
    network_interface {
      device_index         = 0
      network_interface_id = aws_network_interface.net_interface_vpc_transit_1.id
    }
    tags = {
        Name = "instance_test_vpc_1"
    }
    user_data = <<EOF
                  #!/bin/bash
                  sudo yum update -y
                EOF
}

resource "aws_instance" "instance_test_vpc_2" {
    provider          = aws.local
    ami               = "ami-0f5094faf16f004eb"
    instance_type     = "t2.micro"
    availability_zone = "eu-west-3a"
    key_name          = "calin_keypair"
    network_interface {
      device_index         = 0
      network_interface_id = aws_network_interface.net_interface_vpc_transit_2.id
    }
    tags = {
      Name = "instance_test_vpc_2"
    }
    user_data = <<EOF
                  #!/bin/bash
                  sudo yum update -y
                EOF
}


//////////
////US////
//////////
resource "aws_instance" "instance_test_vpc_1_us" {
    provider          = aws.peer
    ami               = "ami-0d9858aa3c6322f73"
    instance_type     = "t2.micro"
    availability_zone = "us-west-1b"
    key_name          = "calin_us_keypair"
    network_interface {
        device_index         = 0
        network_interface_id = aws_network_interface.net_interface_vpc_transit_1_us.id
    }
    tags = {
        Name = "instance_test_vpc_1_us"
    }
    user_data = <<EOF
                  #!/bin/bash
                  sudo yum update -y
                EOF
}