# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "kumar.dahal@outlook.com" 
COPY ./webapp.war /usr/local/tomcat/webapps