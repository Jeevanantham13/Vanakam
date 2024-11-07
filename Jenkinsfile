pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Jeevanantham13/Vanakam.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage= docker.build('helloworld-image')+ ":$BUILD_NUMBER"
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'docker run -d helloworld-image'
            }
        }
        stage('Push Docker Image to Registry') {
            steps {
                script {
                    docker.withRegistry('', 'dockerhub') {
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}
