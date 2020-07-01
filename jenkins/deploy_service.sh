sudo docker volume create jenkins_data

sudo docker service create \
--network net_dev \
--name jenkins \
--publish published=8008,target=8080 \
--publish 50000:50000 \
--mount src=jenkins_data,dst=/var/jenkins_home \
--constraint node.labels.main==true \
localhost:5000/jenkins