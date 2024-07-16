## Terraform: How to run templates

### Getting Started
## Cloning the Repo

You can install Git followign the instructions [here](https://www.atlassian.com/git/tutorials/install-git).
Use git credentials provided in the assignment email to clone the CodeCommit repository.


## Pre-requisite to run Terraform

Having Terraform ClI

You can install Terraform following the instructions [here](https://learn.hashicorp.com/terraform/getting-started/install).

Once you have Terraform installed successfully, you should configure the [AWS Credentials](https://www.terraform.io/docs/providers/aws/index.html)


### Inputs
The project require the following variables:


Variable name | description |default | 
--- | --- | --- |
AWS region | region that resources will be deployed in | eu-west-2 | 
AWS bucket_name | backet that will store the backup | my-backup-bucket | 
AWS instance_type | EC2 instance type | t2.micro | 
backup_path | the directory that will be backuped | n/a | 
ami_version | the ami version used for ec2 instance | amzn2 (amazon linux 2) |


### Resources

The project should be created these resources in London region:


Resource | Resource name | Description |
--- | --- | --- |
AWS EC2 instance | aws_instance | ec2 instance with public IP|
AWS instance profile | aws_iam_instance_profile | instance profile to be attched to the instance |
AWS IAM role| aws_iam_role | role to be attched to instance profile|
AWS IAM policy | aws_iam_policy | iam policy json list permissions for grant access for the instance to s3 bucket|
Policy role attachment| aws_iam_role_policy_attachment | attachment the iam role and iam policy |
AWS security group| aws_security_group | security group to allow/deny access to the instance|
Bash script | Bash | Bash script will run at 2 AM to backup spesfic dir to ```/home/ec2-user/backup``` and push it to S3 backet ```my-backup-bucketbacket``` |

### Deploy scripts
To execute Terraform you should run the commands below. 

**_NOTE:_** The command line will ask for the directory that will be backuped

```shell
terraform init
terraform plan
terraform apply
```

### Output
When you deploy this script, EC2 instance public IP will be printed 

## Clean Up
When you are done ***(everything tested)***, run:

```shell
terraform destroy
```