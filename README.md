## DOT Files

### Usage

1. Install [GNU Stow](https://www.gnu.org/software/stow/) tool
2. Clone this repo inside your home directory with name `.dotfiles`
3. cd into `.dotfiles` directory
4. Execute `stow 'package0_name' 'package1_name'` inside .dotfiles directory to soft link specific dotfile(e.g. `stow neovim alacritty`)
5. ...or `stow .` to include all packages

```
sudo pacman -S stow
git clone git@gitlab.com:vulkano22/dotfiles.git /home/$USER/.dotfiles
cd .dotfile 
stow .
```
### Dependencies

- Neovim:
    - vim-plug
    - fzf
    - fd-find
    - ripgrep
    - gcc
    - g++
    - clangd

    When you set up everything, run the following commands
    from Neovim command line:
    - `:CocInstall coc-pyright`
    - `:CocInstall coc-clangd`
    - `:call mkdp#util#install()`

- Bash and Zsh:
   - exa
   - zsh-autosuggestions

- Tmux:
    - tpm(tmux plugin manager)


---
