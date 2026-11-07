# Tokens (cópia de RecicleUai_2026/src/app/globals.css em 07/11/2026)

```css
:root{
  --recila-bg:#f5f5f7;--recila-surface:#ffffff;--recila-surface-muted:#ebebf0;--recila-border:rgba(0,0,0,.08);--recila-border-strong:#86868b;
  --recila-text-main:#1d1d1f;--recila-text-muted:#515154;--recila-text-light:#86868b;
  --recila-primary:#007a57;--recila-primary-dark:#0d5c41;--recila-primary-light:rgba(0,122,87,.09);
  --recila-secondary:#0071e3;--recila-accent-purple:#af52de;--recila-accent-amber:#d97706;
  --recila-radius-sm:12px;--recila-radius-md:20px;--recila-radius-lg:28px;
  --shadow-sm:0 2px 10px rgba(0,0,0,.03);--shadow-soft:0 4px 24px rgba(0,0,0,.04);--shadow-md:0 10px 30px rgba(0,0,0,.06);--shadow-lg:0 20px 48px rgba(0,0,0,.09);
}
.dark{
  --recila-bg:#000;--recila-surface:#141416;--recila-surface-muted:#1c1c1e;--recila-border:rgba(255,255,255,.1);--recila-border-strong:#636366;
  --recila-text-main:#f5f5f7;--recila-text-muted:#a1a1a6;--recila-text-light:#6e6e73;
  --recila-primary:#30d158;--recila-primary-dark:#4ae06d;--recila-primary-light:rgba(48,209,88,.14);
}
```

## Classes do Tailwind (via `@theme inline`)
`bg-canvas`, `bg-surface`, `bg-surface-muted`, `border-line`, `border-line-forte`, `text-ink`, `text-muted`, `text-subtle`, `text-brand`, `text-brand-strong`, `bg-brand-soft`. O tema é a classe `.dark` no `<html>` (`@custom-variant dark`), escolha em `localStorage` (`recicleuai_tema`; padrão escuro). Barra do navegador: `#f5f5f7` / `#000000`.

## Significado das cores
- Óleo de cozinha: `#b45309` (hover `#92400e`) via `.recila-oleo`
- Ação sem volta: `#d70015` (hover `#b80012`) via `.recila-btn-perigo`
- Hero: degradê `#1E7A52 → #0F4A33`
- Matizes de cartão (degradê do quadrado → cor do ícone): verde `#1D6B47→#0F3A27` / `#5EE6A0`; ciano `#135A6B→#0B3540` / `#4FE3F5`; indigo `#3B3A86→#22214F` / `#A9A5FF`; ambar `#7A5212→#3F2A08` / `#FCC94A`; rosa `#7A2235→#3F111C` / `#FF8FA3`
- Ação central da barra de abas: `#3DD68C → #1A8C5A`

## Tipografia
Stack: `-apple-system, BlinkMacSystemFont, 'SF Pro Display', 'SF Pro Text', 'Inter', ui-sans-serif, system-ui, 'Helvetica Neue', Arial`. Corpo `-0.011em`; títulos `-0.024em`.
Título de página 30 px (40 px ≥ 768) 700; subtítulo 15 px muted; seção 16–18 px 700; cartão operacional 15,5 px 700 + detalhe 12,5 px; botão 14 px 600; selo 11–12 px 600; aba 11 px; métrica 28 px 700; etiqueta do hero 10,5 px 800 maiúsculas.

## Raios e sombras
Raios: 12 (pequeno), 20 (cartão), 28 (cartão grande e folha), 24 (cartão operacional), 26 (hero), 9999 (cápsula). Sombras: sm, soft, md, lg (acima); hover de cartão sobe 2 px.

## Ícones
Phosphor, `IconProvider` com `weight="duotone"`, `size=24`. Ação = `bold`; ativo = `fill`; aba inativa = `regular`.
