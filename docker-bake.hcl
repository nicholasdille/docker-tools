variable "repository" {
    default = "nicholasdille/tools"
}

group "default" {
    targets = [
        "docker",
        "docker-ls",
        "glab",
        "helm",
        "jfrog",
        "ksort",
        "kube-score",
        "kubectl",
        "kubeone",
        "kustomize",
        "oras",
        "terraform",
        "trivy",
        "yaml-patch",
        "yq"
    ]
}

target "example" {
    inherits = [ "presets" ]
    dockerfile = "Dockerfile"
    context = "@example"
    tags = [ "${repository}:latest" ]
    cache-from = [ "${repository}:latest" ]
}

target "presets" {
    pull = true
    cache-to = [ "type=inline" ]
}

target "helpers" {
    inherits = [ "presets" ]
    context = "@helpers"
    tags = [ "${repository}:helpers" ]
    cache-from = [ "${repository}:helpers" ]
}

target "docker-ls" {
    inherits = [ "presets" ]
    context = "docker-ls"
    tags = [ "${repository}:docker-ls" ]
    cache-from = [ "${repository}:docker-ls" ]
}

target "docker" {
    inherits = [ "presets" ]
    context = "docker"
    tags = [ "${repository}:docker" ]
    cache-from = [ "${repository}:docker" ]
}

target "flarectl" {
    inherits = [ "presets" ]
    context = "flarectl"
    tags = [ "${repository}:flarectl" ]
    cache-from = [ "${repository}:flarectl" ]
}

target "glab" {
    inherits = [ "presets" ]
    context = "glab"
    tags = [ "${repository}:glab" ]
    cache-from = [ "${repository}:glab" ]
}

target "helm" {
    inherits = [ "presets" ]
    context = "helm"
    tags = [ "${repository}:helm" ]
    cache-from = [ "${repository}:helm" ]
}

target "jfrog" {
    inherits = [ "presets" ]
    context = "jfrog"
    tags = [ "${repository}:jfrog" ]
    cache-from = [ "${repository}:jfrog" ]
}

target "ksort" {
    inherits = [ "presets" ]
    context = "ksort"
    tags = [ "${repository}:ksort" ]
    cache-from = [ "${repository}:ksort" ]
}

target "kube-score" {
    inherits = [ "presets" ]
    context = "kube-score"
    tags = [ "${repository}:kube-score" ]
    cache-from = [ "${repository}:kube-score" ]
}

target "kubectl" {
    inherits = [ "presets" ]
    context = "kubectl"
    tags = [ "${repository}:kubectl" ]
    cache-from = [ "${repository}:kubectl" ]
}

target "kubeone" {
    inherits = [ "presets" ]
    context = "kubeone"
    tags = [ "${repository}:kubeone" ]
    cache-from = [ "${repository}:kubeone" ]
}

target "kustomize" {
    inherits = [ "presets" ]
    context = "kustomize"
    tags = [ "${repository}:kustomize" ]
    cache-from = [ "${repository}:kustomize" ]
}

target "oras" {
    inherits = [ "presets" ]
    context = "oras"
    tags = [ "${repository}:oras" ]
    cache-from = [ "${repository}:oras" ]
}

target "terraform" {
    inherits = [ "presets" ]
    context = "terraform"
    tags = [ "${repository}:terraform" ]
    cache-from = [ "${repository}:terraform" ]
}

target "trivy" {
    inherits = [ "presets" ]
    context = "trivy"
    tags = [ "${repository}:trivy" ]
    cache-from = [ "${repository}:trivy" ]
}

target "yaml-patch" {
    inherits = [ "presets" ]
    context = "yaml-patch"
    tags = [ "${repository}:yaml-patch" ]
    cache-from = [ "${repository}:yaml-patch" ]
}

target "yq" {
    inherits = [ "presets" ]
    context = "yq"
    tags = [ "${repository}:yq" ]
    cache-from = [ "${repository}:yq" ]
}