FROM alpine:latest

ENV PACKER_VERSION=1.6.6
ENV PACKER_SHA256SUM=721d119fd70e38d6f2b4ccd8a39daf6b4d36bf5f7640036acafcaaa967b00c3b

RUN apk add --update git bash wget openssl curl ansible

ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip ./
ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_SHA256SUMS ./

RUN sed -i '/.*linux_amd64.zip/!d' packer_${PACKER_VERSION}_SHA256SUMS
RUN sha256sum -cs packer_${PACKER_VERSION}_SHA256SUMS
RUN unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /bin
RUN rm -f packer_${PACKER_VERSION}_linux_amd64.zip

RUN mkdir -p /work

WORKDIR /work

ENTRYPOINT ["/bin/packer"]