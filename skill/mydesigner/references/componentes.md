# Componentes

## Botões (cápsula, min 44 px, 14/600)
- `.recila-btn-primary` fundo `#007a57`, hover `#0a6649`, `:active` scale .98 — uma por tela
- `.recila-btn-primary.recila-oleo` fundo `#b45309`
- `.recila-btn-secondary` surface + borda forte
- `.recila-btn-perigo` `#d70015` — só para o que não tem volta

## Selos
`.recila-badge` + `-green|-blue|-purple|-amber` (11/600). `StatusPerfil`: azul = enviado/em análise, âmbar = pendência, verde = aprovado, vermelho = reprovado/suspenso.

## Cartões
- `.recila-card` (raio 20, padding 22, sombra soft, hover sobe 2 px) · `.recila-card-lg` (raio 28, padding 28/36) · `.recila-card-glass` (vidro, só barras) · `.recila-metric`
- `CartaoOperacional` (`src/modulos/inicio/componentes/InicioConta.tsx`): props `href, Icone, titulo, detalhe, destaque, badgePill, matiz, aoClicar`. Normal: min-h 148, raio 24, ícone 52×52 raio 17 sobre degradê, título 15,5/700, detalhe 12,5 muted (1 linha), seta ↗ ou selo no canto. `destaque` = hero largura total. `aoClicar` abre folha em vez de navegar.
- Largura total: avisos (bolinha rosa pulsante quando há não lidos; "Tudo em dia") e saudação (card com a mesma superfície).

## Abas segmentadas
`SegmentedControl`: trilho pílula (surface-muted), opção min-h 44, ativa = pílula branca que desliza (`layoutId`), `role="radiogroup"`. Valor recebido como string: converta ao guardar em estado tipado.

## Folha de baixo
`BottomSheet` (`src/components/ui/BottomSheet.tsx`): props `aberto, onFechar, titulo, tamanho ("auto"|"grande"), rodape, fundo`. Celular: sobe de baixo, raio superior 28, alça 40×6; desktop: painel central. Mola 420/40. Fecha com arrastar, fundo, X ou Esc; prende o foco; trava a rolagem; `grande` = 92 dvh.

## Outros
`BotaoVoltar` (volta ao histórico, com destino de reserva), `Confirmacao`, `EstadoVazio`, `ErroNaAba`, `SemInternet`, `SeletorEndereco` (cadastro, CNPJ ou outro), sonner (toast no canto superior direito, `richColors`).
Campos: min-h 44–48, raio 12–16, borda `line-forte`, foco com borda `brand`, texto 16 px.

## Receitas
```tsx
// Tela
<div className="recila-page max-w-2xl mx-auto space-y-6">
  <BotaoVoltar reserva="/" />
  <header className="recila-page-header"><h1 className="recila-page-title">Título</h1><p className="recila-page-subtitle">Apoio.</p></header>
  <section className="recila-card">…</section>
</div>
// Cartão da grade
<CartaoOperacional href="/rota" Icone={ChartLineUp} titulo="Impacto da Rede" detalhe="8 este mês" matiz="verde" />
// Detalhe sob demanda
<BottomSheet aberto={aberto} onFechar={() => setAberto(false)} titulo="Título" tamanho="grande">…</BottomSheet>
```
Lista longa: sanfona (uma aberta por vez) com contador no título; item em linha única, detalhe ao tocar; padrão preenchido.
