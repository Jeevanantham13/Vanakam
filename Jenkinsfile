pipeline {
    agent any

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
    }
}
