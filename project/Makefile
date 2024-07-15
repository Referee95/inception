all :
		@mkdir -p ~/Downloads/mariadb/ ~/Downloads/wordpress/
		@docker-compose -f srcs/docker-compose.yml up -d --build 

clean :
		@docker-compose -f srcs/docker-compose.yml down

fclean : clean		
		@docker system prune -a
		@rm -f ~/Downloads/mariadb/ ~/Downloads/wordpress/

re : clean all