pipeline {
    agent any 
    
    environment {
        imageName = "lejap59/python_spark:latest"
        registryCredentials = "docker hub"
        registry = ""
        dockerImage = ""
    }

    tools {
        jdk 'jenkins-jdk'
    }

    stages {
        stage('Build') {
            steps {
                sh "echo 'No build to do'"
            }
        }
        
        stage('Test') {
            steps {
                sh "echo 'No test'"
            }
        }    
        
        stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build imageName
                }
            }
        }    
        
        stage('Deploy') {
            steps {
                script {
                    withDockerRegistry([credentialsId: registryCredentials, url: ""]) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
