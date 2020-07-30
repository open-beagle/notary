ARG BASE

FROM $BASE
LABEL maintainer=mengkzhaoyun@gmail.com

COPY ./dist /usr/bin
COPY ./migrations /var/lib/notary/migrations
COPY ./fixtures /var/lib/notary/fixtures

RUN chmod 0600 /var/lib/notary/fixtures/database/*

WORKDIR /var/lib/notary
# SERVICE_NAME needed for migration script
ENV SERVICE_NAME=notary_signer
ENV NOTARY_SIGNER_DEFAULT_ALIAS="timestamp_1"
ENV NOTARY_SIGNER_TIMESTAMP_1="testpassword"

ENTRYPOINT [ "/usr/bin/notary-signer" ]
CMD [ "-config=/var/lib/notary/fixtures/signer-config-local.json" ]

