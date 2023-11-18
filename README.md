# Terrform project template

Sample project for deploying AWS infrastructure using Terraform

https://github.com/Allwyn-UK/plat-tf-template.git

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_squid_ecr"></a> [squid\_ecr](#module\_squid\_ecr) | ./modules/ecr | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account"></a> [account](#input\_account) | Account name abbreviation | `string` | `"prod"` | no |
| <a name="input_account_full"></a> [account\_full](#input\_account\_full) | Account name | `string` | `"Production Account"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"eu-west-2"` | no |
| <a name="input_costcentre"></a> [costcentre](#input\_costcentre) | The cost centre to charge the asset to | `string` | `"123"` | no |
| <a name="input_deployment_mode"></a> [deployment\_mode](#input\_deployment\_mode) | How the resource was deployed | `string` | `"auto"` | no |
| <a name="input_deployment_repo"></a> [deployment\_repo](#input\_deployment\_repo) | The URL of the deployment repo | `string` | n/a | yes |
| <a name="input_deployment_role_arn"></a> [deployment\_role\_arn](#input\_deployment\_role\_arn) | The ARN of role the AWS provider should assume | `string` | `""` | no |
| <a name="input_email"></a> [email](#input\_email) | Email contact for the asset owner | `string` | `"platformengineering@allwyn.co.uk"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name abbreviation in lower case | `string` | `"prod"` | no |
| <a name="input_environment_full"></a> [environment\_full](#input\_environment\_full) | The environment name in full | `string` | `"Production environment for shared services"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | The individual or team owner of the asset | `string` | `"Platform Engineering"` | no |
| <a name="input_project"></a> [project](#input\_project) | Project abbreviation in lower case | `string` | `"ss"` | no |
| <a name="input_project_full"></a> [project\_full](#input\_project\_full) | The project name in full | `string` | `"Shared Services"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
