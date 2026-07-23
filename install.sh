#!/bin/bash
#
# install.sh - Gerenciar dotfiles com GNU Stow
#
# Uso: ./install.sh [pacote1 pacote2 ...]
#   Se nenhum pacote for especificado, instala todos (exceto windows)
#
# Exemplos:
#   ./install.sh              # Instala todos os pacotes
#   ./install.sh bash git     # Instala apenas bash e git
#   ./install.sh --help       # Mostra esta ajuda

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Lista de pacotes disponíveis (excluindo windows)
PACKAGES=("alacritty" "bash" "git" "nvim" "tmux" "vim" "zsh")

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

info()  { echo -e "${GREEN}[INFO]${NC} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

show_help() {
    cat << EOF
Uso: ./install.sh [pacote1 pacote2 ...]

Pacotes disponíveis:
$(for pkg in "${PACKAGES[@]}"; do echo "  - $pkg"; done)

Se nenhum pacote for especificado, todos os pacotes acima são instalados.

O diretório 'windows/' não é gerenciado pelo Stow (destinado apenas ao Windows).

Exemplos:
  ./install.sh              # Instala todos os pacotes
  ./install.sh bash git     # Instala apenas bash e git
  ./install.sh --help       # Mostra esta ajuda
EOF
    exit 0
}

# Verificar se o stow está instalado
check_stow() {
    if ! command -v stow &> /dev/null; then
        error "GNU Stow não está instalado."
        echo ""
        echo "  Instale com um dos comandos:"
        echo "    Ubuntu/Debian: sudo apt install stow"
        echo "    Fedora:        sudo dnf install stow"
        echo "    Arch Linux:    sudo pacman -S stow"
        echo "    openSUSE:      sudo zypper install stow"
        echo ""
        exit 1
    fi
}

# Fazer backup de um arquivo existente antes de criar symlink
backup_existing() {
    local target="$1"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        local backup="${target}.backup.$(date +%Y%m%d%H%M%S)"
        warn "Fazendo backup de $target -> $backup"
        mv "$target" "$backup"
    fi
}

# Instalar pacotes
install_packages() {
    local packages_to_install=("$@")

    cd "$DOTFILES_DIR"

    for pkg in "${packages_to_install[@]}"; do
        if [ ! -d "$DOTFILES_DIR/$pkg" ]; then
            warn "Pacote '$pkg' não encontrado. Pulando."
            continue
        fi

        info "Instalando pacote: $pkg"

        # Backup dos arquivos existentes que serão substituídos
        while IFS= read -r -d '' file; do
            relative_path="${file#$DOTFILES_DIR/$pkg/}"
            target="$HOME/$relative_path"
            backup_existing "$target"
        done < <(find "$DOTFILES_DIR/$pkg" -type f -print0)

        # Criar symlinks com stow
        stow --restow --target="$HOME" --dir="$DOTFILES_DIR" "$pkg"
        info "Pacote '$pkg' instalado com sucesso!"
    done
}

# --- Main ---

if [ $# -eq 0 ]; then
    # Sem argumentos: instala todos os pacotes
    check_stow
    install_packages "${PACKAGES[@]}"
elif [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    show_help
else
    # Com argumentos: instala apenas os pacotes especificados
    check_stow
    install_packages "$@"
fi

echo ""
info "Instalação concluída!"
echo ""
echo "Arquivos gerenciados pelo Stow em: $DOTFILES_DIR"
echo "Para remover um pacote: stow -D -d $DOTFILES_DIR -t \$HOME <pacote>"
echo "Para atualizar após alterações: stow --restow -d $DOTFILES_DIR -t \$HOME <pacote>"
