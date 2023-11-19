FROM maven:3.8.4-jdk-8

WORKDIR /etc/dev/app-java

COPY . .

ENTRYPOINT ["./scripts/entrypoint.sh"]