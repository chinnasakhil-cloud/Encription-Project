pipeline {
    agent any

    stages {

        stage('Pull Code') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/chinnasakhil-cloud/Encription-Project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t enginehealth-app .'
                }
            }
        }

        stage('Stop Old Container') {
            steps {
                script {
                    sh 'docker stop enginehealth || true'
                    sh 'docker rm enginehealth || true'
                }
            }
        }

        stage('Run New Container') {
            steps {
                script {
                    sh '''
                        docker run -d \
                        --name enginehealth \
                        -p 8080:8080 \
                        enginehealth-app
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "Deployment Successful!"
        }
        failure {
            echo "Deployment Failed!"
        }
    }
}
