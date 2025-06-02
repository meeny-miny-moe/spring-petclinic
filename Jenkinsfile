pipeline {
  agent any

  tools {
    maven "M3"
    jdk "JDK21"
  }

  environment {
    // DOCKERHUB_CREDENTIALS = credentials('dockerCredential')
    DOCKERHUB_CREDENTIALS = credentials('DockerCredential')
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

    // stage('Maven Build') {
    //   steps {
    //     echo 'Maven Build'
    //     sh 'mvn -Dmaven.test.failure.ignore=true clean package'
    //   }
    // }
    stage('Maven Build') {
      steps {
        echo 'Maven Build (with mvnw)'
        sh 'chmod +x mvnw'
        sh './mvnw -DskipTests clean package'
      }
    }




    stage('Docker Image Build') {
      steps {
        echo 'Docker Image Build'
        dir("${env.WORKSPACE}") {
          sh '''
            # ❌ [오류 제거됨] 아래 줄은 잘못된 명령어였기 때문에 삭제함
            # https://github.com/meeny-miny-moe/spring-petclinic/blob/main/Jenkinsfile

            docker build -t spring-petclinic-prometheus:$BUILD_NUMBER .
            docker tag spring-petclinic-prometheus:$BUILD_NUMBER tnalscherry6/spring-petclinic-prometheus:latest
          '''
        }
      }
    }

    stage('Docker Image Push') {
      steps {
        sh '''
          echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
          docker push tnalscherry6/spring-petclinic-prometheus:latest
        '''
      }
    }

    stage('Remove Docker Image') {
      steps {
        sh '''
          docker rmi -f tnalscherry6/spring-petclinic-prometheus:$BUILD_NUMBER
          docker rmi -f tnalscherry6/spring-petclinic-prometheus:latest
        '''
      }
    }

    
  //   stage('Docker Image Pull') {
  //     steps {
  //       sh '''
  //         echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
  //         docker pull sobin0401/spring-petclinic-prometheus:latest
  //       '''
  //   }
  // }


    // stage('Test Image in Pod') {
    //   steps {
    //     sh 'kubectl run -it --rm test-petclinic --image=tnalscherry6/spring-petclinic-prometheus:latest -- /bin/sh -c "curl -v http://localhost:8080/actuator/prometheus"'
    //   }
    // }

    stage('Deploy to Kubernetes') {
      steps {
        echo 'Deploying to Kubernetes'
        dir('k8s') {
          sh '''
            kubectl apply -f project1-deploy.yaml
            kubectl apply -f petclinic-monitor.yaml
          '''
        }
      }
    }
  }
}

