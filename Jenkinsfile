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
        stage('Maven test for local') {
          agent {
            docker {
               image 'maven:3.5.0'
               args '--network=${LDOP_NETWORK_NAME}'
            }
          }
          steps {
            echo "Running maven test"
            sh "mvn clean -B test -DPETCLINIC_URL=http://local-restcountries:8080/restcountries/"
          }
        }
        stage('API test for local') {
          agent any
            steps {
              sh "docker exec local-restcountries bash testing-rest-api.sh"
            }
        }
        stage('Stop local container') {
		  agent any
            steps {
                sh 'docker rm -f local-restcountries || true'
            }
        }
        stage('Deploy to dev') {
		  agent any
            steps {
                sh 'docker rm -f dev-restcountries || true'
                sh 'docker run -p 19081:8080 -d --network=${LDOP_NETWORK_NAME} --name dev-restcountries restcountries-tomcat'
            }
        }
        stage('Maven test for dev') {
          agent {
            docker {
               image 'maven:3.5.0'
               args '--network=${LDOP_NETWORK_NAME}'
            }
          }
          steps {
            echo "Running maven test"
            sh "mvn clean -B test -DPETCLINIC_URL=http://dev-restcountries:8080/restcountries/"
          }
        }
        stage('API test for dev') {
          agent any
            steps {
              sh "docker exec dev-restcountries bash testing-rest-api.sh"
            }
        }
        stage('Deploy to qa') {
		  agent any
            steps {
                sh 'docker rm -f qa-restcountries || true'
                sh 'docker run -p 19082:8080 -d --network=${LDOP_NETWORK_NAME} --name qa-restcountries restcountries-tomcat'
            }
        }
        stage('Maven test for qa') {
          agent {
            docker {
               image 'maven:3.5.0'
               args '--network=${LDOP_NETWORK_NAME}'
            }
          }
          steps {
            echo "Running maven test"
            sh "mvn clean -B test -DPETCLINIC_URL=http://qa-restcountries:8080/restcountries/"
          }
        }
        stage('API test for qa') {
          agent any
            steps {
                sh "docker exec qa-restcountries bash testing-rest-api.sh"
                input 'Deploy to Prod?'
            }
        }
        stage('Deploy to prod') {
          agent any
          steps {
              sh 'docker rm -f prod-restcountries || true'
              sh 'docker run -p 19083:8080 -d --network=${LDOP_NETWORK_NAME} --name prod-restcountries restcountries-tomcat'
          }
        }
        stage('Maven test for prod') {
          agent {
            docker {
               image 'maven:3.5.0'
               args '--network=${LDOP_NETWORK_NAME}'
            }
          }
          steps {
            echo "Running maven test"
            sh "mvn clean -B test -DPETCLINIC_URL=http://prod-restcountries:8080/restcountries/"
          }
        }
        stage('API test for prod') {
          agent any
            steps {
                sh "docker exec prod-restcountries bash ./testing-rest-api.sh"
            }
        }
    }
}
