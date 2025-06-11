
▪ 프로젝트
프로젝트명: 코드자동화및 배포관리프로젝트
기간: 05/12 ~ 05/30
참여 인원: 3

개요
이미 구축된 온프레미스 환경의 인프라를 클라우드에 마이그레이션 할 때 확장 가능한 네트 워크 환경에서 애플리케이션과 DB를 구축하였습니다.
클라우드의 인프라를 Ansible을 이용하여 자동화함으로써 구축 및 관리를 자동화할 수 있 고 문서화 및 인수인계를 편리하게 할 수 있도록 하였습니다.
도커 엔진을 이용한 인프라 구성을 쿠버네티스를 이용하여 효율적으로 프로비저닝 할 수 있 습니다.
이후 온프레미스 환경의 인프라가 클라우드에 모두 이전 시 관리 및 운영경비를 절약할 수 있을 것으로 기대합니다.

기술 환경
- CI/CD & DevOps
● Jenkins: GitHub 연동을 통한 자동 빌드 및 배포 파이프라인 구축
● Docker / DockerHub: 컨테이너 이미지 생성 및 DockerHub 업로드
● Kubernetes: 멀티 노드 클러스터 구성(Master + Node01~03), 애플리케이션 배포 및 관리
● Prometheus & Grafana: 클러스터 및 애플리케이션 모니터링 환경 구축
● Ansible: 인프라 구성 자동화 및 설정 관리
- 클라우드 & 인프라 (AWS 기반)
● VPC: 퍼블릭/프라이빗 서브넷 분리 구성
● EC2 Auto Scaling Group: 탄력적 확장 설정
● Application Load Balancer (ALB): 트래픽 분산 및 고가용성 확보
● NAT Gateway / Internet Gateway: 외부 인터넷 및 내부 자원 접근 제어
● Amazon S3: 배포 파일 저장소로 활용
● IAM: 배포 및 접근 권한 관리
● CodeDeploy: Jenkins와 연동한 EC2 배포 자동화 구성
- 기타
● GitHub: 소스 코드 관리 및 Jenkins 연동
● Bastion Host: 퍼블릭 서브넷을 통한 SSH 접근 제어

담당 역할: Ansible, Prometheus & Grafana, AWS Cloud, Jenkins CI & CD, Git 형상 관리

주요 기능 및 구현 과정
AWS 기반 CI/CD 및 Kubernetes 배포 자동화 인프라 구축
● 주요 기능
● CI/CD 파이프라인 구축
● GitHub → Jenkins → DockerHub → Kubernetes까지 자동화된 배포 파이프라인 구성
● Jenkins에서 애플리케이션을 Docker Image Build 및 DockerHub 업로드 자동화
● Master-Node 구조의 Kubernetes 클러스터 구성 (Node01~Node03)
● 애플리케이션은 Kubernetes에 자동으로 배포되며, Prometheus + Grafana로 모니터링 구현
● AWS 인프라 구성
● VPC 내 가용 영역(AZ)을 나눠 퍼블릭/프라이빗 서브넷 구성
● Bastion Host 및 NAT Gateway를 통한 보안 구성
● Application Load Balancer(ELB)를 통한 Auto Scaling Group 배포 및 트래픽 분산
● AWS 서비스 연동
● CodeDeploy + IAM Role 기반 자동 배포
● DockerHub, S3, Ansible과의 통합 운영
● 구현 과정
● Jenkins 서버를 AWS 프라이빗 서브넷에 설치하고, Bastion Host를 통해 SSH 접근 설정
● GitHub Webhook을 이용하여 Jenkins Pipeline 트리거
● Jenkins에서 Dockerfile 기반으로 애플리케이션 이미지 빌드 및 DockerHub 업로드 자동화
● Kubernetes 클러스터 구축 후, Jenkins로 자동 배 포
● Prometheus Operator 설치 및 Grafana와 연동하여 클러스터/애플리케이션 상태 모니터링
● Ansible을 통해 초기 서버 구성 자동화, IAM 및 S3와 연계한 자격증명 및 아티팩트 저장소 활용
● 기술 스택
● CI/CD:  Jenkins, GitHub, DockerHub, AWS CodeDeploy
● Container Orchestration: Kubernetes, Helm(optional)
● Monitoring: Prometheus, Grafana
● Infra-as-Code : Ansible
● Cloud: AWS (EC2, VPC, ELB, Auto Scaling, NAT Gateway, Bastion)
● 성과
● 장애 대응 시간 단축: Prometheus 알림 기반 실시간 이상 탐지 가능
● 비용 최적화 및 고가용성 보장 (Auto Scaling + Multi-AZ 구성)
성과 및 배운점

