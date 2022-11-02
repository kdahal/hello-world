pipeline {
    agent any
 
    stages {
        stage ('checkout') {
            steps {
                git 'https://github.com/kdahal/docker-jenkins-integration-sample.git '
            }
        }
        
        
        stage('Mavne Build') {
            steps {
                bat 'mvn clean install'
                
            }
        
        }  
    }
    
    post {
        always { 
            echo 'I will always say Hello again!'
        }
        success {
            echo 'I will say Hello only if job is success'
        }
        failure {
            echo 'I will say Hello only if job is failure'
        }
    
        
        
        
    }
}