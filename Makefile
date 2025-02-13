IMAGE=
LOCAL_IMAGE=

.PHONY: image start

image:
	docker build -t xv6 .

start:
	docker run --rm -it xv6
