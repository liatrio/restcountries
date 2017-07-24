FROM tomcat:9.0

COPY target/restcountries-2.0.3-SNAPSHOT.war testing-rest-api.sh /usr/local/tomcat/webapps/
