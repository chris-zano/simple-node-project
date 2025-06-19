pipeline {
    agent any

    tools {
        nodejs 'node20'
        dockerTool 'docker' 
    }

    environment {
        DOCKERHUB_USERNAME = credentials('dockerhub-username') 
        DOCKERHUB_PASSWORD = credentials('dockerhub-password') 
        IMAGE_NAME = "your-dockerhub-username/simple-pipeline-gtp-node:latest"
    }

    stages {
        stage('Checkout repo') {
            steps {
                checkout scm
            }
        }

        stage('Build Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME .'   
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
                    sh "docker push $IMAGE_NAME"
                }
            }
        }
    }
}
