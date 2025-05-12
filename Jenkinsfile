pipeline {
    agent any

    environment {
        DOCKER_CREDS = credentials('dockerhub-creds') // Provides DOCKER_CREDS_USR and DOCKER_CREDS_PSW
    }

    stages {
        stage('Build') {
            steps {//
                dir('scripts') {
                    sh './build.sh'
                }
            }
        }

        stage('Deploy to Development') {
            when {
                branch 'dev'
            }
            steps {
                dir('scripts') {
                    sh './deploy.sh dev'
                }
            }
        }

        stage('Deploy to Production') {
            when {
                branch 'main'
            }
            steps {
                dir('scripts') {
                    sh './deploy.sh prod'
                }
            }
        }
    }
}
