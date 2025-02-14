IMAGE=xv6
LOCAL_IMAGE=xv6
WORKDIR=/xv6-riscv

.PHONY: image start attach clean

image: Dockerfile ## Build the docker image if it doesn't exist
ifeq ("$(shell docker images -q $(LOCAL_IMAGE))", "")
	docker build -t $(LOCAL_IMAGE) .
endif

start: ## Start the container
ifneq ("$(shell docker container inspect -f '{{.State.Running}}' xv6)", "true")
	docker run \
		--detach \
		--name xv6 \
		--hostname=xv6 \
		--cap-add SYS_ADMIN \
		--security-opt seccomp=unconfined \
		-v $(PWD)/xv6-riscv-solution:$(WORKDIR) \
		--workdir $(WORKDIR) \
		-it $(IMAGE)
endif

attach: start ## Attach to the container.
	docker exec -it xv6 bash

clean: ## Stop and remove the container
	docker container stop xv6
	docker container rm xv6

help:
	@awk 'BEGIN {	\
		FS = ":.*##";	\
		printf "OS class container environment.\n\n";	\
		printf "\033[1mUSAGE\033[0m\n";	\
		printf "  make [VAR=... [VAR=...]] \033[36mTARGET\033[0m\n\n";	\
		printf "\033[1mTARGETS\033[0m\n";	\
	}	\
	/^[a-zA-Z_-]+:.*?##/ {	\
		printf "  \033[36m%-23s\033[0m %s\n", $$1, $$2	\
	}	\
	/^##@/ {	\
		printf "\n\033[1m%s\033[0m\n", substr($$0, 5)	\
	} ' $(MAKEFILE_LIST)
