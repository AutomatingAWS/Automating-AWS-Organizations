# this must be a unique email address
# this will be used to perform the root user password reset when cleaning up (deleting) the account
# (or use something like a gmail alias, ex: <username>+aws.orgs.dev@gmail.com)

resource "aws_organizations_account" "dev" {
  count = length(var.dev_root_user_email_address)
  email = var.dev_root_user_email_address
  name = "dev"
  # recommend using default `role_name` which is "OrganizationAccountAccessRole"
  lifecycle {
    ignore_changes = [role_name]
  }
}

locals {
  dev_iam_role = "arn:aws:iam::${aws_organizations_account.dev.id}:role/OrganizationAccountAccessRole"
}

output "dev_account_access_role" {
  value = local.dev_iam_role
}
output "example_assume_role_command" {
  value = "aws sts assume-role --role-arn ${local.dev_iam_role} --role-session-name foo"
}