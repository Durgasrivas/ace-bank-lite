FROM tomcat:10.1-jdk17

COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8081

CMD ["catalina.sh", "run"]