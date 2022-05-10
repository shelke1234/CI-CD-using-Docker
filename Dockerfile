FROM tomcat:latest
COPY . .
LABEL maintainer="Dhananjay"

EXPOSE 8080

CMD ["catalina.sh", "run"]
