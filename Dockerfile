FROM golang:1.27.3@sha256:2920bb124f1a2e12a1d39f0cab756ae0068441ee1da7655dec7f5e374944095b AS build
# renovate: name=airship/kubernetes-entrypoint repo=https://opendev.org/airship/kubernetes-entrypoint.git branch=master
ARG KUBERNETES_ENTRYPOINT_GIT_REF=cc2737be5285951ac08b32e76dfd375e1a0ab81f
ADD https://opendev.org/airship/kubernetes-entrypoint.git#${KUBERNETES_ENTRYPOINT_GIT_REF} /src
WORKDIR /src
RUN CGO_ENABLED=0 GOOS=linux go build -o /main

FROM scratch
COPY --from=build /main /kubernetes-entrypoint
USER 65534
ENTRYPOINT ["/kubernetes-entrypoint"]
