# Criar um projeto novo

1. **Entrevista** (Passo 0 da skill): nome, slug, o que o produto faz e para quem, marca (claro/escuro), ferramentas, mobile, pasta.
2. **Esqueleto** (Next.js 16 + TypeScript + Tailwind 4, App Router):
   ```
   src/app/            páginas e rotas /api (finas; chamam os módulos)
   src/components/     layout (AppShell) e ui (BottomSheet, SegmentedControl, BotaoVoltar…)
   src/compartilhado/  aparelho, armazenamento, db/migracoes, http, mensagens
   src/modulos/<função>/  modelo, repo, api, cliente, migracoes, publico, componentes
   ```
   Regra: um módulo só usa de outro o que está em `publico.ts`.
3. **Dependências:** as de `references/stack.md`, só das ferramentas escolhidas (sem `qrcode` se não houver QR; sem o SDK do S3 se o armazenamento for em disco).
4. **Visual:** colar o bloco CSS de `references/tokens.md` em `globals.css`; trocar as cores primárias pela marca e conferir contraste AA; renomear o prefixo `md-` para o do projeto; criar o provedor de ícones (Phosphor duotone, 24), o `MotionConfig` com `reducedMotion="user"`, `BottomSheet`, `SegmentedControl`, `AppShell` (cabeçalho + barra de abas) e `BotaoVoltar`; tema escuro padrão com `localStorage`.
5. **Ferramentas:** para cada uma escolhida, seguir `references/ferramentas.md`; criar a migração do módulo e registrá-la em `db/migracoes.ts`.
6. **Qualidade:** `tsc` sem erros; testes unitários do `modelo` de cada módulo; um `AGENTS.md` com as regras do projeto (branches, hot-reload, quando reconstruir contêiner); `docs/` com um registro por entrega.
7. **Entrega:** `docker-compose.yml` (dev) e `docker-compose.prod.yml`; pipeline de deploy; `.env.example` com as variáveis das ferramentas, **sem valores secretos**.
8. **Mostre a árvore e as variáveis de ambiente antes de criar arquivos** e confirme o que será gerado.
