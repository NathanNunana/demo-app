pipeline {
  // agent {
  //     label 'jenkins-node-python-agent'
  //   }
  agent any
  
  stages{
    stage("Install dependencies"){
      steps {
        echo "Installing dependencies"
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
}
 