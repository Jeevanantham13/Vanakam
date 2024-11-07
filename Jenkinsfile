pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the GitHub repository
                git 'https://github.com/Jeevanantham13/Vanakam.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                script {
                    docker.build('helloworld-image')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the Docker container to execute the Java program
                script {
                    docker.image('helloworld-image').run()
                }
            }
        }
    }
}
