# Tokens

```css
:root{
  --md-bg:#f5f5f7;--md-surface:#ffffff;--md-surface-muted:#ebebf0;--md-border:rgba(0,0,0,.08);--md-border-strong:#86868b;
  --md-text-main:#1d1d1f;--md-text-muted:#515154;--md-text-light:#86868b;
  --md-primary:#0071e3;--md-primary-dark:#0058b0;--md-primary-light:rgba(0,113,227,.09);
  --md-success:#248a3d;--md-warning:#d97706;--md-danger:#d70015;--md-accent-purple:#af52de;
  --md-radius-sm:12px;--md-radius-md:20px;--md-radius-lg:28px;
  --shadow-sm:0 2px 10px rgba(0,0,0,.03);--shadow-soft:0 4px 24px rgba(0,0,0,.04);--shadow-md:0 10px 30px rgba(0,0,0,.06);--shadow-lg:0 20px 48px rgba(0,0,0,.09);
}
.dark{
  --md-bg:#000;--md-surface:#141416;--md-surface-muted:#1c1c1e;--md-border:rgba(255,255,255,.1);--md-border-strong:#636366;
  --md-text-main:#f5f5f7;--md-text-muted:#a1a1a6;--md-text-light:#6e6e73;
  --md-primary:#0a84ff;--md-primary-dark:#409cff;--md-primary-light:rgba(10,132,255,.14);
  --md-success:#30d158;--md-warning:#ff9f0a;--md-danger:#ff453a;
}
```

Troque `--md-primary*` pela marca do projeto (claro e escuro) e confira contraste AA (texto 4,5:1; contorno de campo 3:1). Em projeto novo, renomeie o prefixo `md-` para o do projeto.

## Classes do Tailwind (via `@theme inline`)
Exponha os tokens como `bg-canvas`, `bg-surface`, `bg-surface-muted`, `border-line`, `border-line-forte`, `text-ink`, `text-muted`, `text-subtle`, `text-brand`, `text-brand-strong`, `bg-brand-soft`. O tema é a classe `.dark` no `<html>` (`@custom-variant dark (&:where(.dark, .dark *))`), escolha salva em `localStorage`; **padrão escuro**. Cor da barra do navegador: `#f5f5f7` (claro) / `#000000` (escuro).

## Cores de significado
- Sucesso, alerta, perigo (acima). Perigo só para o que não tem volta (excluir, desistir): botão `#d70015`, hover `#b80012`.
- Hero: degradê escuro da cor primária (ex.: da primária ao tom 40% mais escuro).
- Matizes de cartão (degradê do quadrado → cor do ícone): ciano `#135A6B→#0B3540` / `#4FE3F5`; indigo `#3B3A86→#22214F` / `#A9A5FF`; verde `#1D6B47→#0F3A27` / `#5EE6A0`; âmbar `#7A5212→#3F2A08` / `#FCC94A`; rosa `#7A2235→#3F111C` / `#FF8FA3`.
- Ação central da barra de abas: degradê da cor primária.

## Tipografia
Stack: `-apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text', 'Inter', ui-sans-serif, system-ui, 'Helvetica Neue', Arial`. Corpo `-0.011em`; títulos `-0.024em`.
Título de página 30 px (40 px ≥ 768) 700; subtítulo 15 px muted; seção 16–18 px 700; título de cartão 15,5 px 700 + detalhe 12,5 px; botão 14 px 600; selo 11–12 px 600; aba 11 px; métrica 28 px 700; etiqueta de destaque 10,5 px 800 maiúsculas.

## Raios e sombras
Raios: 12 (pequeno), 20 (cartão), 28 (cartão grande e folha), 24 (cartão de ação), 26 (destaque), 9999 (cápsula). Sombras: sm, soft, md, lg; hover de cartão sobe 2 px.

## Ícones
Phosphor, provedor global `weight="duotone"`, `size=24`. Ação = `bold`; ativo = `fill`; aba inativa = `regular`.
