pipeline {
    agent any 
    
    environment {
        mavenhome = tool 'jenkins-mvn'
        imageName = "lejap59/cicddemo:latest"
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
                sh "mvn clean -DskipTests install"
            }
        }
        
        stage('Test') {
            steps {
                sh "mvn test"
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
