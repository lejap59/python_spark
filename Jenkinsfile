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
        
        stage('Apply Kubernetes files') {
            steps {
                script {
                   withKubeConfig([credentialsId: 'cb27c82b-d9dc-4a9a-aaa7-2ff8ca4a2bef', serverUrl: 'https://192.168.49.2:8443']) {
                        sh 'kubectl apply -f kubernetes/deployment.yaml'
                    }
                }
           }
        }
   }
}
