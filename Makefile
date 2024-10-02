it: build
build:
	docker buildx bake dev --load
run:
	docker run --rm -it socheatsok78/expose:dev
