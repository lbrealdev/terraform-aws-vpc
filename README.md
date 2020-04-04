# terraform-aws-vpc

## Use this module

```
From Terraform Registry

module "vpc" {
  source  = "lbrealdev/vpc/aws"
  version = "0.0.1"
  
  cidr_block = "172.0.0.0/16"
}

```
```
From GitHub

provider "aws" {
  region = "eu-central-1"
}

module "vpc" {
  source = "git::github.com/lbrealdev/terraform-aws-groundwork-vpc"

  cidr_block = "172.0.0.0/16"
}
```
```
Terraform module lifecycle

1 - Init terraform

terraform init

2 - Create a new workspace

terraform workspace list

terraform workspace new dev

3 - Check your new workspace

terraform workspace show

4 - Create a plan with plan file

terraform plan -out plan

5 - Apply infrastructure from plan

terraform apply plan

6 - Destroy infrastructure

terraform destroy --force
```


### Update module

```
- The terraform get command is used to download and update modules mentioned in the root module.

terraform get
 
terraform get -update

```