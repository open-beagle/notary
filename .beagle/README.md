# version

/go/src/gitlab.wodcloud.com/cloud/awecloud-goharbor-harbor/Makefile

```bash
git remote add upstream git@github.com:theupdateframework/notary.git

git fetch upstream

git merge v0.6.1
```

## debug

```bash
docker run --rm -it \
-v $PWD/:/go/src/github.com/theupdateframework/notary \
-e GOPROXY=https://goproxy.cn,direct \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.16.5-alpine \
bash

env | grep GO && \
mkdir -p dist && \
apk add --update git gcc libc-dev && \
go get -tags "mysql postgres file" github.com/mattes/migrate/cli && \
mv /go/bin/cli dist/migrate && \
go install -tags pkcs11 -ldflags "-w -X github.com/theupdateframework/notary/version.GitCommit=9b388060 -X github.com/theupdateframework/notary/version.NotaryVersion=0.6.1" github.com/theupdateframework/notary/cmd/notary-signer && \
mv /drone/bin/notary-signer dist/notary-signer && \
ls -ll dist

# devops-go-arch
docker run -it --rm \
-w /go/src/github.com/theupdateframework/notary \
-v $PWD/:/go/src/github.com/theupdateframework/notary \
-e CI_WORKSPACE=/go/src/github.com/theupdateframework/notary \
-e PLUGIN_BINARY=notary-signer \
-e PLUGIN_MAIN=cmd/notary-signer \
-e PLUGIN_GOARGS='-tags pkcs11' \
-e GO111MODULE=off \
registry.cn-qingdao.aliyuncs.com/wod/devops-go-arch:1.16.5-alpine
```

## images

```bash
# gitlab.wodcloud.com/cloud/migrate
registry.cn-qingdao.aliyuncs.com/wod/migrate:v4.14.1
registry.cn-qingdao.aliyuncs.com/wod/migrate:v4.14.1-arm64
registry.cn-qingdao.aliyuncs.com/wod/migrate:v4.14.1-ppc64le
```
