#!/bin/bash -ex

cd supermario-service

terraform remote config -backend=s3 \
  -backend-config="bucket=azul-terraform-remote-state" \
  -backend-config="key=terraform-ecs-autoscale-alb/supermario-service.tfstate" \
  -backend-config="region=eu-west-1" \
  -backend-config="encrypt=true"

terraform get --update
terraform plan -var-file service.tfvars
terraform apply -var-file service.tfvars

cd ..
