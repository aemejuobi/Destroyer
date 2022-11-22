pipeline {
    agent any

    stages {
        
        stage('Hakai(Destroy)'){
            steps {
                dir('../aws-connect/connect_infrastructure'){
                    withCredentials([
                    string(credentialsId: 'aws-jenkins-secret-key-id', variable: 'key_id'),
                    string(credentialsId: 'aws-jenkins-secret-access-key', variable: 'access_key')]){
                        withEnv(['KEY_ID=${key_id}', 'ACCESS_KEY=${access_key}']){
                            sh 'terraform destroy -auto-approve'
                        }
                    }
                }
            }
        }
    }
}