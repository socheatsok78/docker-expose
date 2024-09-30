ARG EXPOSE_IMAGE=beyondcodegmbh/expose-server:latest
FROM ${EXPOSE_IMAGE}
ADD rootfs /
RUN chmod 755 /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
