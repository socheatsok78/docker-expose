variable "EXPOSE_IMAGE" {
    default = "beyondcodegmbh/expose-server:latest"
}
target "docker-metadata-action" {}
target "default" {
    inherits = [
        "docker-metadata-action"
    ]
    dockerfile = "Dockerfile"
    args = {
        EXPOSE_IMAGE = "${EXPOSE_IMAGE}"
    }
}
