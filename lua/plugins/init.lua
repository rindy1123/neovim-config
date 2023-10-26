local lazy = {}
lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end

plugin_list = {
  -- Better Syntax Support
	{'sheerun/vim-polyglot'},
	-- Auto pairs for '(' '[' '{'
	{'jiangmiao/auto-pairs'},
  -- Status Line
	{'vim-airline/vim-airline'},
	{'vim-airline/vim-airline-themes'},
  -- Font
	{'ryanoasis/vim-devicons'},
  -- Parentheses color
	{'luochen1990/rainbow'},
  -- Comment out/Uncomment
	{'tomtom/tcomment_vim'},
  -- Startup Screen
	{'mhinz/vim-startify'},
	-- colorscheme
  {
    'tomasiser/vim-code-dark',
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme codedark]])
    end,
  },
  {'folke/tokyonight.nvim'},
	-- Stable version of coc
	{'neoclide/coc.nvim', branch = 'release'},
  -- Git
	{'mhinz/vim-signify'},
  {'tpope/vim-fugitive'},
  {'tpope/vim-rhubarb'},
	{'junegunn/gv.vim'},
  -- FZF & vim-rooter
	{'junegunn/fzf'},
	{'junegunn/fzf.vim'},
	{'airblade/vim-rooter'},
  -- File Exproler
  {'nvim-tree/nvim-web-devicons'},
  {'nvim-tree/nvim-tree.lua'},
  -- Toggle Trancparency
  {'xiyaowong/nvim-transparent'},
  -- Moving around the file
  {'ggandor/leap.nvim'},
  -- Toggle terminal
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  {'toppair/peek.nvim', run = 'deno task --quiet build:fast'},
  -- Database
  -- :CocInstall coc-db to get auto completion
  {'tpope/vim-dadbod'},
  {'kristijanhusak/vim-dadbod-ui'},
  -- GitHub Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
}
lazy.setup(plugin_list)
