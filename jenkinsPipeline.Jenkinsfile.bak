import groovy.json.JsonSlurperClassic

pipeline {
    agent any

    environment { 
        NAME = 'vignesh'
    }

    parameters {
        choice(name: 'environment', choices: ['dev', 'uat', 'prod'], description: 'Select environment to deploy')
    }
    stages {
        stage('Maven Version Check') {
            steps {
                bat 'mvn -v'
                
            }
            
            
            
        }
        
        stage('Git Clone') {
            steps {
                git 'https://github.com/kdahal/hello-world.git'
                
            }
            
            
            
        }
        
        stage('Mavne Clean') {
            steps {
                bat 'mvn clean test package'
                
            }
        }
        
        
        stage('Nexus Upload') {
            steps {
                nexusArtifactUploader artifacts: [[artifactId: 'maven-project', classifier: '', file: 'webapp\\target\\', type: 'war']], credentialsId: 'Nexus', groupId: 'com.example.maven-project', nexusUrl: '192.168.0.17:8081/', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots', version: '1.0-SNAPSHOT'
                
            }
        }
        
        stage('Deploy') {
            steps {
                deploy adapters: [tomcat8(credentialsId: 'deployer', path: '', url: 'http://localhost:8090/manager/text/deploy?config=file:/path/context.xml')], contextPath: null, war: '**/*.war'
                
            }
            
            
            
        }


        
        stage('archive') {
            steps {
                archiveArtifacts artifacts: '**', followSymlinks: false
                
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