AWS 기반의 CI/CD 및 Kubernetes 자동화 인프라 구축 프로젝트를 통해 전체 배포 파이프라인을 직 접 설계하고 구현하였습니다. Jenkins와 DockerHub, GitHub를 연동하여 코드 커밋 시 자동으로 컨테 이너 이미지가 빌드되고, Kubernetes 클러스터에 배포되도록 구성하였습니다. Prometheus와 Grafana를 통해 클러스터 상태를 실시간 모니터링하며 운영 효율성을 높였습니다. Auto Scaling Group과 ELB를 활용해 고가용성과 트래픽 대응 능력을 확보하였습니다. Ansible과 IAM, S3를 연계 하여 인프라 설정 자동화 및 보안도 고려하였습니다. 이 경험을 통해 클라우드 아키텍처 설계 능력과 자동화 실무 감각을 기를 수 있었습니다. 특히 장애 대응, 확장성, 비용 효율성을 함께 고려하는 인프 라 설계의 중요성을 체감하였습니다. DevOps 환경에서 협업과 운영까지 고려하는 역량을 키운 계기였 습니다.



# Spring PetClinic Sample Application [![Build Status](https://github.com/spring-projects/spring-petclinic/actions/workflows/maven-build.yml/badge.svg)](https://github.com/spring-projects/spring-petclinic/actions/workflows/maven-build.yml)[![Build Status](https://github.com/spring-projects/spring-petclinic/actions/workflows/gradle-build.yml/badge.svg)](https://github.com/spring-projects/spring-petclinic/actions/workflows/gradle-build.yml)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/spring-projects/spring-petclinic) [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=7517918)

## Understanding the Spring Petclinic application with a few diagrams

