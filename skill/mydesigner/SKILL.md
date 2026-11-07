---
name: mydesigner
description: Mydesigner — base de design e de ferramentas para criar novos projetos web/mobile (Next.js 16, Tailwind 4, Phosphor, estilo Apple HIG com cartões Bento, botões cápsula, tema escuro padrão). Pergunta o que a pessoa quer fazer antes de agir. Cobre o design system (cores, ícones, componentes, layout, menu) e ferramentas reutilizáveis (mensagens, avisos e push, código de validação, câmera e foto, QR code, armazenamento MinIO/S3, PWA) com as versões da stack. Use para "novo projeto", "tela", "componente", "revisar visual", "mockup HTML", "adicionar ferramenta", ou quando citar Mydesigner ou design system.
argument-hint: "[acao=novo-projeto|tela|componente|ferramenta|revisao|mockup] [nome=<nome>] [tema=claro|escuro|ambos] [ferramentas=mensagens,avisos,codigo,camera,qrcode,minio,pwa]"
author: Mizael Souto
version: 3.0.0
---

# Mydesigner

Base de design **e** de ferramentas para novos projetos. Tudo o que a skill precisa está em `references/`.

## Passo 0 — Perguntar o que fazer (obrigatório)

Leia `$ARGUMENTS`. **Se `acao` não veio, pergunte com AskUserQuestion** antes de qualquer ação:

> "O que você quer fazer com o Mydesigner?"
> 1. **Novo projeto** a partir da base
> 2. **Tela ou componente** novo no padrão visual
> 3. **Adicionar uma ferramenta** (mensagens, avisos/push, código de validação, câmera e foto, QR code, armazenamento MinIO/S3, PWA)
> 4. **Revisar** um visual existente contra o design system
> 5. **Mockup HTML** estático

Depois, pergunte só o que faltar para a ação escolhida (uma pergunta por vez, com opções; não pergunte o que o código ou os parâmetros já respondem):

| Ação | Perguntas que faltam |
|---|---|
| `novo-projeto` | Nome e slug · o que o produto faz e para quem (uma frase) · cor primária da marca (claro e escuro) ou manter o azul padrão · quais ferramentas incluir · app mobile (Capacitor) sim ou não · pasta de destino |
| `tela` / `componente` | O que é e para quem · tema(s) |
| `ferramenta` | Qual ferramenta · em qual projeto/pasta · variáveis de ambiente que a pessoa já tem |
| `revisao` | Qual arquivo, tela ou pasta |
| `mockup` | O que mostrar · claro, escuro ou ambos |

## Parâmetros (opcionais; pulam as perguntas)

| Parâmetro | Valores | Padrão |
|---|---|---|
| `acao` | `novo-projeto`, `tela`, `componente`, `ferramenta`, `revisao`, `mockup` | pergunta |
| `nome` | nome do projeto, tela ou componente | pergunta |
| `tema` | `claro`, `escuro`, `ambos` | `ambos` (a base é **escura por padrão**) |
| `ferramentas` | `mensagens`, `avisos`, `codigo`, `camera`, `qrcode`, `minio`, `pwa` | pergunta (novo projeto) |

## Como executar cada ação

1. **novo-projeto** — siga `references/novo-projeto.md`: estrutura por módulos, dependências e versões (`references/stack.md`), tokens com a marca nova (`references/tokens.md`), as ferramentas escolhidas (`references/ferramentas.md`). Mostre a árvore e as variáveis de ambiente antes de criar arquivos.
2. **tela / componente** — procure componente existente no projeto e reuse; use tokens, `references/componentes.md` e `references/layout.md`. Valide pelo checklist.
3. **ferramenta** — leia a seção da ferramenta em `references/ferramentas.md` (regras, tabelas, variáveis de ambiente), implemente no projeto, crie a migração e descreva como testar.
4. **revisao** — leia o alvo, aplique o checklist e entregue achados (arquivo:linha, problema, correção); **não edite** sem pedir.
5. **mockup** — HTML estático autônomo: bloco `:root/.dark` de `references/tokens.md`, classes com o prefixo `md-`, Phosphor via `@phosphor-icons/web@2.1.1`.

Hábitos que a base recomenda: trabalhar em branch de desenvolvimento; hot-reload para `.ts/.tsx/.css`; reconstruir contêiner só ao mudar dependências, `.env` ou infraestrutura; commits `feat(módulo): …`; um registro em `docs/` por entrega.

## Essencial do visual

- **Estilo:** Apple HIG; cartões Bento (raios 12/20/28), botões cápsula, vidro só em barras, sombras difusas, sem blobs/auras, sem emojis como marcador.
- **Cor:** uma cor primária (padrão azul `#0071e3` claro / `#0a84ff` escuro; **troque pela marca do projeto** e confira contraste AA) e cores de estado: sucesso, alerta, perigo.
- **Superfícies:** claro `#f5f5f7` / `#ffffff`; escuro `#000000` / `#141416` (muted `#1c1c1e`). **Texto:** `#1d1d1f`, `#515154`, `#86868b` / `#f5f5f7`, `#a1a1a6`, `#6e6e73`.
- **Fonte:** SF Pro com Inter de reserva; títulos com tracking `-0.024em`; campos de 16 px.
- **Ícones:** Phosphor, `duotone` padrão; `bold` em ação; `fill` em ativo; `regular` em aba inativa.
- **Padrão:** celular primeiro (390 px), alvos de 44 px, barra de abas flutuante, rodapé fixo em fluxos, detalhe em folha de baixo, lista longa recolhida.
- **Tom:** claro e curto; sem clichês; sem prometer o que o produto não faz; números só com fonte.

## Checklist de revisão

- [ ] Cores só por token; conferido nos temas pedidos
- [ ] Alvo de toque ≥ 44 px; campo 16 px; raios 12/20/28
- [ ] Uma ação principal por tela; secundária em botão claro
- [ ] 390 px sem rolagem horizontal; nada atrás da barra de abas
- [ ] Foco visível; `aria-label` em botão só de ícone; reduzir movimento respeitado
- [ ] Reutilizou componente existente; ícone no peso certo
- [ ] Lista longa recolhida; detalhe em folha de baixo
- [ ] Recursos do aparelho só pela camada `aparelho()`
- [ ] Texto sem clichê, sem emoji, sem promessa vazia

## Referências (`references/`)

- `novo-projeto.md` — receita para criar um projeto novo
- `ferramentas.md` — especificação das ferramentas reutilizáveis
- `stack.md` — tecnologias e versões
- `tokens.md` — cores, tipografia, raios, sombras, bloco CSS pronto
- `componentes.md` — botões, selos, cartões, folha, abas, campos, receitas
- `layout.md` — grade, cabeçalho, barra de abas, menu da conta, fluxo em etapas, movimento
- `fontes.md` — referências de design e skills de design recomendadas
