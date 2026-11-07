# Criar um projeto novo a partir da base

1. **Entrevista** (ver Passo 0 da skill): nome, slug, domínio e público, marca (claro/escuro), ferramentas, mobile, pasta.
2. **Esqueleto** (Next.js 16 + TypeScript + Tailwind 4, App Router):
   ```
   src/app/            páginas e rotas /api (finas; chamam os módulos)
   src/components/     layout (AppShell) e ui (BottomSheet, SegmentedControl, BotaoVoltar…)
   src/compartilhado/  aparelho, armazenamento, db/migracoes, http, mensagens
   src/modulos/<função>/  modelo, repo, api, cliente, migracoes, publico, componentes
   ```
   Regra: um módulo só usa de outro o que está em `publico.ts`.
3. **Dependências:** as de `references/stack.md`, só das ferramentas escolhidas (ex.: sem `qrcode` se não houver QR).
4. **Visual:** copiar o bloco CSS de `references/tokens.md` para `globals.css`; trocar as cores da marca e conferir contraste AA; renomear o prefixo `recila-` para o do projeto; copiar `IconProvider` (Phosphor duotone, 24), `MovimentoAcessivel`, `BottomSheet`, `SegmentedControl`, `AppShell` e `BotaoVoltar`; tema escuro padrão com `localStorage`.
5. **Ferramentas:** para cada uma escolhida, seguir `references/ferramentas.md`; criar a migração do módulo e registrar em `db/migracoes.ts`.
6. **Qualidade:** `tsc` sem erros, testes unitários do modelo de cada módulo, `AGENTS.md` com as regras (branches, hot-reload, quando reconstruir contêiner), `docs/` com um registro por entrega.
7. **Entrega:** `docker-compose.yml` (dev) e `docker-compose.prod.yml`; pipeline de deploy; `.env.example` com as variáveis das ferramentas, sem valores secretos.
8. **Mostre a árvore e as variáveis de ambiente antes de criar arquivos** e confirme o que será gerado.
