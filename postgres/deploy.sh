# execute on node which is used for dev db
sudo docker volume create postgres_dev_data

# execute on node which is used for prod db
sudo docker volume create postgres_prod_data

# everything below execute on any manager node
openssl rand -base64 16 | sudo docker secret create postgres_dev_password -
openssl rand -base64 16 | sudo docker secret create postgres_prod_password -

sudo docker service create \
--name postgres_dev \
--secret source=postgres_dev_password,target=postgres_dev_password \
-e POSTGRES_PASSWORD_FILE=/run/secrets/postgres_dev_password \
-e POSTGRES_USER=dev \
-e POSTGRES_DB=dev \
--network net_dev \
--mount src=postgres_dev_data,dst=/var/lib/postgresql/data \
--constraint node.labels.db_dev==true \
postgres:12.3

sudo docker service create \
--name postgres_prod \
--secret source=postgres_prod_password,target=postgres_prod_password \
-e POSTGRES_PASSWORD_FILE=/run/secrets/postgres_prod_password \
-e POSTGRES_USER=prod \
-e POSTGRES_DB=prod \
--network net_prod \
--mount src=postgres_prod_data,dst=/var/lib/postgresql/data \
--constraint node.labels.db_prod==true \
postgres:12.3