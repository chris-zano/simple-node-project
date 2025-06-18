pipeline {
    agent any

    tools {
        nodejs 'node20'
        dockerTool 'docker' 
    }

    environment {
        DOCKERHUB_USERNAME = credentials('dockerhub-username') 
        DOCKERHUB_PASSWORD = credentials('dockerhub-password') 
        IMAGE_NAME = "chrisncs/simple-pipeline-gtp-node:latest"
    }

    stages {
        stage('Checkout repo') {
            steps {
                checkout scm
            }
        }

        // stage('Build Docker Image') {
        //     steps {
        //         sh 'docker build -t $IMAGE_NAME .'
        //     }
        // }

        stage('Login, Build and Push Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-hub-credentials', url:'') {
                        def image = docker.image("$IMAGE_NAME")
                        image.push()
                    }     
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh 'docker push $IMAGE_NAME'
            }
        }
    }
}