[See the presentation here](https://speakerdeck.com/michaelisvy/spring-petclinic-sample-application)

## Run Petclinic locally

Spring Petclinic is a [Spring Boot](https://spring.io/guides/gs/spring-boot) application built using [Maven](https://spring.io/guides/gs/maven/) or [Gradle](https://spring.io/guides/gs/gradle/). You can build a jar file and run it from the command line (it should work just as well with Java 17 or newer):

```bash
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
./mvnw package
java -jar target/*.jar
```

You can then access the Petclinic at <http://localhost:8080/>.

<img width="1042" alt="petclinic-screenshot" src="https://cloud.githubusercontent.com/assets/838318/19727082/2aee6d6c-9b8e-11e6-81fe-e889a5ddfded.png">

Or you can run it from Maven directly using the Spring Boot Maven plugin. If you do this, it will pick up changes that you make in the project immediately (changes to Java source files require a compile as well - most people use an IDE for this):

```bash
./mvnw spring-boot:run
```

> NOTE: If you prefer to use Gradle, you can build the app using `./gradlew build` and look for the jar file in `build/libs`.

## Building a Container

There is no `Dockerfile` in this project. You can build a container image (if you have a docker daemon) using the Spring Boot build plugin:

```bash
./mvnw spring-boot:build-image
```

## In case you find a bug/suggested improvement for Spring Petclinic

Our issue tracker is available [here](https://github.com/spring-projects/spring-petclinic/issues).

## Database configuration

In its default configuration, Petclinic uses an in-memory database (H2) which
gets populated at startup with data. The h2 console is exposed at `http://localhost:8080/h2-console`,
and it is possible to inspect the content of the database using the `jdbc:h2:mem:<uuid>` URL. The UUID is printed at startup to the console.

A similar setup is provided for MySQL and PostgreSQL if a persistent database configuration is needed. Note that whenever the database type changes, the app needs to run with a different profile: `spring.profiles.active=mysql` for MySQL or `spring.profiles.active=postgres` for PostgreSQL. See the [Spring Boot documentation](https://docs.spring.io/spring-boot/how-to/properties-and-configuration.html#howto.properties-and-configuration.set-active-spring-profiles) for more detail on how to set the active profile.

You can start MySQL or PostgreSQL locally with whatever installer works for your OS or use docker:

```bash
docker run -e MYSQL_USER=petclinic -e MYSQL_PASSWORD=petclinic -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=petclinic -p 3306:3306 mysql:9.1
```

or

```bash
docker run -e POSTGRES_USER=petclinic -e POSTGRES_PASSWORD=petclinic -e POSTGRES_DB=petclinic -p 5432:5432 postgres:17.0
```

Further documentation is provided for [MySQL](https://github.com/spring-projects/spring-petclinic/blob/main/src/main/resources/db/mysql/petclinic_db_setup_mysql.txt)
and [PostgreSQL](https://github.com/spring-projects/spring-petclinic/blob/main/src/main/resources/db/postgres/petclinic_db_setup_postgres.txt).

Instead of vanilla `docker` you can also use the provided `docker-compose.yml` file to start the database containers. Each one has a service named after the Spring profile:

```bash
docker compose up mysql
```

or

```bash
docker compose up postgres
```

## Test Applications

At development time we recommend you use the test applications set up as `main()` methods in `PetClinicIntegrationTests` (using the default H2 database and also adding Spring Boot Devtools), `MySqlTestApplication` and `PostgresIntegrationTests`. These are set up so that you can run the apps in your IDE to get fast feedback and also run the same classes as integration tests against the respective database. The MySql integration tests use Testcontainers to start the database in a Docker container, and the Postgres tests use Docker Compose to do the same thing.

## Compiling the CSS

There is a `petclinic.css` in `src/main/resources/static/resources/css`. It was generated from the `petclinic.scss` source, combined with the [Bootstrap](https://getbootstrap.com/) library. If you make changes to the `scss`, or upgrade Bootstrap, you will need to re-compile the CSS resources using the Maven profile "css", i.e. `./mvnw package -P css`. There is no build profile for Gradle to compile the CSS.

## Working with Petclinic in your IDE

### Prerequisites

The following items should be installed in your system:

- Java 17 or newer (full JDK, not a JRE)
- [Git command line tool](https://help.github.com/articles/set-up-git)
- Your preferred IDE
  - Eclipse with the m2e plugin. Note: when m2e is available, there is an m2 icon in `Help -> About` dialog. If m2e is
  not there, follow the install process [here](https://www.eclipse.org/m2e/)
  - [Spring Tools Suite](https://spring.io/tools) (STS)
  - [IntelliJ IDEA](https://www.jetbrains.com/idea/)
  - [VS Code](https://code.visualstudio.com)

### Steps

1. On the command line run:

    ```bash
    git clone https://github.com/spring-projects/spring-petclinic.git
    ```

1. Inside Eclipse or STS:

    Open the project via `File -> Import -> Maven -> Existing Maven project`, then select the root directory of the cloned repo.

    Then either build on the command line `./mvnw generate-resources` or use the Eclipse launcher (right-click on project and `Run As -> Maven install`) to generate the CSS. Run the application's main method by right-clicking on it and choosing `Run As -> Java Application`.

1. Inside IntelliJ IDEA:

    In the main menu, choose `File -> Open` and select the Petclinic [pom.xml](pom.xml). Click on the `Open` button.

    - CSS files are generated from the Maven build. You can build them on the command line `./mvnw generate-resources` or right-click on the `spring-petclinic` project then `Maven -> Generates sources and Update Folders`.

    - A run configuration named `PetClinicApplication` should have been created for you if you're using a recent Ultimate version. Otherwise, run the application by right-clicking on the `PetClinicApplication` main class and choosing `Run 'PetClinicApplication'`.

1. Navigate to the Petclinic

    Visit [http://localhost:8080](http://localhost:8080) in your browser.

## Looking for something in particular?

|Spring Boot Configuration | Class or Java property files  |
|--------------------------|---|
|The Main Class | [PetClinicApplication](https://github.com/spring-projects/spring-petclinic/blob/main/src/main/java/org/springframework/samples/petclinic/PetClinicApplication.java) |
|Properties Files | [application.properties](https://github.com/spring-projects/spring-petclinic/blob/main/src/main/resources) |
|Caching | [CacheConfiguration](https://github.com/spring-projects/spring-petclinic/blob/main/src/main/java/org/springframework/samples/petclinic/system/CacheConfiguration.java) |

## Interesting Spring Petclinic branches and forks

The Spring Petclinic "main" branch in the [spring-projects](https://github.com/spring-projects/spring-petclinic)
GitHub org is the "canonical" implementation based on Spring Boot and Thymeleaf. There are
[quite a few forks](https://spring-petclinic.github.io/docs/forks.html) in the GitHub org
[spring-petclinic](https://github.com/spring-petclinic). If you are interested in using a different technology stack to implement the Pet Clinic, please join the community there.

## Interaction with other open-source projects

One of the best parts about working on the Spring Petclinic application is that we have the opportunity to work in direct contact with many Open Source projects. We found bugs/suggested improvements on various topics such as Spring, Spring Data, Bean Validation and even Eclipse! In many cases, they've been fixed/implemented in just a few days.
Here is a list of them:

| Name | Issue |
|------|-------|
| Spring JDBC: simplify usage of NamedParameterJdbcTemplate | [SPR-10256](https://github.com/spring-projects/spring-framework/issues/14889) and [SPR-10257](https://github.com/spring-projects/spring-framework/issues/14890) |
| Bean Validation / Hibernate Validator: simplify Maven dependencies and backward compatibility |[HV-790](https://hibernate.atlassian.net/browse/HV-790) and [HV-792](https://hibernate.atlassian.net/browse/HV-792) |
| Spring Data: provide more flexibility when working with JPQL queries | [DATAJPA-292](https://github.com/spring-projects/spring-data-jpa/issues/704) |

## Contributing

The [issue tracker](https://github.com/spring-projects/spring-petclinic/issues) is the preferred channel for bug reports, feature requests and submitting pull requests.

For pull requests, editor preferences are available in the [editor config](.editorconfig) for easy use in common text editors. Read more and download plugins at <https://editorconfig.org>. All commits must include a __Signed-off-by__ trailer at the end of each commit message to indicate that the contributor agrees to the Developer Certificate of Origin.
For additional details, please refer to the blog post [Hello DCO, Goodbye CLA: Simplifying Contributions to Spring](https://spring.io/blog/2025/01/06/hello-dco-goodbye-cla-simplifying-contributions-to-spring).

## License

The Spring PetClinic sample application is released under version 2.0 of the [Apache License](https://www.apache.org/licenses/LICENSE-2.0).
