BAKE_FILES := -f docker-bake.hcl -f docker-metadata-action.hcl
it: build
build:
	docker buildx bake $(BAKE_FILES)
