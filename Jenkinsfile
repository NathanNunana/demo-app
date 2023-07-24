pipeline {
  // agent {
  //     label 'jenkins-node-python-agent'
  //   }
  agent any

  tools {nodejs "node18"}

  environment{
    APP_NAME = " login-screen-cicd"
    RELEASE = "1.0.0"
    DOCKER_USER = "caleb9083"
    DOCKER_PASS = "dockerhub"
    IMAGE_NAME = "${DOCKER_USER}" + "/" + "${APP_NAME}"
    IMAGE_TAG = "${RELEASE}-${BUILD_NUMBER}"
  }

  stages{
    stage("Install dependencies"){
      steps {
        sh "yarn"
      }
    }

    stage("Run Linters"){
      steps {
        echo "Linting and formatting code"
      }
    }

    stage("Run Unit Testing"){
      steps{
        echo "Unit Testing Application"
      }
    }

    stage("Build & Push Image"){
      steps{
        script{
          docker.withRegistry("", DOCKER_PASS){
            docker_image = docker.build "${IMAGE_NAME}"
          }

          docker.withRegistry("", DOCKER_PASS){
            docker_image.push($"{IMAGE_TAG}")
            docker_image.push("latest")
          }
        }
      }
    }

  
  }
  post {
    always {
      echo 'One way or another, I have finished'
      cleanWs()
    }

    success {
      script {
        echo "Everything was successful"
      }
    }

    unstable {
      echo 'I am unstable :/'
    }

    failure {
      script {
        echo "Failure everywhere"
      }
    }

    changed {
      echo 'Things were different before...'
    	}
  }
}
 