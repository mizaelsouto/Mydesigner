# Mydesigner

Skill do Claude Code que serve de **base de design e de ferramentas para criar novos projetos** (Next.js, Tailwind, Phosphor, estilo Apple HIG com cartões Bento, botões cápsula e tema escuro padrão).

Ao ser chamada, ela **pergunta o que você quer fazer** e só então age.

## O que ela faz

| Ação | O que entrega |
|---|---|
| `novo-projeto` | Esqueleto por módulos, dependências com versões, tokens com a sua marca e as ferramentas escolhidas |
| `tela` / `componente` | Peça nova no padrão visual, reaproveitando os componentes existentes |
| `ferramenta` | Adiciona uma ferramenta reutilizável ao projeto |
| `revisao` | Lista de achados contra o design system, sem editar |
| `mockup` | HTML estático autônomo nos temas claro e escuro |

Ferramentas reutilizáveis: **mensagens**, **avisos e push**, **código de validação** (celular, sessão, 2FA), **câmera e foto**, **QR code**, **armazenamento MinIO/S3** e **PWA** sem internet.

## Instalar

```sh
git clone git@github.com:mizaelsouto/Mydesigner.git
cd Mydesigner
sh install.sh
```

Abra uma **sessão nova** do Claude Code (a lista de skills carrega ao abrir) e use:

```
/mydesigner
/mydesigner acao=novo-projeto nome=MeuApp ferramentas=mensagens,avisos,qrcode,minio
```

Para remover: `sh install.sh --remover`.

## Parâmetros (todos opcionais; pulam as perguntas)

| Parâmetro | Valores | Padrão |
|---|---|---|
| `acao` | `novo-projeto`, `tela`, `componente`, `ferramenta`, `revisao`, `mockup` | pergunta |
| `nome` | nome do projeto, tela ou componente | pergunta |
| `tema` | `claro`, `escuro`, `ambos` | `ambos` |
| `ferramentas` | `mensagens`, `avisos`, `codigo`, `camera`, `qrcode`, `minio`, `pwa` | pergunta (novo projeto) |

## Estrutura do repositório

```
skill/mydesigner/
  SKILL.md                 instruções da skill (Passo 0: perguntar o que fazer)
  references/
    novo-projeto.md        receita para criar um projeto a partir da base
    ferramentas.md         código, regras e variáveis de cada ferramenta
    stack.md               tecnologias e versões
    tokens.md              cores, tipografia, raios, sombras e bloco CSS pronto
    componentes.md         botões, selos, cartões, folha de baixo, abas, campos
    layout.md              grade, cabeçalho, barra de abas, menu, movimento
    fontes.md              sites-base e skills de design citadas
install.sh                 instala em ~/.claude/skills/mydesigner
```

## Atualização

Os valores (cores, tamanhos, versões) são uma referência de 07/11/2026. Quando a stack mudar, atualize os arquivos de `skill/mydesigner/references/` e reinstale com `sh install.sh`.

## Licença

[MIT](LICENSE) © 2026 Mizael Souto.
