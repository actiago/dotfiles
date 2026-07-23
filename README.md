# Dotfiles

Meus arquivos de configuração gerenciados com [GNU Stow](https://www.gnu.org/software/stow/).

## Estrutura

```
dotfiles/
├── install.sh              # Script de instalação
├── alacritty/              # Alacritty → ~/.config/alacritty/
│   └── .config/
│       └── alacritty/
│           ├── alacritty.toml
│           └── gruvebox_material.toml
├── bash/                   # Bash → ~/.bashrc
│   └── .bashrc
├── git/                    # Git → ~/.gitconfig
│   ├── .gitconfig
│   └── .gitconfig-github-example
├── nvim/                   # Neovim → ~/.config/nvim/init.vim
│   └── .config/
│       └── nvim/
│           └── init.vim
├── tmux/                   # Tmux → ~/.tmux.conf
│   └── .tmux.conf
├── vim/                    # Vim → ~/.vimrc
│   └── .vimrc
├── zsh/                    # Zsh → ~/.zshrc e ~/.p10k.zsh
│   ├── .zshrc
│   └── .p10k.zsh
└── windows/                # Apenas Windows (não gerenciado por stow)
    ├── alacritty.toml
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

# Instalar apenas pacotes específicos (ex: zsh, git e alacritty)
./install.sh zsh git alacritty

# Ver ajuda
./install.sh --help
```

O script faz backup automático dos arquivos existentes antes de criar os symlinks.

### 3. Gerenciar manualmente com Stow

Cada diretório na raiz do repositório é um "pacote" Stow. Substitua `<pacote>` pelo nome do diretório desejado (ex: `bash`, `zsh`, `git`, `alacritty`, `tmux`, `vim`, `nvim`).

```bash
# Instalar um pacote (ex: zsh)
stow -d ~/projetos/github/dotfiles -t $HOME zsh

# Remover um pacote
stow -D -d ~/projetos/github/dotfiles -t $HOME zsh

# Atualizar após alterações
stow --restow -d ~/projetos/github/dotfiles -t $HOME zsh
```

## Pós-instalação

Após instalar os dotfiles com Stow, é necessário configurar os gerenciadores de plugins:

### Alacritty

A configuração do Alacritty para Linux é gerenciada pelo Stow. Para instalar apenas o Alacritty:

```bash
# Via script (recomendado)
./install.sh alacritty

# Ou manualmente com Stow
stow --restow -d ~/projetos/github/dotfiles -t $HOME alacritty
```

Isso criará o symlink `~/.config/alacritty/alacritty.toml` apontando para o arquivo no repositório.

> **Nota para Windows**: a configuração do Alacritty para Windows está em `windows/alacritty.toml` e deve ser copiada manualmente para `%APPDATA%\alacritty\alacritty.toml`.

### Tmux - Instalar plugins

O Tmux usa o [TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm).

```bash
# 1. Instalar o TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# 2. Instalar os plugins (dentro do tmux, pressione)
#    Prefix + I  (Ctrl-b seguido de Shift+i)
```

### Zsh - Powerlevel10k

O tema [Powerlevel10k](https://github.com/romkatv/powerlevel10k) é gerenciado pelo Oh My Zsh.

```bash
# 1. Instalar o Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 2. Instalar o Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 3. Personalizar o prompt (opcional)
p10k configure
```

### Neovim - vim-plug

O Neovim usa o [vim-plug](https://github.com/junegunn/vim-plug) para gerenciar plugins.

```bash
# 1. Instalar o vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# 2. Instalar os plugins (dentro do nvim, execute)
#    :PlugInstall
```

## Requisitos

### Linux

- vim
- neovim
- [vim-plug](https://github.com/junegunn/vim-plug)
- tmux com [TPM](https://github.com/tmux-plugins/tpm)
- git
- GNU Stow
- zsh com [Oh My Zsh](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

### Windows

- PowerShell 7
- Alacritty
- Winget
- [OhMyPosh](https://ohmyposh.dev/)
- Windows Terminal
