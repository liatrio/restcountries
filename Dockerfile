FROM tomcat:9.0

COPY target/restcountries-2.0.2.war /usr/local/tomcat/webapps/restcountries-2.0.3-SNAPSHOT.war
