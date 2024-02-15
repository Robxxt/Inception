# Inception

This project covers microservices using Docker and docker-compose.
It automatically creates a wordpress website that is served in the localhost.
For that I create three images starting from the base image which is debian:11. The first one is an nginx server with it's config files.
The second is a mariadb that creates a database and a user with it's credentials. The third is a wordpress container that it's configurating automatically.
