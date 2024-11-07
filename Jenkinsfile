pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'jeeva2407/myimage'
        DOCKER_CREDENTIALS_ID = 'dockerhub' // Jenkins Docker Hub credentials ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Make sure the branch is correct and GitHub credentials are set
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
                    // Log in to Docker Hub and push the image to your Docker registry
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        docker.image('helloworld-image').tag("jeeva2407/myimage:latest")  // Correct tag format
                        docker.image('jeeva2407/myimage:latest').push()  // Push the tagged image
                    }
                }
            }
        }
    }
}
