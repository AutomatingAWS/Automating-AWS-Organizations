Automating-AWS-Organizations
============================

This repository ties to the following [blogpost]() and demonstrates how to setup and automate AWS Organizations using terraform from the beginning.

It contains enough terraform to spin up an AWS Organization with the following resources:
- Named accounts based on the variable account_names
- AWS Service Directory for each account
- Cross Account Super Horizontal IAM Roles for Tooling Automation

Index
-----
- `1_account_creation`
    - this folder contains terraform to set up a new AWS Account under your root AWS account
    - this is a somewhat separate activity since all subsequent actions 
    are configuration which is completely ephemeral while this part is extremely static
- `2_account_configuration`
    - this folder contains terraform to configure Service Control Polices and automation IAM roles

Caveats
-------
This terraform module will create AWS account attached to your Root AWS Account.
Due to AWS limitations Terraform cannot destroy the new aws accounts when you are finished.
This process is manual, the AWS API/SDK does not support account deletion.  

From the [AWS Docs](https://aws.amazon.com/premiumsupport/knowledge-center/close-aws-account/):
> To close an account, you must be signed in as the AWS account root user of the account.
> If you sign in to an account with an AWS Identity and Access Management (IAM) user or role, you can't close the account.
> 
> Member accounts created using AWS Organizations by default don't have a root password. 
> You must reset the root user password for these accounts before you can sign in as the root user.

To clean up:
- Perform a Root user [password reset](https://aws.amazon.com/premiumsupport/knowledge-center/recover-aws-password/) on the child AWS account
    - warning: this must be done before running terraform destroy
- run `terraform destroy` to destroy all resources 
  and remove the child AWS resources (policies/roles/etd). 
- Log in to the child account with the root user, navigate to account settings, and delete the account  

Dependencies
------------
- Terraform 13.X
- AWS Account and Credentials

How to Deploy
-------------
- Clone the repository
- `terraform init`
- `terraform apply`

How to Develop
--------------
- Clone the repository
- `terraform init`
- `terraform plan` and `terraform apply`

Links
-----
- Create AWS Org and Account
    - https://aws.amazon.com/blogs/security/how-to-use-aws-organizations-to-automate-end-to-end-account-creation/ 