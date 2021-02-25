mv /etc/apt/sources.list /etc/apt/sourses.list.backup

# Postgres
docker pull postgres:10.16-alpine
docker run --name postgres -d --name postgres --restart always -e POSTGRES_USER='postgres' -e POSTGRES_PASSWORD='postgres' -e ALLOW_IP_RANGE=0.0.0.0/0 -v /etc/postgres/data:/var/lib/postgresql -p 5432:5432 postgres:10.16-alpine

# RabbitMQ
docker pull rabbitmq:3.8.3-management
docker run -d -p 5672:5672 -p 15672:15672 --name rabbitmq --restart=always rabbitmq:3.8.3-management

# Redis
docker pull redis:6.0
docker run --name redis --restart=always -p 6379:6379 -d redis:6.0 redis-server --appendonly yes

# Portainer
docker pull portainer
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9001:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce


