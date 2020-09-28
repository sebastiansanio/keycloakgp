¿Cómo buildear el Dockerfile?
==========
`docker build -t keycloak-gp:${IMAGE_VERSION} .`

¿Cómo correrlo de forma local?
===========
```
docker run keycloak-gp:${IMAGE_VERSION} -p 8080:8080 -p 8443:8443 \
  -e KEYCLOAK_USER=admin \
  -e KEYCLOAK_PASSWORD=admin \
  -e DB_DATABASE=keycloak \
  -e DB_SCHEMA=keycloak \
  -e DB_USER=keycloakuser \
  -e DB_PASSWORD=Hewe2112 \
  -e DB_ADDR=172.17.0.1 \
  -e DB_PORT=3306 \
  -e DB_VENDOR=mysql
```

Login local: http://localhost:8080/auth/realms/gp/account

¿Cómo pushear a Dockerhub?
===========
```
docker login --username=${DOCKERHUB_USER}
docker tag ${IMAGE_ID} ${DOCKERHUB_USER}/keycloakgp:${IMAGE_VERSION}
docker push ${DOCKERHUB_USER}/keycloakgp:${IMAGE_VERSION}
```

${IMAGE_ID}: ID de la imagen a subir (se obtiene desde "docker images" o al finalizar el build)

¿Cómo instalar en Kubernetes?
===========
(Requiere helm v3 y kubectl)
Ver o ejecutar:

`./manifests/install.sh`
