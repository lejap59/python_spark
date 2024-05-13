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

        stage('Deploying lejap59/python_spark container to Kubernetes') {
             steps {
                 script {
         
                    withAWS(region:'eu-west-1',credentials:'637423173465') {
                       // create deployment and service
                       sh '$HOME/bin/kubectl apply -f kubernetes/deployment.yaml'
                       sh '$HOME/bin/kubectl apply -f kubernetes/service.yaml'
                    }
                 }
             }
         }
     }
}
