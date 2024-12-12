all :
		@mkdir -p ~/data ~/data/mariadb/ ~/data/wordpress/
		@docker-compose -f srcs/docker-compose.yml up -d --build 

clean :
		@docker-compose -f srcs/docker-compose.yml down
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
fclean : clean		
		@docker system prune -af
		@sudo rm -rf ~/data/mariadb/ ~/data/wordpress/

re : fclean all

.PHONY : all clean