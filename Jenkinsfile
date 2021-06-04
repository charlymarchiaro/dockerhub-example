pipeline {
  agent { label 'windows' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('docker-hub')
    KUBERNETES_SERVER = credentials('horse-engine-k8s-server')
    KUBERNETES_TOKEN = credentials('horse-engine-k8s-token')
  }
  stages {
    stage('Build') {
      steps {
        sh 'jenkins/build.sh'
      }
    }
    stage('Test') {
      steps {
        sh 'jenkins/test.sh'
      }
    }
    stage('Dockerhub login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Dockerhub push') {
      steps {
        sh 'jenkins/push.sh'
      }
    }
    stage('Deploy') {
      steps {
        sh 'jenkins/deploy.sh'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
