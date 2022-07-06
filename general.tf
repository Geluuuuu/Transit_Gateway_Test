provider "aws" {
    alias = "local"
    region = "eu-west-3"
}

provider "aws" {
    alias = "peer"
    region = "us-west-1"
}