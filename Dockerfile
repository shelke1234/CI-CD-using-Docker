FROM tomcat:latest

LABEL maintainer="Dhananjay"

EXPOSE 8080

CMD ["catalina.sh", "run"]
