pipeline {
    agent any

    tools {
        nodejs 'node20'
        dockerTool 'docker' 
    }

    environment {
        DOCKERHUB_USERNAME = credentials('dockerhub-username') 
        DOCKERHUB_PASSWORD = credentials('dockerhub-password') 
        IMAGE_NAME = "chrisncs/simple-pipeline:latest"
    }

    stages {
        stage('Checkout repo') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                sh '''
                    echo "$DOCKERHUB_PASSWORD" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin
                '''
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh 'docker push $IMAGE_NAME'
            }
        }
    }
}
