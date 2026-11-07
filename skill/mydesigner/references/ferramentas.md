# Ferramentas reutilizáveis (código em RecicleUai_2026/)

## Mensagens (chat entre duas pessoas)
- Código: `src/modulos/interesses/` (`repo.ts`, `modelo.ts`, `componentes/Conversa.tsx`); rota `/api/conversas/[ofertaId]`; tabela `mensagens` (e `interesses`, `avaliacoes`).
- Funciona: grava no banco; a tela busca a cada 10 s com a aba visível. Limites: 1000 caracteres (interesse: 280).
- Adaptar: a regra de quem pode conversar; os nomes das tabelas.

## Avisos (sino) e push
- Código: `interesses/repo.ts` (`avisar`), `interesses/push.ts`; rotas `/api/avisos`, `/api/push`; tabelas `avisos`, `dispositivos`; `public/sw.js`.
- Funciona: aviso gravado na mesma transação da operação; despachante separado envia o push quando `disponivel_em` chega; falha nunca desfaz a operação. Atraso por qualidade do destinatário (`atrasoDoAviso`).
- Env: `VAPID_PUBLIC_KEY`, `VAPID_PRIVATE_KEY`, `VAPID_SUBJECT` (gerar com `web-push generate-vapid-keys`). Só aceita endereços FCM, Mozilla, Apple, Windows; remove aparelho após 5 falhas. iPhone só com o app na Tela de Início.

## Código de validação (celular), sessão, Google, 2FA
- Código: `src/modulos/conta/` (`modelo.ts` com `REGRAS_CODIGO`, `repo.ts`, `sessao.ts`, `google.ts`, `doisFatores.ts`); rotas `/api/conta/celular`, `/codigo`, `/google`, `/2fa`, `/aparelhos`; tabela `codigos_telefone`, `sessoes`.
- Regras: 6 dígitos; validade 5 min; 3 tentativas; reenvio 60 s; 5 por número/hora; 20 por IP/hora; guardado só como hash SHA-256 com segredo do servidor. Sessão: cookie HttpOnly `ru_sessao`, hash do token no banco, 30 dias; Bearer `ru_` no app.
- Envio: `src/compartilhado/mensagens/whatsapp.ts` (Evolution API: `EVOLUTION_API_URL`, `EVOLUTION_API_KEY`, `EVOLUTION_INSTANCE`). Sem provedor: em desenvolvimento o código vai para o log; em produção falha explicitamente. Trocar de provedor mantendo `enviarWhatsApp(celular, texto)`.
- 2FA: TOTP RFC 6238 feito com `node:crypto`.

## Câmera, foto e recursos do aparelho
- Código: `src/compartilhado/aparelho/` (`index.ts` interface, `web.ts`), `src/compartilhado/imagem.ts`.
- Interface: `localizacao()`, `tirarFoto()`, `lerQr()`, `notificacoes`, `compartilhar()`. As telas só usam `aparelho()`; o Capacitor entra depois sem mudar as telas.
- Foto: `comprimirFoto` (lado máx. 1600 px, JPEG 0,8). Leitura de QR: `BarcodeDetector` do navegador; sem suporte, digitar o código curto.
- Arquivos recebidos: JPG, PNG, WEBP ou PDF; tipo conferido pelo conteúdo; limite 5 MB (foto do anúncio 1,5 MB).

## QR code
- Gerar: `qrcode` 1.5.4, `QRCode.toDataURL(link, { margin: 1, width: 240, errorCorrectionLevel: "M", color: { dark: "#064e3b", light: "#ffffff" } })` (ver `recebimentos/componentes/EntregarNoPonto.tsx`).
- Fluxo de entrega: `src/modulos/recebimentos/`; o QR guarda um link com token; o ponto lê pela câmera ou digita o código de 6 dígitos; vale 48 h (renovável; aviso nas últimas 12 h; vencido apagado após 7 dias); limite de leituras erradas por hora.

## Armazenamento privado (disco ou MinIO/S3)
- Código: `src/compartilhado/armazenamento/` (`index.ts` escolhe o motor, `disco.ts`, `s3.ts`, `regras.ts`).
- Motor: `ARMAZENAMENTO=s3` liga S3/MinIO; qualquer outro valor = disco. Bucket privado criado pelo app; links pré-assinados de 30 a 900 s; SHA-256 conferido na leitura.
- MinIO: `minio/minio:RELEASE.2023-11-20T22-40-07Z`, perfil `s3` do compose (`COMPOSE_PROFILES=s3`), exige `MINIO_ROOT_USER` e `MINIO_ROOT_PASSWORD` (12+ caracteres); API em `127.0.0.1:9010`, painel em `127.0.0.1:9011`.

## PWA (uso sem internet)
- `public/sw.js` (versão `ru-v5`): guarda telas, estáticos e só as APIs públicas; nunca guarda conta, anúncios, mensagens nem avisos. `public/offline.html`.

## Padrões de base
- Migrações versionadas por módulo (`src/compartilhado/db/migracoes.ts`); resposta de API `{ dados }`/`{ erro }` (`compartilhado/http/resposta.ts`); módulos por funcionalidade (`modelo`, `repo`, `api`, `cliente`, `migracoes`, `publico`).
