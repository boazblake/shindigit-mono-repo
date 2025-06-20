# Shindigit Monorepo

shindigit mono repo with docker and caddy

## Overview

This repository is a monorepo housing both the frontend and backend for the Shindigit project. It is set up for modern development using Nix flakes, Docker Compose, and Caddy for local development and reverse proxying. The stack is designed to be reproducible, containerized, and easy to develop with on any system.

- **Frontend:** Located in the `shindigit` directory  
- **Backend:** Located in the `shindigit-server` directory  
- **Reverse Proxy:** Powered by Caddy  
- **Development Environment:** Managed by Nix Flakes  

---

## Features

- 🚀 One-command setup for development using Nix or Docker Compose
- 🐳 Containerized frontend (`shindigit`) and backend (`shindigit-server`)
- 🌐 Automatic HTTPS and reverse proxy with Caddy
- 🧑‍💻 Reproducible development environment with Nix (`flake.nix`)
- 🔄 Hot-reloading for frontend development

---

## Getting Started

### Prerequisites

- [Nix](https://nixos.org/download.html) (optional, for the Nix dev shell)
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/)
- (Optional) [Caddy](https://caddyserver.com/) if running outside containers

---

### 1. Development with Nix

This repo uses a `flake.nix` to provide a consistent shell environment:

```sh
nix develop
