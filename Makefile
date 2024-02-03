all:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	sudo docker-compose -f srcs/docker-compose.yml up -d

build:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	sudo docker-compose -f srcs/docker-compose.yml up --build -d

down:
	sudo docker-compose -f srcs/docker-compose.yml down
	sudo docker volume rm mariadb
	sudo docker volume rm wordpress

clean: down

fclean: clean
	sudo rm -Rf ~/data