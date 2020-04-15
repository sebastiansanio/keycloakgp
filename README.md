¿Cómo buildear el Dockerfile?
docker build -t gp/keycloak:1.0.0 .

¿Cómo correrlo de forma local?
docker run -p 8080:8080 -p 8443:8443 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin gp/keycloak:1.0.0


Login: http://localhost:8080/auth/realms/gp/account