pipeline {

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
     
        stage('Deploy to k8s'){
           steps{
              script{
                  kubeconfig(credentialsId: '59702e19-261c-47a6-8380-faf5215b7103', serverUrl: 'https://192.168.49.2:8443') {
                    sh 'kubectl apply -f deployment.yml'
                    sh 'kubectl rollout restart -f deployment.yml'
                    sh 'kubectl apply -f service.yml'
                }
            }
           }
        }
    }
}
