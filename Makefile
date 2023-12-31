REGISTRY=europe-central2-docker.pkg.dev/devops2023-405122/ascii-artify
VERSION=v.0.0.1
TARGETOS=linux
TARGETARCH=amd64
APP=$(shell basename -s .git $(shell git remote get-url origin))

#default build
build: 
	CGO_ENABLED=0 GOOS=$(TARGETOS) GOARCH=$(TARGETARCH) go build -v -o ascii-artify-demo ./demo/app

image:
	docker build . -t $(REGISTRY)/$(APP):$(VERSION)-$(TARGETARCH) --build-arg TARGETARCH=$(TARGETARCH)

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean: 
	rm -rf ascii-artify-demo
	docker rmi ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}



