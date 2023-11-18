# mod1

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.favourite](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_my_favourite_key"></a> [my\_favourite\_key](#input\_my\_favourite\_key) | A descriptive description :) | `string` | n/a | yes |
| <a name="input_my_favourite_value"></a> [my\_favourite\_value](#input\_my\_favourite\_value) | A descriptive description :) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_favourite_id"></a> [favourite\_id](#output\_favourite\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
