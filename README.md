# Setup

First, install neovim

https://github.com/neovim/neovim/wiki/Installing-Neovim

Then,

```bash
cd ~/.config

git clone https://github.com/rindy1123/neovim-config.git

mv neovim-config nvim

nvim
```

If you don't have Nerd Fonts, install it and set it as your terminal font

https://github.com/ryanoasis/nerd-fonts#font-installation

To set up FZF and ripgrep, run

```bash
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

brew install ripgrep

brew install --HEAD universal-ctags/universal-ctags/universal-ctags

brew install the_silver_searcher

brew install fd
```

# Healthcheck commands

```
 :checkhealth
 :ConformInfo
 :LspInfo
```

# Language support

To add support for a language,

1. Go to lsp.lua and add a language to `servers` and set up `lspconfig`
1. Go to formatter.lua and add a formatter if exists
1. Go to linter.lua and add a linter if exists
1. Go to treesitter.lua and add a language

# More Awesome Color Themes

https://github.com/rafi/awesome-vim-colorschemes
