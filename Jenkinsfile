// Jenkins file for EKS Terraform pipeline.

pipeline {
    agent any
    stages {
        stage('Init') {
            steps {
               sh label: '', script: 'terraform init'
            }
        }

        stage('validate') {
            steps {
               sh label: '', script: 'terraform validate'
            }
        }

        stage('Plan') {
            steps {
               sh label: '', script: 'terraform plan'
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
