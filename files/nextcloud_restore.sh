#!/bin/bash -ex

if [ -z "$1" ]
then
      BACKUP_DATE=$(date +%Y-%m-%d -d "yesterday")
else
      BACKUP_DATE="$1"
fi

# cleanup persistent directories
sudo rm -rf /ext/persistent/nextcloud_staging/server/*
sudo rm -rf /ext/persistent/nextcloud_staging/postgresql/*

# create directories
sudo mkdir -p /ext/persistent/nextcloud_staging/postgresql
sudo mkdir -p /ext/persistent/nextcloud_staging/server
sudo mkdir -p /ext/persistent/nextcloud_staging/server/config

# copy postgresql backup file
sudo cp /ext/backup/nextcloud/postgresql/nextcloud-sqlbkp_$BACKUP_DATE.bak /ext/persistent/nextcloud_staging/backup/nextcloud-sqlbkp.bak

# copy postgresql roles backup file
sudo cp /ext/backup/nextcloud/postgresql/nextcloud-sqlbkp-roles_$BACKUP_DATE.bak /ext/persistent/nextcloud_staging/backup/nextcloud-sqlbkp-roles.bak

# copy backup files to persistent directories
sudo rsync -Aax --exclude 'data/stephan/files/Photos/emilia' /ext/backup/nextcloud/server/ /ext/persistent/nextcloud_staging/server/
#sudo rsync -Aax --exclude 'data/stephan/files' --exclude 'data/stephan/uploads' --exclude 'data/appdata_ocxa91b6g425/preview' --exclude 'data/nadine/files' --exclude 'data/nadine/uploads' /ext/backup/nextcloud/server/ /ext/persistent/nextcloud_staging/server/

# update persmissions
sudo chown 1001:1001 -R /ext/persistent/nextcloud_staging/postgresql/
sudo chown 1000:1000 -R /ext/persistent/nextcloud_staging/server/
sudo chown www-data:www-data -R /ext/persistent/nextcloud_staging/server/config

# initialize terraform
terraform -chdir=/ext/repo/gitea_project_automation/terraform/nextcloud_staging init

# apply terraform
terraform -chdir=/ext/repo/gitea_project_automation/terraform/nextcloud_staging apply -auto-approve

# get server pod
POD_SERVER=$(kubectl get pods -n nextcloud-staging -l app.kubernetes.io/component=app --no-headers -o custom-columns=NAME:metadata.name)

# activate maintenance mode
kubectl exec -n nextcloud-staging $POD_SERVER -c nextcloud -- bash -c "su -s /bin/bash www-data -c 'php occ maintenance:mode --on'"

# get database pod
POD_DB=$(kubectl get pods -n nextcloud-staging -l app.kubernetes.io/component=primary --no-headers -o custom-columns=NAME:metadata.name)

# remove and recreate database before restore
## old
#kubectl exec -n nextcloud-staging $POD_DB -- bash -c "psql -d postgres -h localhost -U nextcloud -c \"SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'nextcloud'\"; \
#    psql -d postgres -h localhost -U nextcloud -c \"SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'nextcloud'\"
#    psql -d postgres -h localhost -U nextcloud -q -c 'drop DATABASE nextcloud;'; \
#    psql -d postgres -h localhost -U nextcloud -q -c 'create DATABASE nextcloud;'"

#kubectl exec -n nextcloud-staging $POD_DB -- bash -c "psql -d nextcloud -h localhost -U nextcloud -c 'CREATE DATABASE \"nextcloud\";'"

## new
kubectl exec -n nextcloud-staging $POD_DB -- bash -c "psql -d template1 -h localhost -U nextcloud -c 'DROP DATABASE nextcloud;'"
kubectl exec -n nextcloud-staging $POD_DB -- bash -c "psql -d template1 -h localhost -U nextcloud -c 'CREATE DATABASE nextcloud;'"

# restore roles
#kubectl exec -n nextcloud-staging $POD_DB -- bash -c "psql -d nextcloud -h localhost -U nextcloud -q -c '\i /backup/nextcloud-sqlbkp-roles.bak'"

# restore database
## old
#kubectl exec -n nextcloud-staging $POD_DB -- bash -c "psql -d nextcloud -h localhost -U nextcloud -q -c '\i /backup/nextcloud-sqlbkp.bak'"

## new
kubectl exec -n nextcloud-staging $POD_DB -- bash -c "psql -d nextcloud -h localhost -U nextcloud -q -f /backup/nextcloud-sqlbkp.bak"

# deactivate maintenance mode
kubectl exec -n nextcloud-staging $POD_SERVER -c nextcloud -- bash -c "su -s /bin/bash www-data -c 'php occ maintenance:mode --off'"

# restart pod
kubectl exec -n nextcloud-staging $POD_SERVER -c nextcloud -- bash -c "kill 1"

# destroy terraform
#terraform -chdir=/ext/repo/gitea_project_automation/terraform/nextcloud_staging destroy -auto-approve
