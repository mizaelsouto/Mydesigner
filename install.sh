#!/bin/sh
# Instala a skill Mydesigner para o Claude Code (cópia em ~/.claude/skills/mydesigner).
# Uso: sh install.sh            (instala ou atualiza)
#      sh install.sh --remover  (remove)
set -e
DESTINO="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}/mydesigner"
AQUI="$(cd "$(dirname "$0")" && pwd)"
if [ "$1" = "--remover" ]; then rm -rf "$DESTINO"; echo "Removida: $DESTINO"; exit 0; fi
mkdir -p "$DESTINO"
rm -rf "$DESTINO/references"
cp -R "$AQUI/skill/mydesigner/SKILL.md" "$AQUI/skill/mydesigner/references" "$DESTINO/"
echo "Instalada em: $DESTINO"
echo "Abra uma sessão nova do Claude Code e use /mydesigner"
