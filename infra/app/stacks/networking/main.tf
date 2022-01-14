resource "random_pet" "this" {
  length = 2
}

locals {
  region = "ca-central-1"
}

#tfsec:ignore:aws-s3-enable-bucket-encryption
#tfsec:ignore:aws-s3-enable-bucket-logging
#tfsec:ignore:aws-s3-specify-public-access-block
module "bucket" {
  source = "../../modules/simple-s3"
  bucket = "bucket-${random_pet.this.id}"
  acl    = var.acl
}

module "vpc" {
  source = "../../modules/vpc"

  # name = "${TS_ENV}"
  name = "demo"
  cidr = "10.0.0.0/16"

  azs             = ["${local.region}a", "${local.region}b", "${local.region}d"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_ipv6 = false

  enable_nat_gateway = false
  single_nat_gateway = true

  tags = {
    Owner = "test"
    # Environment = "${TS_ENV}"
    Environment = "demo"
  }

  vpc_tags = {
    # Name = "${TS_ENV}"
    Name = "demo"
  }
}
