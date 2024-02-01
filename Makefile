all:
	sudo docker-compose -f srcs/docker-compose.yml up -d

build:
	sudo docker-compose -f srcs/docker-compose.yml up --build -d

down:
	sudo docker-compose -f srcs/docker-compose.yml down

clean: down
# remove the wordpress/public
	@echo removing the volumes ...
	@sleep 4
	@sudo docker volume rm srcs_db_volume

fclean: clean