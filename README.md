# GigHub - Kubernetes-Native Freelance Marketplace

A production-grade microservices platform demonstrating distributed systems patterns, Domain-Driven Design, and Kubernetes-native architecture.

## 🎯 Project Purpose

This is a project showcasing:
- Saga pattern for distributed transactions (orchestration & choreography)
- Domain-Driven Design (DDD) with tactical patterns
- Kubernetes-native service discovery and orchestration
- Event-driven architecture with RabbitMQ
- Polyglot microservices (Java Spring Boot + PHP Laravel)
- Production observability (OpenTelemetry, Prometheus, Grafana)

## 🏗️ Architecture

**Services:**
- API Gateway (Spring Cloud Gateway)
- User Service (Laravel) - Identity & authentication
- Gig Service (Spring Boot + DDD) - Catalog & search
- Order Service (Spring Boot + Saga) - Order orchestration
- Payment Service (Spring Boot) - Escrow & payouts
- Messaging Service (Laravel + WebSockets) - Real-time chat
- Reputation Service (Spring Boot) - Reviews & ratings
- Notification Service (Laravel) - Email/SMS
- Analytics Service (Spring Boot) - Metrics

**Infrastructure:**
- Kubernetes 1.30 (minikube for local, cloud for prod)
- PostgreSQL 17 (StatefulSets)
- RabbitMQ 4.0 (event bus)
- Redis 7.4 (caching)
- OpenTelemetry + Jaeger (tracing)

## 📁 Repository Structure
```
├── services/           # Microservices
├── frontend/           # Next.js + Angular
├── infrastructure/     # K8s manifests, Helm charts
└── docs/              # Architecture docs, notes
```

## 🚀 Quick Start

*(Will be added as services are built)*

## 📚 Documentation

- [Architecture Overview](docs/architecture/README.md)
- [Architecture Decisions (ADRs)](docs/architecture/decisions/)
- [Development Notes](docs/notes/)

## 🛠️ Tech Stack

**Backend:** Java 25, PHP 8.5, Spring Boot 3.4, Laravel 11  
**Infrastructure:** Kubernetes 1.30, PostgreSQL 17, RabbitMQ 4.0, Redis 7.4  
**Observability:** OpenTelemetry, Jaeger, Prometheus, Grafana  
**Frontend:** Next.js 15, Angular 18

## 📅 Development Timeline

12-week development cycle (4 hours/day, Mon-Fri)
- Weeks 1-2: Kubernetes foundation
- Weeks 3-5: Core services (User, Gig, Order)
- Weeks 6-7: Saga implementation
- Weeks 8-9: Supporting services
- Week 10: Production readiness
- Weeks 11-12: Documentation

## 📖 Learning Journey

This project documents my journey learning distributed systems from first principles. See [docs/notes/](docs/notes/) for detailed learning notes and debugging chronicles.

## 👤 Author

[TO BE ADDED]

## 📝 License

[TO BE ADDED]