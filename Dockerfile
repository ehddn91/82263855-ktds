# Base 이미지
FROM cepgbaseacr.azurecr.io/docker.io/openjdk:17-slim

# 작업 디렉토리 설정
WORKDIR /app

# Maven Wrapper 복사
COPY pom.xml mvnw ./    # Maven Wrapper 스크립트 복사
COPY .mvn/ .mvn/        # Maven 설정 디렉토리 복사
RUN ./mvnw dependency:go-offline





# 애플리케이션 소스 복사
COPY src/ ./src

# 애플리케이션 빌드
RUN ./mvnw package

# 컨테이너 실행 명령
CMD ["java", "-jar", "target/your-app.jar"]
