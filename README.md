# terraspace_env

## Prerequisites

* [terraspace](https://terraspace.cloud/docs/learn/aws/install/)
* [task](https://taskfile.dev/#/installation)
* [tflint](https://github.com/aquasecurity/tfsec)
* [tfsec](https://github.com/terraform-linters/tflint)

## Commands run to initially set this up

```
terraspace new project infra --plugin aws
cd infra
terraspace new stack networking
rm Terrafile
ln -s ../Terrafile .
ln -s ../Taskfile.yml .
```

## Commands run to deploy

```
terraspace bundle
terraspace up STACK
```

## Taskfile.yml

There is also a Taskfile.yml that you can use task to run commands as well.
