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
        
        stage('Push docker image in registry') {
            steps {
                script {
                    withDockerRegistry([credentialsId: registryCredentials, url: ""]) {
                        dockerImage.push()
                    }
                }
            }
        }
     
        agent {
           kubernetes {
              defaultContainer 'python_pyspark'
              yaml 'kubernetes/deployment.yml'
                }
        }
    }
}
