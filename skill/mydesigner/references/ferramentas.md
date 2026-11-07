# Ferramentas reutilizáveis (especificação)

Cada seção descreve **o que a ferramenta faz, como implementar, limites recomendados, tabelas e variáveis de ambiente**. Organize cada uma como um módulo (`modelo`, `repo`, `api`, `cliente`, `migracoes`, `publico`) ou, se for transversal, em `src/compartilhado/`.

## Mensagens (chat entre duas pessoas)
- Para quê: conversa entre duas partes ligadas por uma negociação ou pedido.
- Tabelas: `conversas`/`interesses` (quem e sobre o quê) e `mensagens` (autor, texto, criado_em).
- Funcionamento: grava no banco; a tela busca novas a cada 10 s **só com a aba visível**; rola ao fim ao chegar mensagem. Rota `GET/POST /api/conversas/[id]`.
- Limites: texto até 1000 caracteres; mensagem de abertura até 280. Regra de quem pode conversar fica no `modelo`.

## Avisos (sino) e push
- Para quê: avisar eventos no sino do app e no celular.
- Tabelas: `avisos` (uid, tipo, texto, link, lido, `disponivel_em`, `push_enviado_em`) e `dispositivos` (inscrições de push).
- Funcionamento: o aviso é gravado **na mesma transação** da operação que o gerou; um despachante separado envia o push quando `disponivel_em` chega. Falha de envio nunca desfaz a operação. Permite atraso por prioridade.
- Push: Web Push com chaves VAPID (`VAPID_PUBLIC_KEY`, `VAPID_PRIVATE_KEY`, `VAPID_SUBJECT`; gerar com `web-push generate-vapid-keys`). Aceitar só endereços de FCM, Mozilla, Apple e Windows; remover o aparelho após 5 falhas. iPhone só recebe com o app na Tela de Início. Service worker em `public/sw.js`.
- Rotas: `GET /api/avisos`, `POST/DELETE /api/push`.

## Código de validação (celular), sessão, login social e 2FA
- Tabelas: `codigos_telefone` (telefone, `codigo_hash`, ip, tentativas, `expira_em`), `sessoes` (`token_hash`, uid, `expira_em`).
- Regras recomendadas: 6 dígitos; validade 5 min; 3 tentativas; reenvio após 60 s; até 5 por número/hora e 20 por IP/hora; **guardar só o hash** SHA-256 amarrado ao número e a um segredo do servidor; comparar sem vazar tempo.
- Envio: uma função `enviarMensagem(celular, texto)` com provedor trocável (ex.: WhatsApp pela Evolution API: `EVOLUTION_API_URL`, `EVOLUTION_API_KEY`, `EVOLUTION_INSTANCE`). Sem provedor: em desenvolvimento imprimir o código no log; em produção falhar de forma explícita.
- Sessão: cookie HttpOnly com token aleatório; o banco guarda só o hash; validade 30 dias renovável; aceitar `Authorization: Bearer` para o app nativo.
- Login social (Google) e segundo fator TOTP (RFC 6238, compatível com Google Authenticator; pode usar `node:crypto` ou `otplib`) são opcionais.

## Câmera, foto e recursos do aparelho
- Uma camada `src/compartilhado/aparelho/` com interface única e implementação web (e Capacitor depois, sem mudar as telas). Telas **nunca** chamam câmera, GPS ou notificação direto.
- Interface: `localizacao()`, `tirarFoto()` (abre a câmera ou o seletor e devolve o arquivo), `lerQr()`, `notificacoes` (situação, ativar, desativar) e `compartilhar()` (nativo; sem suporte copia o link).
- Foto: comprimir no cliente (lado máximo 1600 px, JPEG 0,8) antes de enviar. Arquivos recebidos: JPG, PNG, WEBP ou PDF; **conferir o tipo pelo conteúdo**, não pelo que o navegador declara; limite 5 MB (foto de 1,5 MB).
- Leitura de QR: `BarcodeDetector` do navegador; sem suporte, oferecer digitar o código curto.

## QR code
- Gerar: biblioteca `qrcode` — `QRCode.toDataURL(link, { margin: 1, width: 240, errorCorrectionLevel: "M", color: { dark: <cor escura da marca>, light: "#ffffff" } })`.
- Conteúdo: um link com um token (a câmera comum do celular já abre a tela). A leitura aceita o link inteiro, só o token, ou um **código curto de 6 dígitos** para digitar quando a câmera não lê.
- Validade sugerida: 48 h, renovável, com aviso nas últimas 12 h; vencido some da lista e é apagado depois de 7 dias.
- Antifraude: limitar leituras erradas por hora e por ponto de leitura.

## Armazenamento privado (disco ou MinIO/S3)
- Duas implementações com a mesma interface em `src/compartilhado/armazenamento/`: **disco** (padrão, sem serviço externo) e **S3/MinIO**. `ARMAZENAMENTO=s3` liga o S3; qualquer outro valor = disco. Carregar o SDK do S3 só quando ligado.
- Segurança: bucket privado criado pelo app; sem link direto; links pré-assinados de curta duração (30 a 900 s) ou leitura pelo servidor; gravar e conferir o SHA-256; validar chave e caminho.
- MinIO no Docker Compose: imagem `minio/minio:RELEASE.2023-11-20T22-40-07Z`, perfil `s3`, exige `MINIO_ROOT_USER` e `MINIO_ROOT_PASSWORD` (12+ caracteres), portas só em `127.0.0.1` (API 9010, painel 9011), healthcheck `mc ready local`, volume próprio.

## PWA (uso sem internet)
- `public/sw.js` com versão no nome do cache; guardar telas, estáticos e **apenas** APIs públicas; **nunca** cachear conta, mensagens, avisos ou dados pessoais. `public/offline.html` como tela de reserva.

## Padrões de base
- Migrações versionadas por módulo, aplicadas uma vez por processo e com trava no banco.
- Resposta de API padrão: `{ dados }` no sucesso ou `{ erro }` com o status HTTP certo; cliente que converte erro em exceção com o status.
- Um módulo só usa de outro o que está em `publico.ts`.
