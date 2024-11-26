FROM cepgbaseacr.azurecr.io/docker.io/openjdk:17-slim

WORKDIR /app

# Maven Wrapper 복사
COPY pom.xml mvnw ./    # Maven Wrapper 스크립트 복사
COPY .mvn/ .mvn/        # Maven 설정 디렉토리 복사
RUN ./mvnw dependency:go-offline

# 애플리케이션 소스 복사
COPY src/ ./src

RUN ./mvnw package

CMD ["java", "-jar", "target/your-app.jar"]
