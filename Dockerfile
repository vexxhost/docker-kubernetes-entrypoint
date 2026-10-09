FROM golang:1.27.2@sha256:5bc7f572bbaa98885a3a1fd9c0aa76b59e3e14e8628bfc316bbfd0c701e4818c AS build
# renovate: name=airship/kubernetes-entrypoint repo=https://opendev.org/airship/kubernetes-entrypoint.git branch=master
ARG KUBERNETES_ENTRYPOINT_GIT_REF=cc2737be5285951ac08b32e76dfd375e1a0ab81f
ADD https://opendev.org/airship/kubernetes-entrypoint.git#${KUBERNETES_ENTRYPOINT_GIT_REF} /src
WORKDIR /src
RUN CGO_ENABLED=0 GOOS=linux go build -o /main

FROM scratch
COPY --from=build /main /kubernetes-entrypoint
USER 65534
ENTRYPOINT ["/kubernetes-entrypoint"]
