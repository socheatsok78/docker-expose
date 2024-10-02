ARG EXPOSE_IMAGE=beyondcodegmbh/expose-server:latest
FROM ${EXPOSE_IMAGE}
RUN apt update -q && apt install -y ca-certificates
ADD rootfs /
RUN chmod 755 /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "serve" ]
