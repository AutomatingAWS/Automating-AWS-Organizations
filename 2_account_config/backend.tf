terraform {
  backend "s3" {
    encrypt = true
    region = "us-east-1"
    key = "aws-orgainzations-demo/account-config/terraform.tfstate"
    # remember to set your bucket here
  }
}