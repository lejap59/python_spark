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

        stage('Deploying React.js container to Kubernetes') {
             steps {
                 script {
         
                    withAWS(region:'eu-west-1',credentials:'637423173465') {
                       // do something
                       // sh 'kubectl get all -n eks-sample-app'
                       sh 'ls -lart'
                       sh 'ls $HOME'
                       sh 'pwd'
                       sh "$HOME/bin/kubectl get pods -n eks-sample-app"   
                       sh '$HOME/bin/kubectl apply -f eks-sample-deployment.yaml'
                    }
                 }
             }
         }
     }
}
