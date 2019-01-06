# Dockerized HAPI Server

Author: ekivemark
Created: 2019-01-06.01:05

THAPI

Based on:
- Dockerized Tomcat + Postgresql server: https://blog.lukaspradel.com/dockerizing-a-tomcat-postgresql-java-web-application/
- Modified to install James Agnew's HAPI server: http://gretchenmoran.blogspot.com/2018/08/hapi-fhir-example-server-using-docker.html

## Components

- Ubuntu Server 18.04 LTS (HVM), SSD Volume Type (on EC2)
- Docker
- PostgreSQL 9.4
- Tomcat 8
- HAPI FHIR JPA Server by James Agnew 

## Preparing the FHIR server

This installation uses the ../hapi-fhir/hapi-fhir-jpaserver-example/target/hapi-fhir-jpaserver-example.war

The FhirConfig.java files have been modified to replace the
Apache Derby in memory database with PostgreSQL 9.4.

Maven was also updated (pom.xml) to add postgreSQL as a dependency:

    <dependency>
    	<groupId>org.postgresql</groupId>
   		<artifactId>postgresql</artifactId>
    	<version>42.2.5</version>
    </dependency> 
    
The .war file was built using 
    mvn install
    
## Docker Pre-deploy tasks

Go to ./web and run 
    
    ./copy_war_here.sh

This copies the jpaserver-example.war file to the /web directory. This is
necessary because Docker will not copy files from outside the folder context
the deploy is running in. 

Then run docker-compose from the parent directory

    docker-compose up -d 
    
This should deploy postgres and a web server using tomcat 8.

The tomcat server will be available on port 8080.

To access the FHIR server 

    {server url}/fhir

