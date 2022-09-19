# Application Component Library

Common components of application stacks that are provided as supporting services
on a Kubernetes app platform.

This is a repository of different open source platform components that are
aggregated and modified with some best practices that we have found useful.
You can use these manifests to install the various platform supporting services
as-is, or more likely, you can use them as a starting point for developing:
* [Helm](https://github.com/helm/helm) charts
* [Kustomize](https://github.com/kubernetes-sigs/kustomize) overlays
* Kubernetes operators using [Operator
  Builder](https://github.com/nukleros/operator-builder)

We use [vendir](https://github.com/vmware-tanzu/carvel-vendir) to sync upstream
source manifests from different projects.

We use
[yaml-overlay-tool](https://github.com/vmware-tanzu-labs/yaml-overlay-tool) to
encode changes that we find useful to the source manifests.

This allows us to readily keep the component configs up-to-date with latest
versions.

## Supported Projects

Following are the currently supported groups and projects.

* database
    * Zalando Postgres Operator

