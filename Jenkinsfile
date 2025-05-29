pipeline {
  agent any

  tools {
    maven "M3"
    jdk "JDK21"
  }

  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerCredential')
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

    stage('Maven Build') {
      steps {
        echo 'Maven Build'
        sh 'mvn -Dmaven.test.failure.ignore=true clean package'
      }
    }

    stage('Docker Image Build') {
      steps {
        echo 'Docker Image Build'
        dir("${env.WORKSPACE}") {
          sh '''
            # ❌ [오류 제거됨] 아래 줄은 잘못된 명령어였기 때문에 삭제함
            # https://github.com/meeny-miny-moe/spring-petclinic/blob/main/Jenkinsfile

            docker build -t spring-petclinic:$BUILD_NUMBER .
            docker tag spring-petclinic:$BUILD_NUMBER tnalscherry6/spring-petclinic:latest
          '''
        }
      }
    }

    stage('Docker Image Push') {
      steps {
        sh '''
          echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
          docker push tnalscherry6/spring-petclinic:latest
        '''
      }
    }

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
          sh 'kubectl apply -f project1-deploy.yaml'
        }
      }
    }
  }
}

