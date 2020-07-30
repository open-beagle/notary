ARG BASE

FROM $BASE
LABEL maintainer=mengkzhaoyun@gmail.com

COPY ./dist /usr/bin
COPY ./migrations /var/lib/notary/migrations
COPY ./fixtures /var/lib/notary/fixtures

RUN chmod 0600 /var/lib/notary/fixtures/database/*

WORKDIR /var/lib/notary
# SERVICE_NAME needed for migration script
ENV SERVICE_NAME=notary_server
EXPOSE 4443
ENTRYPOINT [ "/usr/bin/notary-server" ]
CMD [ "-config=/var/lib/notary/fixtures/server-config-local.json" ]

