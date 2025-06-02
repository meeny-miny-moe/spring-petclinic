FROM openjdk:17-oracle

# 빌드 결과 JAR 복사
ARG JAR_PATH=target/*.jar
COPY ${JAR_PATH} spring-petclinic.jar

# 애플리케이션 포트 노출
EXPOSE 8080

# MySQL 프로파일을 활성화해서 실행
CMD ["java", "-jar", "spring-petclinic.jar", "--spring.profiles.active=mysql"]



# FROM openjdk:17-oracle
# ARG JAR_PATH=target/*.jar
# COPY ${JAR_PATH} spring-petclinic.jar
# EXPOSE 8080
# CMD ["java", "-jar", "spring-petclinic.jar"]
