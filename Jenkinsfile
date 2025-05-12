pipeline {
    agent any
    environment {
        DOCKER_CREDS = credentials('dockerhub-creds')
    }
    stages {
        stage('Build...') {
            steps {
                dir("${env.WORKSPACE}/build") {
                    sh 'chmod +x build.sh'
                    sh './build.sh'
                }
            }
        }
        stage('Development') {
            when { branch 'dev' }
            steps {
                dir("${env.WORKSPACE}/build") {
                    sh 'chmod +x deploy.sh'
                    sh './deploy.sh dev'
                }
            }
        }
        stage('Production') {
            when { branch 'main' }
            steps {
                dir("${env.WORKSPACE}/build") {
                    sh 'chmod +x deploy.sh'
                    sh './deploy.sh prod'
                }
            }
        }
    }
}
