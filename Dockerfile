FROM tomcat:9.0

COPY target/restcountries-2.0.3-SNAPSHOT.war /usr/local/tomcat/webapps/restcountries.war && \
  testing-rest-api.sh /usr/local/tomcat/testing-rest-api.sh
