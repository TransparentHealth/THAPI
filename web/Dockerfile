FROM tomcat:8-jre8  
MAINTAINER ekivemark

RUN echo "export JAVA_OPTS=\"-Dapp.env=staging\"" > /usr/local/tomcat/bin/setenv.sh  

COPY ./hapi-fhir-jpaserver-example.war /usr/local/tomcat/webapps/fhir.war

CMD ["catalina.sh", "run"]  