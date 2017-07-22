pipeline {
    agent none
    stages {
        stage('Deploy to Nexus') {
          agent {
            docker {
                image 'maven:3.5.0'
                args '-e INITIAL_ADMIN_USER -e INITIAL_ADMIN_PASSWORD --network=${LDOP_NETWORK_NAME}'
            }
            steps {
                configFileProvider(
                       [configFile(fileId: 'nexus', variable: 'MAVEN_SETTINGS')]) {
                    sh 'mvn -s $MAVEN_SETTINGS clean deploy -DskipTests=true -B'
                }
            }
          }
        }
        stage('Build Container') {
          agent {
            steps {
                sh 'docker built -t restcountries-tomcat .'
            }
          }
        }
        stage('Run local container') {
          agent {
            steps {
                sh 'docker rm -f local-restcountries || true'
                sh 'docker run -p 19080:8080 -d --network=${LDOP_NETWORK_NAME} --name local-restcountries restcountries-tomcat'
            }
          }
        }
        stage('Smoke test') {
          agent {
            steps {
                echo "Running tests"
                //maven test goes here
                //restapi testing goes here
            }
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
