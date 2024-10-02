variable "EXPOSE_VERSION" {
    default = "master"
}
target "docker-metadata-action" {}
target "default" {
    inherits = [
        "docker-metadata-action"
    ]
    dockerfile = "Dockerfile"
    args = {
        EXPOSE_VERSION = "${EXPOSE_VERSION}"
    }
    platforms = [
        "linux/amd64",
        "linux/arm64"
    ]
}
target "dev" {
    inherits = [
        "docker-metadata-action"
    ]
    dockerfile = "Dockerfile"
    args = {
        EXPOSE_VERSION = "${EXPOSE_VERSION}"
    }
    tags = [
        "socheatsok78/expose:dev"
    ]
}
