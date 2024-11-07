pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'jeeva2407/myimage'
        DOCKER_CREDENTIALS_ID = 'dockerhub' // Jenkins Docker Hub credentials ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Jeevanantham13/Vanakam.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('helloworld-image')
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('helloworld-image').run()
                }
            }
        }
        stage('Push Docker Image to Registry') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        // Tag the image correctly before pushing
                        docker.image('helloworld-image').tag("jeeva2407/myimage:latest")
                        docker.image('jeeva2407/myimage:latest').push()  // Push the tagged image
                    }
                }
            }
        }
    }
}
