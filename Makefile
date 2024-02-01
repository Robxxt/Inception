all:
	sudo docker-compose up -d

build:
	sudo docker-compose up --build -d

down:
	sudo docker-compose down

clean: down
# remove the wordpress/public
	@echo removing the volumes ...
	sleep 10
	@sudo docker volume rm $(sudo docker volume ls)

fclean: clean