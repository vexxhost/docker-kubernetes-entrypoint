FROM golang:1.27.1@sha256:3680233e3204827fbdc66088528ae6d4b3d034f51d03a99d454f6de034888244 AS build
# renovate: name=airship/kubernetes-entrypoint repo=https://opendev.org/airship/kubernetes-entrypoint.git branch=master
ARG KUBERNETES_ENTRYPOINT_GIT_REF=cc2737be5285951ac08b32e76dfd375e1a0ab81f
ADD https://opendev.org/airship/kubernetes-entrypoint.git#${KUBERNETES_ENTRYPOINT_GIT_REF} /src
WORKDIR /src
RUN CGO_ENABLED=0 GOOS=linux go build -o /main

FROM scratch
COPY --from=build /main /kubernetes-entrypoint
USER 65534
ENTRYPOINT ["/kubernetes-entrypoint"]
