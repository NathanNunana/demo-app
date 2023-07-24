def gitName = env.GIT_BRANCH
def jobName = env.JOB_NAME

pipeline {
  // agent {
  //     label 'jenkins-node-python-agent'
  //   }
  agent any
  tools {nodejs "node18"}
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

    stage("Build Image"){
      steps{
        echo "Building docker image"
      }
    }

    stage("Pushing Image To Registry"){
      steps{
        echo "Pushing image to registry"
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
 