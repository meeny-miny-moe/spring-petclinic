pipeline {
 agent any  
 
 tools {
    maven "M3"
    jdk "JDK21"
 }
 environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerCredential')
    REGION = "ap-northeast-2"
    AWS_CREDENTIALS_NAME = "AWSCredentials"
 }
 stages {
    stage('Git Clone') {
        steps {
            echo 'Git Clone'
            git url: 'https://github.com/meeny-miny-moe/spring-petclinic.git',
                branch: 'main'
        }
        post {
            success {
                echo 'Git Clone Success'
            }
            failure {
                echo 'Git Clone Fail'
            }
        }
    }
    // Maven Build 작업
    stage('Maven Build') {
        steps {
            echo 'Maven Build'
            sh 'mvn -Dmaven.test.failure.ignore=true clean package'  // Test error 무시
        }
    }
    // docker Image 생성
    stage('Docker Image Build') {
        steps {
            echo 'Docker Image Build'
            dir("${env.WORKSPACE}") {
                sh '''
                   docker build -t spring-petclinic:$BUILD_NUMBER .
                   docker tag spring-petclinic:$BUILD_NUMBER tnalscherry6/spring-petclinic:latest
                   '''
            }
        }
    }
    // Docker Image Push
    stage('Docker Image Push') {
        steps {
            sh '''
               echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
               docker push tnalscherry6/spring-petclinic:latest
               '''
        }
    }

    // Remove Docker Image
    stage('Remove Docker Image') {
        steps {
            sh '''
            docker rmi -f tnalscherry6/spring-petclinic:$BUILD_NUMBER
            docker rmi -f tnalscherry6/spring-petclinic:latest
            '''
        }
    }
    stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying to Kubernetes'
                dir('k8s') {
                    sh '''
                        kubectl apply -f deployment.yaml
                        kubectl apply -f service.yaml
                        kubectl apply -f ingress.yaml
                    '''
                }
            }
        }
 }
}
