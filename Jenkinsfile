pipeline {
    agent{      
    node { label 'terraform-node'}     
  }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
	    parameters {
        choice(
            name: 'action',
            choices: ['plan', 'apply', 'destroy'], // first option is default option.
            description: 'Select Terraform action'
        )
    }
    stages {
        stage('Checkout Code') {
            steps {
                // Assuming you have your Terraform Files in a SCM like Git
                checkout scm
            }
        }
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }
         stage ("terraform Action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve') 
           }
        }
    }
}
