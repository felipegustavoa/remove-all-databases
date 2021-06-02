up:
	docker-compose up -d

down:
	docker-compose down

remove-databases:
	docker exec -it remove-databases_mysql_1 /bin/bash /var/shell-scripts/remove-databases.sh 
