pipeline {
    agent any
        environment {
        DOCKER_CREDS = credentials('dockerhub-creds') // Auto-injects DOCKER_CREDS_USR and DOCKER_CREDS_PSW
    stages {
        stage('Build...') {
            steps {
                dir('/home/ubuntu/devops-build/build/') { // Enter directory
                    sh './build.sh'
                }
            }
        }
        stage('Development') {
            when { branch 'dev' } //git hub branch 
            steps {
                dir('/home/ubuntu/devops-build/build/') { // Enter directory again
                    sh './deploy.sh dev'
                }
            }
        }
        stage('production') {
            when { branch 'main' } //git hub branch 
            steps {
                dir('/home/ubuntu/devops-build/build/') { // Enter directory again
                    sh './deploy.sh prod'
                }
            }
        }
    }
}
}