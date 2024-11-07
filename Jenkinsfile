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
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
                        sh 'docker tag helloworld-image jeeva2407/myimage:latest'
                        sh 'docker push jeeva2407/myimage:latest'
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Apply Kubernetes Deployment, Service, and HPA
                    sh 'kubectl apply -f deployment.yaml'
                    sh 'kubectl apply -f service.yaml'
                    sh 'kubectl apply -f hpa.yaml'
                }
            }
        }
    }
}
