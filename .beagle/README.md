# version

```bash
git remote add upstream git@github.com:theupdateframework/notary.git

git fetch upstream

git merge upstream/v0.6.1
```

## debug

```bash
docker run --rm -it \
-v $PWD/:/drone/src/github.com/theupdateframework/notary \
-e GOPROXY=https://goproxy.cn,direct \
-e GOPATH=/go:/drone \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.14.6-alpine \
bash

env | grep GO && \
mkdir -p dist && \
apk add --update git gcc libc-dev && \
go get -tags "mysql postgres file" github.com/mattes/migrate/cli && \
mv /go/bin/cli dist/migrate && \
go install -tags pkcs11 -ldflags "-w -X github.com/theupdateframework/notary/version.GitCommit=9b388060 -X github.com/theupdateframework/notary/version.NotaryVersion=0.6.1" github.com/theupdateframework/notary/cmd/notary-signer && \
mv /drone/bin/notary-signer dist/notary-signer && \
ls -ll dist
```

## images

```bash
# gitlab.wodcloud.com/cloud/migrate
registry.cn-qingdao.aliyuncs.com/wod/awecloud-migrate:v4.14.1
registry.cn-qingdao.aliyuncs.com/wod/awecloud-migrate-arm64:v4.14.1
registry.cn-qingdao.aliyuncs.com/wod/awecloud-migrate-ppc64le:v4.14.1
registry.cn-qingdao.aliyuncs.com/wod/awecloud-migrate-mips64el:v4.14.1
```
