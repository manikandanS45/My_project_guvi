pipeline {
    agent any

    environment {
        DOCKER_CREDS = credentials('dockerhub-creds') // Auto-injects DOCKER_CREDS_USR and DOCKER_CREDS_PSW
    }

    stages {
        stage('Build...') {
            steps {
                dir('/home/ubuntu/devops-build/build/') {
                    sh './build.sh'
                }
            }
        }

        stage('Development') {
            when {
                branch 'dev'
            }
            steps {
                dir('/home/ubuntu/devops-build/build/') {
                    sh './deploy.sh dev'
                }
            }
        }

        stage('Production') {
            when {
                branch 'main'
            }
            steps {
                dir('/home/ubuntu/devops-build/build/') {
                    sh './deploy.sh prod'
                }
            }
        }
    }
}
