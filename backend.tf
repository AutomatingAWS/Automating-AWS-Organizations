terraform {
  backend "s3" {
    encrypt = true
    region = "us-east-1"
    key = "aws-organizations-demo/account-creation/terraform.tfstate"
    # remember to set your bucket here
  }
}