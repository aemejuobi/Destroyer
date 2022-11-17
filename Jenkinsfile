pipeline {
    agent any

    stages {
        stage('Init'){
            steps {
                dir('delete') {
                    withCredentials([
                    string(credentialsId: 'aws-jenkins-secret-key-id', variable: 'key_id'),
                    string(credentialsId: 'aws-jenkins-secret-access-key', variable: 'access_key')]){
                        
                        withEnv(['KEY_ID=${key_id}', 'ACCESS_KEY=${access_key}']){
                            sh 'terraform init'
                        }
                    }
                }
                
            }
        }

        stage('Plan/Validate'){
            steps {
                dir('delete'){
                    withCredentials([
                    string(credentialsId: 'aws-jenkins-secret-key-id', variable: 'key_id')
                    string(credentialsId: 'aws-jenkins-secret-access-key', variable: 'access_key')]){
                        
                        withEnv(['KEY_ID=${key_id}', 'ACCESS_KEY=${access_key}']){
                            sh 'terraform plan'
                            sh 'terraform validate'
                        }
                    }
                }
                
            }
        }

        stage('Hakai'){
            steps {
                dir('delete'){
                    withCredentials([
                    string(credentialsId: 'aws-jenkins-secret-key-id', variable: 'key_id')
                    string(credentialsId: 'aws-jenkins-secret-access-key', variable: 'access_key')]){
                        withEnv(['KEY_ID=${key_id}', 'ACCESS_KEY=${access_key}']){
                            sh 'terraform destroy'
                        }
                    }
                }
            }
        }
    }
}