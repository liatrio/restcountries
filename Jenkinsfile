pipeline {
    agent any
    stages {
        stage('Building Docker Container') {
		 agent{
          docker {
            image 'tomcat:8.0'
          }
		 }
        }
        stage('Run local container') {
            steps {
                sh 'docker rm -f local-restcountries-tomcat || true'
                sh 'docker run -p 19080:8080 -d --network=${LDOP_NETWORK_NAME} --name local-restcountries-tomcat tomcat:8.0'
            }
        }
        stage('Smoke test') {
            steps {
                echo "Running tests"
                sh 'docker rm -f local-restcountries-testing || true'
                sh 'docker run --network=${LDOP_NETWORK_NAME} --name local-restcountries-testing tomcat:8.0'
                //run some tests here
                sh 'docker rm -f local-restcountries-testing || true'
            }
        }
        /*
        stage('Stop local container') {
            steps {
                sh 'docker rm -f local-dromedary || true'
            }
        }
        stage('Deploy to dev') {
            steps {
                sh 'docker rm -f dev-dromedary || true'
                sh 'docker run -p 18081:8080 -d --network=${LDOP_NETWORK_NAME} --name dev-dromedary stelligent-dromedary gulp'
            }
        }
        stage('Smoke test dev') {
            steps {
                echo "Running gulp test dev"
                sh 'docker rm -f dev-dromedary-testing || true'
                sh 'docker run --network=${LDOP_NETWORK_NAME} --name dev-dromedary-testing stelligent-dromedary gulp test'
                echo "Should be accessible at http://localhost:18081"
            }
        }
        stage('Deploy to qa') {
            steps {
                sh 'docker rm -f qa-dromedary || true'
                sh 'docker run -p 18082:8080 -d --network=${LDOP_NETWORK_NAME} --name qa-dromedary stelligent-dromedary gulp'
            }
        }
        stage('Smoke test qa') {
            steps {
                echo "Running gulp test qa"
                sh 'docker rm -f qa-dromedary-testing || true'
                sh 'docker run --network=${LDOP_NETWORK_NAME} --name qa-dromedary-testing stelligent-dromedary gulp test'
                echo "Should be accessible at http://localhost:18082"
                input 'Deploy to Prod?'
            }
        }
        stage('Deploy to prod') {
            steps {
                sh 'docker rm -f prod-dromedary || true'
                sh 'docker run -p 18083:8080 -d --network=${LDOP_NETWORK_NAME} --name prod-dromedary stelligent-dromedary gulp'
            }
        }
        stage('Smoke test prod') {
            steps {
                echo "Running gulp test prod"
                sh 'docker rm -f prod-dromedary-testing || true'
                sh 'docker run --network=${LDOP_NETWORK_NAME} --name prod-dromedary-testing stelligent-dromedary gulp test'
                echo "Should be accessible at http://localhost:18083"
            }
        }
        */
    }
}
