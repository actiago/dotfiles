# Changelog

Todas as mudanças notáveis neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/),
e este projeto adere ao [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2026-07-22

### Adicionado

- `windows/alacritty.toml` — configuração do Alacritty para Windows (cópia da config original)

### Alterado

- `alacritty/.config/alacritty/alacritty.toml` — ajustado para Linux: `import` usa `~/.config/alacritty/`, `working_directory` usa `~`, shell alterado para `/bin/bash`
- `VERSION`: atualizado de `1.0.0` para `1.1.0`

## [1.0.1] - 2026-07-22

### Corrigido

- README.md: estrutura atualizada — removido diretório `tmux/.tmux/` inexistente, adicionado pacote `alacritty/`
- README.md: seção de gerenciamento manual com Stow agora usa `<pacote>` como placeholder e `zsh` como exemplo, com explicação clara de que cada diretório é um pacote
- `.pre-commit-config.yaml`: atualizado `pre-commit-hooks` de `v2.1.0` para `v5.0.0`
- `VERSION`: atualizado de `0.2.0` para `1.0.0`

## [1.0.0] - 2026-07-22

### Adicionado

- Gerenciamento via GNU Stow
- Script `install.sh` para instalação automatizada
- Pacotes Stow: `alacritty/`, `bash/`, `git/`, `nvim/`, `tmux/`, `vim/`
- CHANGELOG.md

### Alterado

- Reorganização completa da estrutura de diretórios para compatibilidade com Stow
- `.bashrc` atualizado com a versão do sistema
- `.tmux.conf` atualizado com a versão do sistema (tema Catppuccin)
- `init.vim` atualizado com a versão do sistema (coc.nvim, Catppuccin)
- `.gitignore` atualizado com regras para backups do Stow e Windows
- README.md atualizado com instruções do Stow

### Removido

- Diretório `linux/` (substituído pelos pacotes `bash/` e `tmux/`)
- Diretório `nvim_vim/` (substituído pelos pacotes `nvim/` e `vim/`)

## [0.2.0] - Anterior

### Estrutura antiga

- Organização por sistema operacional: `linux/`, `windows/`
- Sem gerenciamento via Stow
