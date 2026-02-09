# ADR-0001: Monorepo Structure with Service-Based Organization

**Status:** Accepted  
**Date:** 2026-02-09  
**Author:** Dimitrije Jelic

## Context

GigHub will consists of multiple microservices (API Gateway + n business services) built with multiple technologies (Java Spring Boot, PHP Laravel). Need to decide on repository structure.

## Decision

Use a **monorepo** with top-level folders organized by **deployment type** rather than technology:
```
/services     - Independently deployable microservices
/frontend     - Public site (Next.js) & Admin panel (Angular)
/infrastructure - K8s manifests, Helm charts, observability configs
/docs         - Architecture documentation, ADRs, learning notes
```

## Rationale

**Why monorepo over polyrepo:**
- Atomic commits across service boundaries (change API contract + implementation together)
- Simplified dependency management for shared libraries
- Single CI/CD pipeline with smart change detection
- Easier refactoring across services with IDE support
- Tradeoff: Larger clone size (~500MB eventually)

**Why organize by deployment type:**
- Each folder in `/services` is independently deployable (owns its Dockerfile)
- Clear separation between runtime code and infrastructure config
- Easier to reason about deployment boundaries

**Alternatives considered:**
1. **Polyrepo** (one repo per service) - Rejected: Too complex for solo project, harder to refactor APIs
2. **Group by technology** (`/java-services`, `/php-services`) - Rejected: Emphasizes tech over domain boundaries

## Consequences

**Positive:**
- Single source of truth for all services
- Easier to implement cross-service changes
- Simplified local development setup

**Negative:**
- Need to implement CI change detection (only deploy modified services)
- Slightly longer `git clone` time (not a concern for solo project)

## References

- [Monorepos: Please don't!](https://medium.com/@mattklein123/monorepos-please-dont-e9a279be011b) (counterpoint)
- [Why Google Stores Billions of LOC in a Single Repo](https://research.google/pubs/pub45424/)
- [Nx Monorepo Benefits](https://nx.dev/concepts/decisions/why-monorepos)