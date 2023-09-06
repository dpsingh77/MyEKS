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

                withCredentials([string(credentialsId: 'github_token', variable: 'gitHubToken'), string(credentialsId: 'aws_access_key', variable: 'aws_access_key'), string(credentialsId: 'aws_secret_key', variable: 'aws_secret_key')]) {
                    // do something with the file, for instance                     
                sh label: '', script: 'terraform plan -var "githubToken=$gitHubToken" -var "aws_access_key=$aws_access_key" -var "aws_secret_key=$aws_secret_key"'
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
