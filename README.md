# `docker-kubernetes-entrypoint`

This is a build of the `kubernetes-entrypoint` component for Atmosphere
which is built on top of `scratch`.

- Security scanning via Trivy
- Periodic vulnerability scanning via Trivy
- Automatic dependency updates via Renovate

The image is published to the following GitHub Container Registry:

- `ghcr.io/vexxhost/kubernetes-entrypoint:edge`
- `ghcr.io/vexxhost/kubernetes-entrypoint:edge-<timestamp>`
- `ghcr.io/vexxhost/kubernetes-entrypoint:sha-<short-sha>`
