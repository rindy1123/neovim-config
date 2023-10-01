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

After running neovim, switch into command mode and type them

```vim
" Command Mode
CocInstall coc-spell-checker coc-snippets coc-explorer coc-vimlsp coc-json coc-tsserver coc-prettier coc-eslint coc-stylelint coc-html coc-rust-analyzer coc-db
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

# More Awesome Color Themes

https://github.com/rafi/awesome-vim-colorschemes

# More CoC extensions

https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
