¿Cómo buildear el Dockerfile?
==========
docker build -t gp/keycloak:1.0.0 .

¿Cómo correrlo de forma local?
===========
docker run -p 8080:8080 -p 8443:8443 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -e DB_DATABASE=keycloak -e DB_SCHEMA=keycloak -e DB_USER=keycloakuser -e DB_PASSWORD=Hewe2112 -e DB_ADDR=172.17.0.1 -e DB_PORT=3306 -e DB_VENDOR=mysql gp/keycloak:1.0.6

Login local: http://localhost:8080/auth/realms/gp/account

¿Cómo pushear a Dockerhub?
===========
docker login --username=yourhubusername

docker tag 7e7b9a4f59a2 sebastiansanio/keycloakgp:1.0.4
docker push sebastiansanio/keycloakgp:1.0.4

7e7b9a4f59a2: ID del tag a subir (se obtiene desde "docker images")

¿Cómo levantarlo en Kubernetes?
===========
kubectl apply -f deploy-secrets.yaml
kubectl apply -f deploy-config.yaml
kubectl apply -f deploy.yaml
