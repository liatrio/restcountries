FROM tomcat:9.0

COPY target/restcountries-2.0.3-SNAPSHOT.war webapps/restcountries.war
COPY testing-rest-api.sh .
