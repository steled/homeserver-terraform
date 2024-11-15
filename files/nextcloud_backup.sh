#!/bin/bash

sudo find /ext/backup/nextcloud/postgresql/nextcloud-sqlbkp_* -mtime +6 -exec rm {} \;
sudo find /ext/backup/nextcloud/postgresql/nextcloud-sqlbkp-roles_* -mtime +6 -exec rm {} \;

POD_SERVER=$(kubectl get pods -n nextcloud -l app.kubernetes.io/component=app --no-headers -o custom-columns=NAME:metadata.name)
POD_DB=$(kubectl get pods -n nextcloud -l app.kubernetes.io/component=primary --no-headers -o custom-columns=NAME:metadata.name)

kubectl exec -n nextcloud $POD_SERVER -c nextcloud -- bash -c "su -s /bin/bash www-data -c 'php occ maintenance:mode --on'"
sudo rsync -Aax /ext/persistent/nextcloud/server/ /ext/backup/nextcloud/server/

kubectl exec -n nextcloud $POD_DB -- bash -c 'PGPASSWORD=$POSTGRES_PASSWORD pg_dump nextcloud -h localhost -U nextcloud -f /backup/nextcloud-sqlbkp_`date +"%Y-%m-%d"`.bak'
kubectl exec -n nextcloud $POD_DB -- bash -c 'PGPASSWORD=$POSTGRES_PASSWORD pg_dumpall --no-role-passwords -h localhost -U nextcloud -r -f /backup/nextcloud-sqlbkp-roles_`date +"%Y-%m-%d"`.bak'

kubectl exec -n nextcloud $POD_SERVER -c nextcloud -- bash -c "su -s /bin/bash www-data -c 'php occ maintenance:mode --off'"

sudo mv /ext/persistent/nextcloud/backup/nextcloud-sqlbkp_$(date +"%Y-%m-%d").bak /ext/backup/nextcloud/postgresql/
sudo mv /ext/persistent/nextcloud/backup/nextcloud-sqlbkp-roles_`date +"%Y-%m-%d"`.bak /ext/backup/nextcloud/postgresql/
