# root account
provider "aws" {
  region = "us-east-1"
  alias = "root"
}

# Get the dev account's OrganizationAccountAccessRole
data "aws_organizations_organization" "root" {
  provider = aws.root
}

locals {
  dev_account_id = data.aws_organizations_organization.root.non_master_accounts.*.id[0]
  dev_account_arn = "arn:aws:iam::${local.dev_account_id}:role/OrganizationAccountAccessRole"
}

provider "aws" {
  region = "us-east-1"
  alias = "dev"
  assume_role {
    role_arn = local.dev_account_arn
  }
}

# Create resources
resource "aws_sns_topic" "dev_foo" {
  
}