pipeline {
  agent any
  environment {
    IMAGE_NAME = 'chaitanyapandeygspann/DSSP-TargetP-11'
    SONAR_PROJECT = 'DSSP-TargetP-11'
  }
  stages {
    stage('Checkout') {
      steps { checkout scm }
    }
    stage('Build') {
      steps {
        sh 'pip install -r requirements.txt'
      }
    }
    stage('SonarQube Analysis') {
      steps {
        withSonarQubeEnv('sonarqube') {
          sh 'sonar-scanner -Dsonar.projectKey=$SONAR_PROJECT -Dsonar.sources=. -Dsonar.language=py -Dsonar.python.coverage.reportPaths=coverage.xml'
        }
      }
    }
    stage('Docker Build & Push') {
      steps {
        script {
          docker.withRegistry('', 'dockerhub-credentials') {
            docker.build(IMAGE_NAME).push(env.BUILD_NUMBER)
            docker.build(IMAGE_NAME).push('latest')
          }
        }
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying to production environment'
      }
    }
  }
  post {
    failure { echo 'Pipeline failed!' }
    success { echo 'Pipeline succeeded!' }
  }
}