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

                // grab the app name and version from the package.json
                script {
                    def packageJson = readJSON file: 'package.json'
                    def hdVersion = packageJson.version
                    def hdName = packageJson.name
                    
                    env.HD_VERSION = hdVersion
                    env.HD_NAME = hdName
                }
            }
        }

        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image and tag it with the version
                    def imageName = "${env.HD_NAME}:${env.HD_VERSION}"
                    sh "docker build -t ${imageName} ."
                }
            }
        }
    }
}