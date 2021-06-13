@REM Build service artifact and docker image
call mvn clean install -DskipTests -f admin-client/pom.xml
call docker build -t aurelius0523/admin-client-docker:latest admin-client
call mvn clean install -DskipTests -f admin-server/pom.xml
call docker build -t aurelius0523/admin-server-docker:latest admin-server

@REM prune untagged docker images. WARNING, it will also tag non-admin service dangling images!
call echo y|docker image prune

@REM Use compose to up all images
call docker-compose up -d