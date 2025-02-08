pipeline {
    agent any

    environment {
        BRANCH_NAME = "${env.BRANCH_NAME}"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub repository
                git branch: 'main', url: 'https://github.com/curtbrink/habitdew-svelte'
            }
        }

        stage('Build') {
            steps {
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                // Run tests if applicable
                sh 'npm test'
            }
        }

        stage('Deploy') {
            steps {
                // Deploy your app if needed (e.g., to a staging server)
                sh 'echo This is where a deploy would go'
            }
        }
    }
}