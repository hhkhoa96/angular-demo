pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-southeast-1'
        S3_BUCKET = 'my-frontend-bucket'
        // NODEJS_HOME = tool name: 'NodeJS', type: 'NodeJSInstallation'
        // PATH = "${NODEJS_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/hhkhoa96/angular-demo'
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

        stage('Test') {
            steps {
                sh 'npm test'
            }
        }

        stage('Deploy') {
            steps {
                withAWS(region: "${AWS_REGION}", credentials: 'aws-cred-id') {
                    s3Upload(bucket: "${S3_BUCKET}", includePathPattern: 'dist/**', workingDir: 'dist')
                }
            }
        }
    }
}
