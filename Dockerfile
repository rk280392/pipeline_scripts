FROM devopsedu/webapp
COPY website_project /var/www/html/
EXPOSE 8223
CMD ["apachectl", "-D", "FOREGROUND"]
