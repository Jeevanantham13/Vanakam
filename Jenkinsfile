pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/Jeevanantham13/Vanakam.git'
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
                sh 'docker run -d helloworld-image'
            }
        }
        
        stage('Push Docker Image to Registry') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        sh 'docker tag helloworld-image jeeva2407/myimage:latest'
                        sh 'docker push jeeva2407/myimage:latest'
                    }
                }
            }
        }
    }
}
