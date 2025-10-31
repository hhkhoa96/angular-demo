pipeline {
    agent any

    environment {
        PATH = "/var/jenkins_home/.nvm/versions/node/v22.21.1/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/hhkhoa96/angular-demo'
            }
        }

        stage('Install dependencies') {
            steps {
                sh 'node -v'
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
    }
}
