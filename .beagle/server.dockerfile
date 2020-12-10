ARG BASE

FROM $BASE

ARG AUTHOR
ARG VERSION

LABEL maintainer=${AUTHOR} version=${VERSION}

ARG TARGETOS
ARG TARGETARCH

COPY ./dist/migrate-$TARGETOS-$TARGETARCH /usr/bin/migrate
COPY ./dist/notary-server-$TARGETOS-$TARGETARCH /usr/bin/notary-server
COPY ./migrations /var/lib/notary/migrations
COPY ./fixtures /var/lib/notary/fixtures

RUN chmod 0600 /var/lib/notary/fixtures/database/*

WORKDIR /var/lib/notary
# SERVICE_NAME needed for migration script
ENV SERVICE_NAME=notary_server
EXPOSE 4443
ENTRYPOINT [ "/usr/bin/notary-server" ]
CMD [ "-config=/var/lib/notary/fixtures/server-config-local.json" ]

