FROM docker:20.10.9@sha256:e7c9c600322345ad23160a0cafde129426270f50ae83133f5354c3fe347a36c2 AS final
RUN apk add --update-cache --no-cache \
        git \
        curl \
        ca-certificates \
        jq \
        bash

COPY --from=nicholasdille/tools:trivy@sha256:3e7fdb885830946610a504aeddee05c6e7859dc4d5a6b41ea02e410d7b6862c1 / /
COPY --from=nicholasdille/tools:oras@sha256:fb759c77fcc1a2499f0973ff828fa9d0a7be5993a688c181818c810579e3f5d5 / /
COPY --from=nicholasdille/tools:docker-ls@sha256:d9195368aaf6912fa7d6827fe0690de0f1d8594ba71b70b155832dd3d545b91a / /
COPY --from=nicholasdille/tools:glab@sha256:719f92ec2577cfa3fd4ed056f98c744d9c47a0c5cb5e5c6894942cc1b2966288 / /
COPY --from=nicholasdille/tools:helm@sha256:094423b3d9154d4762b548fcce72426af2253369f649f6bfb6c9cacf1ac34e4c / /
COPY --from=nicholasdille/tools:jfrog@sha256:1632ac3e5b9a1c89ecf1625c3af1e05102b66ee720d17fd85afd0f4d43d63640 / /
COPY --from=nicholasdille/tools:ksort@sha256:5c0bc3287c57b6126e99a549815124e0320aab15bd0633d11e7b1a7845c1a287 / /
COPY --from=nicholasdille/tools:kube-score@sha256:4e74f244d833c130e6bc3b759fb4b8503b95acac8af66e3dbff2417b58103d9e / /
COPY --from=nicholasdille/tools:kubectl@sha256:41d093d78f9b74a664dc9ef4e2f60b746b55d2a90ee50f3e259d481222b0e092 / /
COPY --from=nicholasdille/tools:kubeone@sha256:dac8fa14d7e53d6bd3bc47aa068eb4728b063b5fe08ee9e69303cd7bea257a64 / /
COPY --from=nicholasdille/tools:kustomize@sha256:ba24b44d28055d552d155593beaa0dc7f4d4682a68ed20a48e33ba0aae1c1546 / /
COPY --from=nicholasdille/tools:terraform@sha256:b62a0af45898cf6be8723fac603635bbdaa602bf503d32ce23b1b39cf8aaded1 / /
COPY --from=nicholasdille/tools:yaml-patch@sha256:fc0b107914b74b8864a57c49560633c231b791cb94cc3e598472d48b9eccd01e / /
COPY --from=nicholasdille/tools:yq@sha256:15afcb5792cbaae627fb08da4fe167f1450c766482e859ed624b02506e38fc27 / /
