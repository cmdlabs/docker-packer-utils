PACKER_VERSION = 1.3.3
IMAGE_NAME ?= cmdlabs/packer-utils:$(PACKER_VERSION)

dockerBuild:
	docker build -t $(IMAGE_NAME) .

pull:
	docker pull $(IMAGE_NAME)

shell:
	docker run --rm -it -v $(PWD):/opt/app:Z -w /opt/app $(IMAGE_NAME) sh

tag:
	-git tag -d $(PACKER_VERSION)
	-git push origin :refs/tags/$(PACKER_VERSION)
	git tag $(PACKER_VERSION)
	git push origin $(PACKER_VERSION)

