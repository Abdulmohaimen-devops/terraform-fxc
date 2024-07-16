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


### Deployment

The project should be created these resources in London region:

1. AWS EC2 instance
2. AWS instance profile
3. AWS IAM role
4. AWS IAM policy
5. AWS security group
6. Bash script will run at 2 AM to backup dir ```/home/ec2-user/backup``` and push it to S3 backet ```my-backup-bucketbacket```


To execute Terraform you should run the commands below.

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