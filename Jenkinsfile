pipeline {
    agent any

    environment {
        IMAGE_NAME = "sahilghidode/devops-automation-pipeline"
        IMAGE_TAG  = "latest"
        DOCKER_CREDS = credentials('dockerhub-creds')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/SahilGhidode/devops-automation-pipeline.git'
            }
        }

        stage('Build Docker Image') {
    steps {
        sh '''
          pwd
          ls -l
          ls -l app
          docker build --no-cache -t sahilghidode/devops-automation-pipeline:latest .
        '''
    }
}

        stage('Docker Login') {
            steps {
                sh "echo $DOCKER_CREDS_PSW | docker login -u $DOCKER_CREDS_USR --password-stdin"
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                sh "docker push $IMAGE_NAME:$IMAGE_TAG"
            }
        }
    }
}
