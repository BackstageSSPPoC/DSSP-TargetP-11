
pipeline {
    agent any

    environment {
        DSSP-TargetP-11 = 'DSSP-TargetP-11'
        chaitanyapandeygspann/DSSP-TargetP-11 = 'chaitanyapandeygspann/DSSP-TargetP-11'
        DOCKER_TAG = "1.0.${BUILD_NUMBER}"
        IMAGE_TAG = "${chaitanyapandeygspann/DSSP-TargetP-11}:${DOCKER_TAG}"
        DEPLOY_ENV = 'default'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        
stage('Build') {
    steps {
        sh 'pip install -r requirements.txt'
    }
}


        
stage('Test') {
    steps {
        sh ''
    }
}


        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'sonar-scanner'

                    withSonarQubeEnv('SonarQube') {

                        
sh """

"""

                    }
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${IMAGE_TAG} .'
            }
        }

        stage('Push Docker Image') {
            steps {
                
withCredentials([usernamePassword(
    credentialsId: 'dockerhub-credentials',
    usernameVariable: 'DOCKER_USER',
    passwordVariable: 'DOCKER_PASS'
)]) {

    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'

    sh 'docker push ${IMAGE_TAG}'
}

            }
        }

        
stage('GitOps Deploy') {
    steps {
        echo 'Updating GitOps repo'
    }
}

    }
}
