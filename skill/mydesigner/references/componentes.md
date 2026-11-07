# Componentes (especificação)

Prefixo de classe `md-` (renomeie no projeto). Medidas valem para o código e para mockups.

## Botões (cápsula, min 44 px, 14/600)
- `.md-btn-primary` fundo na cor primária, hover mais escuro, `:active` scale .98 — uma por tela
- `.md-btn-secondary` surface + borda forte
- `.md-btn-perigo` `#d70015` — só para o que não tem volta

## Selos e estado
`.md-badge` (11/600, raio 9999) em variantes verde, azul, roxa e âmbar. Chip de status (12/600, padding 4×12): azul = em andamento, âmbar = pendência, verde = concluído, vermelho = recusado.

## Cartões
- `.md-card` (raio 20, padding 22, borda 1px, sombra soft, hover sobe 2 px) · `.md-card-lg` (raio 28, padding 28/36) · `.md-card-glass` (vidro com blur 20, **só barras**) · `.md-metric` (rótulo 12/600 + valor 28/700).
- **Cartão de ação** (tile): min-h 148, raio 24, padding 16–20; ícone 52×52 raio 17 sobre degradê de matiz; título 15,5/700; detalhe 12,5 muted de uma linha; canto superior direito com selo numérico ou seta ↗ (opacidade .4 → .9 no hover); `:active` scale .97; `aoClicar` opcional para abrir folha em vez de navegar. Matizes: ciano, indigo, verde, âmbar, rosa.
- **Destaque (hero)**: largura total, raio 26, degradê escuro da primária, ícone 56–64 raio 20, etiqueta em maiúsculas; um por tela.
- **Largura total** (avisos, saudação): raio 24, padding 14–20, fundo surface; indicador pulsante quando há não lidos.

## Abas segmentadas
Trilho em pílula (surface-muted, borda), padding 4, opção min-h 44; a opção ativa é uma pílula clara que **desliza** (framer-motion `layoutId`); `role="radiogroup"`.

## Folha de baixo (BottomSheet)
Props: `aberto`, `onFechar`, `titulo`, `tamanho` (`auto` | `grande`), `rodape`, `fundo`. Celular: sobe de baixo, raio superior 28, alça 40×6; desktop: painel central. Mola (stiffness 420, damping 40). Fecha arrastando a alça, tocando no fundo, pelo X ou Esc; prende o foco e devolve ao fechar; trava a rolagem da página; respeita a área segura; `grande` = 92 dvh.

## Outros
Botão **Voltar** (volta ao histórico; sem histórico, vai a um destino de reserva), diálogo de confirmação, estado vazio, erro de aba, aviso de sem internet, seletor de endereço, toast (sonner, canto superior direito, `richColors`).
Campos: min-h 44–48, raio 12–16, borda forte, foco com borda da primária, texto 16 px.

## Receitas
```tsx
// Tela
<div className="md-page max-w-2xl mx-auto space-y-6">
  <BotaoVoltar reserva="/" />
  <header className="md-page-header"><h1 className="md-page-title">Título</h1><p className="md-page-subtitle">Apoio.</p></header>
  <section className="md-card">…</section>
</div>
// Detalhe sob demanda
<BottomSheet aberto={aberto} onFechar={() => setAberto(false)} titulo="Título" tamanho="grande">…</BottomSheet>
```
Lista longa: sanfona (uma aberta por vez) com contador no título; item em linha única, detalhe ao tocar; valor padrão já preenchido; resumo no rodapé fixo.
