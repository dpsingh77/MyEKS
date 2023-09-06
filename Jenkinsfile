// Jenkins file for EKS Terraform pipeline.

pipeline {
    agent any
    tools {
        terraform 'terraform-156'
    }
    stages {
        stage('Init') {
            steps {
               sh label: '', script: 'terraform init'
               sh 'whoami'
               sh 'pwd'
               sh 'source /tmp/initialize.sh'
            }
        }

        stage('validate') {
            steps {
               sh label: '', script: 'terraform validate'
            }
        }

        stage('Plan') {
            steps {

                withCredentials([file(credentialsId: 'github_token', variable: 'gitHubToken')]) {
                    // do something with the file, for instance 
                    sh 'echo $gitHubToken'
                sh label: '', script: 'terraform plan'
                }
                
            }
        }

        stage('Approve') {
            steps {
               echo "ask for approval"
            }
        }

        stage('Apply') {
            steps {
               echo "apply changes"
            }
        }
    }
}
