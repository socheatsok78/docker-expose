it: dockerhub build
.PHONY: dockerhub
dockerhub:
	@bash dockerhub/README.sh
build:
	docker buildx bake dev --load
run:
	docker run --rm -it socheatsok78/expose:dev
