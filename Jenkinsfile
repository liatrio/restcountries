pipeline {
    agent none
    stages {
        stage('Deploy to Nexus') {
          agent {
            docker {
                image 'maven:3.5.0'
                args '-e INITIAL_ADMIN_USER -e INITIAL_ADMIN_PASSWORD --network=${LDOP_NETWORK_NAME}'
            }
          }
            steps {
                configFileProvider(
                       [configFile(fileId: 'nexus', variable: 'MAVEN_SETTINGS')]) {
                    sh 'mvn -s $MAVEN_SETTINGS clean deploy -DskipTests=true -B'
                }
            }
        }
        stage('Build Container') {
          agent any
            steps {
                sh 'docker build -t restcountries-tomcat .'
            }
        }
        stage('Run local container') {
          agent any
            steps {
                sh 'docker rm -f local-restcountries || true'
                sh 'docker run -p 19080:8080 -d --network=${LDOP_NETWORK_NAME} --name local-restcountries restcountries-tomcat'
            }
        }
        stage('Maven test') {
          agent {
            docker {
               image 'maven:3.5.0'
               args '--network=${LDOP_NETWORK_NAME}'
            }
          }
          steps {
            echo "Running maven test"
            sh "mvn clean -B test -DPETCLINIC_URL=http://restcountries-tomcat:8080/restcountries/"
          }
        }
        stage('API test') {
          agent any
            steps {
                sh "docker cp testing-rest-api.sh local-restcountries:/usr/local/tomcat/"
				sh "docker exec local-restcountries bash ./testing-rest-api.sh"
                //restapi testing goes here
            }
        }
        /*
        stage('Stop local container') {
            steps {
                sh 'docker rm -f local-dromedary || true'
            }
        }
        */
    }
}
