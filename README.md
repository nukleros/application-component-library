# Application Component Library

Common components of application stacks that are provided as supporting services
to tenant workloads on a Kubernetes application platform.

This is a repository of different open source application components that are
aggregated and modified with some best practices that we have found useful.
You can use these manifests to install the various application supporting
services as-is, or more likely, you can use them as a starting point for
developing:
* [Helm](https://github.com/helm/helm) charts
* [Kustomize](https://github.com/kubernetes-sigs/kustomize) overlays
* Kubernetes operators using [Operator
  Builder](https://github.com/nukleros/operator-builder)


## Tools

* [vendir](https://github.com/vmware-tanzu/carvel-vendir) - download different formats from upstream
* [yaml-overlay-tool](https://github.com/vmware-tanzu-labs/yaml-overlay-tool) - overlay opinions from downloaded manifests


## Purpose

* **Opinionated Manifests** - provide opinions about what a real world deployment
looks like for common projects.

* **Common Format** - no guessing about whether to use Helm, Kustomize, Git, HTTP,
OCI, etc.  Everything in this repo is output in raw Kubernetes manifests.  In 
most cases, you can `kubectl apply` directly.

* **Updates** - an opinionated pipeline makes updating versions both trackable via 
Git (e.g. see what changed), and easy to perform with the used tooling.

* **Consistent Structure** - consistent naming for the output manifests:
    * `ServiceAccount`, `Role`, `RoleBinding`, `ClusterRole`, `ClusterRoleBinding` == `rbac.yaml`
    * `ConfigMap`, `Secret`, `ExternalSecret` == `config.yaml`
    * `CustomResourceDefinition` == `crds.yaml`
    * `MutatingWebhookConfiguration`, `ValidatingWebhookConfiguration` == `webhook.yaml`
    * `Certificate`, `Issuer`, `ClusterIssuer` == `certificates.yaml`
    * `Deployment` == `deployment.yaml`
    * `StatefulSet` == `statefulset.yaml`
    * `DaemonSet` == `daemonset.yaml`
    * `Job`, `CronJob` == `job.yaml`
    * `Service` == `service.yaml`
    * `Ingress`  == `ingress.yaml`
    * `IngressClass` == `ingress-class.yaml`
    * `NetworkPolicy` == `networkpolicy.yaml`
    * `PodDisruptionBudget` == `poddisruptionbudget.yaml`
    * Mutually exclusive variants use a suffix, pick one (e.g. `service-aws.yaml`,
      `service-nodeport.yaml`)


## Application vs. Platform Components

This library is the companion to the [Platform Component
Library](https://github.com/nukleros/platform-component-library) (PCL).
The two libraries share the same tooling, structure and development workflow,
but they hold different kinds of components.

* **Platform Component Library** - platform concerns.  Services that make the
cluster itself usable by any tenant, whether or not a given workload knows
they exist.  Examples are ingress, certificate management, identity and secrets
management.

* **Application Component Library** (this library) - application concerns.
Services that an application directly depends on as part of its own stack and
consumes by connecting to them.  Examples are databases, caches, message queues
and event streams, object storage and search.

When deciding where a new project belongs, ask whether a tenant application
would list it as one of its own dependencies:

| | Platform (PCL) | Application (ACL) |
|---|---|---|
| **Consumed by** | the cluster and every tenant, often implicitly | a specific application, explicitly |
| **Typical interface** | Kubernetes resources (e.g. `Ingress`, `Certificate`, `ExternalSecret`) | a network endpoint the app connects to (e.g. a Postgres connection string) |
| **Typical categories** | e.g. `certificates`, `identity`, `ingress`, `secrets` | e.g. `database`, `cache`, `messaging`, `storage`, `search` |
| **Labels** | `platform.nukleros.io/*` | `application.nukleros.io/*` |

Application components commonly rely on platform components (e.g. a database
operator using cert-manager for TLS), so install the platform components first.


## Supported Projects

See [.source/$CATEGORY](.source/) for a list of supported projects where `$CATEGORY` is the 
category of the project.
