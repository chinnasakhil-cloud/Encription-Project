pipeline {
  agent any

  environment {
    IMAGE_NAME = "enginehealth-app"     // Docker image name to build
    CONTAINER_NAME = "enginehealth"     // Container name to run
    HOST_PORT = "8080"                  // host port to expose
    CONTAINER_PORT = "8080"             // container port Tomcat exposes
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Prepare') {
      steps {
        script {
          // show which commit we're building
          sh 'echo "Building commit: $(git rev-parse --short HEAD)"'
          // show Docker availability
          sh 'docker --version || true'
          sh 'docker ps -a || true'
        }
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          // Build image from Dockerfile in repo root
          sh "docker build -t ${IMAGE_NAME}:latest ."
        }
      }
    }

    stage('Stop & Remove Old Container') {
      steps {
        script {
          // Stop and remove the old container if it exists
          sh """
            if [ \$(docker ps -q -f name=${CONTAINER_NAME}) ]; then
              echo "Stopping running container ${CONTAINER_NAME}"
              docker stop ${CONTAINER_NAME}
            fi

            if [ \$(docker ps -aq -f name=${CONTAINER_NAME}) ]; then
              echo "Removing container ${CONTAINER_NAME}"
              docker rm ${CONTAINER_NAME}
            fi
          """
        }
      }
    }

    stage('Run New Container') {
      steps {
        script {
          // Run the new container (replace ports / volumes as needed)
          sh """
            docker run -d \
              --name ${CONTAINER_NAME} \
              -p ${HOST_PORT}:${CONTAINER_PORT} \
              ${IMAGE_NAME}:latest
          """
        }
      }
    }

    stage('Smoke Test') {
      steps {
        script {
          // quick check - confirm container is up
          sh 'sleep 3'
          sh 'docker ps --filter name=${CONTAINER_NAME} --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
        }
      }
    }
  }

  post {
    success {
      echo "Deployment succeeded: ${IMAGE_NAME}:latest → ${CONTAINER_NAME}"
    }
    failure {
      echo "Deployment failed. See logs above."
    }
  }
}
