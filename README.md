# Automating-AWS-Organizations

This repository ties to the following [blogpost]() and demonstrates how to setup and automate AWS Organizations using terraform from the beginning.

It contains enough terraform to spin up an AWS Organization with the following resources:

* Named accounts based on the variable account_names
* AWS Service Directory for each account
* Cross Account Super Horizontal IAM Roles for Tooling Automation

## Dependencies

* Terraform 13.X
* AWS Credentials

## How to Develop

Pull down the repository, ...