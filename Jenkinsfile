pipeline {
  agent { label 'windows' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('docker-hub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'jenkins/build.sh'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'jenkins/push.sh'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
