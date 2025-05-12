pipeline {
    agent any

    environment {
        DOCKER_CREDS = credentials('dockerhub-creds')
        BUILD_DIR = '/home/ubuntu/devops-build/build'
    }

    stages {
        stage('Build...') {
            steps {
                script {
                    // Ensure the directory exists and is owned by the correct user
                    sh "sudo mkdir -p ${BUILD_DIR} && sudo chown -R \$(whoami) ${BUILD_DIR}"
                }
                dir("${BUILD_DIR}") {
                    sh './build.sh'
                }
            }
        }

        stage('Development') {
            when { branch 'dev' }
            steps {
                dir("${BUILD_DIR}") {
                    sh './deploy.sh dev'
                }
            }
        }

        stage('Production') {
            when { branch 'main' }
            steps {
                dir("${BUILD_DIR}") {
                    sh './deploy.sh prod'
                }
            }
        }
    }
}
