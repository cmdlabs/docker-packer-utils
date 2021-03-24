# docker-packer-utils

Docker image with `packer` and `ansible`.

## Why?

This image is used when following the [3 Musketeers] pattern. By running `packer` inside Docker, we ensure consistency, control and confidence.

  * Consistency: when developing automated processes that use `packer`, you can be sure that they will function the same whether you run it on your Windows workstation or on a Jenkins build agent.
  * Control: by specifying the version of the image in [docker-compose.yml][], we can build AMIs with specific versions of `packer`.
  * Confidence: reliable deployments build confidence in the use of CI/CD pipelines, creating a positive feedback loop that encourages developers to use CI/CD

[3 Musketeers]: https://3musketeers.io/


## How To Use

Makefile:
```Makefile
build:
	docker-compose run --rm packer packer build -force -timestamp-ui ${PACKER_TEMPLATE}
.PHONY: build
```

docker-compose.yml:
```yaml
version: "3.7"
services:
  packer:
    image: cmdlabs/packer-utils:1.7.0
    environment:
      - AWS_SDK_LOAD_CONFIG=1
      - PACKER_LOG=0
    entrypoint: []
    volumes:
      - .:/work
      - ~/.aws:/root/.aws
      - ~/.ssh:/root/.ssh
    working_dir: /work/
```
