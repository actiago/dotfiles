# Dotfiles

Meus arquivos de configuração gerenciados com [GNU Stow](https://www.gnu.org/software/stow/).

## Estrutura

```
dotfiles/
├── install.sh              # Script de instalação
├── alacritty/              # Alacritty terminal
│   └── .config/alacritty/
│       ├── alacritty.toml
│       └── gruvebox_material.toml
├── bash/                   # Bash
│   └── .bashrc
├── git/                    # Git
│   ├── .gitconfig
│   └── .gitconfig-github-example
├── nvim/                   # Neovim
│   └── .config/nvim/
│       └── init.vim
├── tmux/                   # Tmux
│   └── .tmux.conf
├── vim/                    # Vim
│   └── .vimrc
└── windows/                # Apenas Windows (não gerenciado por stow)
    ├── Microsoft.PowerShell_profile.ps1
    └── settings.json
```

## Como usar

### 1. Instalar o GNU Stow

```bash
# Ubuntu/Debian
sudo apt install stow

# Fedora
sudo dnf install stow

# Arch Linux
sudo pacman -S stow

# openSUSE
sudo zypper install stow
```

### 2. Instalar os dotfiles

```bash
# Instalar todos os pacotes
./install.sh

# Instalar apenas pacotes específicos
./install.sh bash git nvim

# Ver ajuda
./install.sh --help
```

O script faz backup automático dos arquivos existentes antes de criar os symlinks.

### 3. Gerenciar manualmente com Stow

```bash
# Instalar um pacote
stow -d ~/projetos/github/dotfiles -t $HOME bash

# Remover um pacote
stow -D -d ~/projetos/github/dotfiles -t $HOME bash

# Atualizar após alterações
stow --restow -d ~/projetos/github/dotfiles -t $HOME bash
```

## Requisitos

### Linux

- zsh
- [oh-my-zsh](https://ohmyz.sh/#install)
- [powerlevel10k zsh theme](https://github.com/romkatv/powerlevel10k)
- vim
- neovim
- [vim-plug](https://github.com/junegunn/vim-plug)
- tmux com [TPM](https://github.com/tmux-plugins/tpm)
- git
- GNU Stow

### Windows

- Poweshell 7
- Alacritty
- Winget
- [OhMyPosh](https://ohmyposh.dev/)
- Windows Terminal

### ToDo

- [ ] Trocar o [tmux-config](https://github.com/samoshkin/tmux-config) pelo [.tmux](https://github.com/gpakosz/.tmux)
