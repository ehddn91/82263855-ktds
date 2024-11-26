# Base Image 설정
FROM cepgbaseacr.azurecr.io/docker.io/openjdk:17-slim

# 작업 디렉토리 설정
WORKDIR /app

# Maven 빌드 파일 복사 및 의존성 다운로드
COPY pom.xml mvnw ./
COPY .mvn/ .mvn
RUN ./mvnw dependency:go-offline

# 소스 코드 복사 및 애플리케이션 빌드
COPY src ./src
RUN ./mvnw package -DskipTests

# JAR 파일 실행
CMD ["java", "-jar", "target/template-application.jar"]
