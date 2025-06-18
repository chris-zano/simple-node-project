pipeline {
    agent any
    
    tools {
        nodejs 'node20'
    }
    
    stages {
        stage('Checkout repo') {
            steps {
                checkout scm
            }
        }
        stage('Hello') {
            steps {
                sh 'node main.js'
            }
        }
    }
}
