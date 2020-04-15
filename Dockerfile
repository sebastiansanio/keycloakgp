FROM jboss/keycloak:9.0.3
LABEL gp.keycloak.version="1.0.2"

COPY themes/custom /opt/jboss/keycloak/themes/

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0"]