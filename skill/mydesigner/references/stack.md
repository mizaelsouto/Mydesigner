# Tecnologias e versões (lidas em 07/11/2026)

| Camada | Tecnologia | Versão |
|---|---|---|
| Aplicação | Next.js (App Router, webpack) | 16.4.3 |
| | React / React DOM | 19.2.4 |
| | TypeScript | 5.9.3 |
| | Node.js (contêiner `node:22-alpine`; máquina de desenvolvimento) | 22 / 24.13.1 |
| | ESLint | 9.39.4 |
| Interface | Tailwind CSS + `@tailwindcss/postcss` | 4.3.0 |
| | @phosphor-icons/react | 2.1.10 |
| | framer-motion | 12.40.0 |
| | sonner | 2.0.7 |
| | Inter (Google Fonts) | 400–800 |
| Mapa e endereço | leaflet / leaflet.markercluster | 1.9.4 / 1.5.3 |
| | @react-google-maps/api / use-places-autocomplete | 2.20.8 / 4.0.1 |
| Dados | PostgreSQL + PostGIS (`postgis/postgis:16-3.4`) | 16 / 3.4 |
| | pg | 8.23.1 |
| | MinIO (`minio/minio`) | RELEASE.2023-11-20T22-40-07Z |
| Serviços | web-push | 3.6.7 |
| | qrcode | 1.5.4 |
| | otplib (declarada) | 13.4.1 |
| | @aws-sdk/client-s3 e s3-request-presigner | 3.705.0 |
| | Evolution API (WhatsApp, externo) | sem versão fixada |
| Aplicativo | Capacitor core/cli/android/ios | 8.6.0 (declarado ^8.5.0) |
| Testes | @playwright/test | 1.64.1 |
| Entrega | Docker Compose (dev e prod); GitHub Actions + `appleboy/ssh-action` | v1.0.3 |

Atualizar: `npm ls --depth=0` e as imagens em `docker-compose*.yml`. Aviso do projeto de origem: o Next.js usado tem mudanças de API; ler `node_modules/next/dist/docs/` antes de escrever código.
