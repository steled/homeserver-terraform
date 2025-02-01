#!/bin/bash -ex

# initialize terraform
terraform init

# apply terraform
terraform apply --target module.nextcloud_staging -var-file prd.tfvars -auto-approve

# get server pod
POD_SERVER=$(kubectl get pods -n nextcloud-staging -l app.kubernetes.io/component=app --no-headers -o custom-columns=NAME:metadata.name)

# activate maintenance mode
kubectl exec -n nextcloud-staging $POD_SERVER -c nextcloud -- bash -c "su -s /bin/bash www-data -c 'php occ maintenance:mode --on'"

# get database pod
POD_DB=$(kubectl get pods -n nextcloud-staging -l app.kubernetes.io/component=primary --no-headers -o custom-columns=NAME:metadata.name)

# remove and recreate database before restore
kubectl exec -n nextcloud-staging $POD_DB -- bash -c "PGPASSWORD=\$POSTGRES_PASSWORD psql -d template1 -h localhost -U nextcloud -c 'DROP DATABASE nextcloud;'"
kubectl exec -n nextcloud-staging $POD_DB -- bash -c "PGPASSWORD=\$POSTGRES_PASSWORD psql -d template1 -h localhost -U nextcloud -c 'CREATE DATABASE nextcloud;'"

# restore roles (not needed)
#kubectl exec -n nextcloud-staging $POD_DB -- bash -c "PGPASSWORD=\$POSTGRES_PASSWORD psql -d nextcloud -h localhost -U nextcloud -q -c '\i /backup/nextcloud-sqlbkp-roles.bak'"

# restore database
kubectl exec -n nextcloud-staging $POD_DB -- bash -c "PGPASSWORD=\$POSTGRES_PASSWORD psql -d nextcloud -h localhost -U nextcloud -q -f /backup/nextcloud-sqlbkp.bak"

# deactivate maintenance mode
kubectl exec -n nextcloud-staging $POD_SERVER -c nextcloud -- bash -c "su -s /bin/bash www-data -c 'php occ maintenance:mode --off'"

# restart pod
kubectl exec -n nextcloud-staging $POD_SERVER -c nextcloud -- bash -c "kill 1"

# destroy terraform
# terraform destroy --target module.nextcloud_staging -var-file prd.tfvars -auto-approve
#terraform -chdir=/ext/repo/gitea_project_automation/terraform/nextcloud-staging destroy -auto-approve
