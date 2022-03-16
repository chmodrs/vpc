#!/bin/sh

rm -rf .terraform

terraform --version
terraform init -backend-config "bucket=tfstate-poc" -backend-config "region=sa-east-1" -backend-config "key=vpc"

if [[ $(terraform workspace list | grep 'production' | wc -l ) = 0 ]]; then
  terraform workspace new production
fi
terraform workspace select production

