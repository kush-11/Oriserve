pipeline {
    agent any
    environment {
        registry = "kushsuneja07/oriserve:latest"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stages {
        stage('Cloning Git') {
            steps {
                git 'https://github.com/kush-11/Oriserve.git'
            }
        }
        stage('Building Docker Image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":${env.BUILD_NUMBER}"
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy to AKS') {
            steps {
                script {
                    sh 'kubectl apply -f kubernetes/deployment.yaml'
                }
            }
        }
    }
}
