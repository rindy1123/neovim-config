local lazy = {}
lazy.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
lazy.opts = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print("Installing lazy.nvim....")
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			path,
		})
	end
end

function lazy.setup(plugins)
	-- You can "comment out" the line below after lazy.nvim is installed
	lazy.install(lazy.path)

	vim.opt.rtp:prepend(lazy.path)
	require("lazy").setup(plugins, lazy.opts)
end

local plugin_list = {
	-- Auto pairs for '(' '[' '{'
	{ "jiangmiao/auto-pairs" },
	-- Status Line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- Font
	{ "ryanoasis/vim-devicons" },
	-- Comment out/Uncomment
	{ "tomtom/tcomment_vim" },
	-- Startup Screen
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({

				theme = "hyper",
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	-- colorscheme
	{ "tomasiser/vim-code-dark" },
	{ "folke/tokyonight.nvim" },
	-- LSP
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
	-- Formatter
	{ "stevearc/conform.nvim" },
	-- Linter
	{ "mfussenegger/nvim-lint" },
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	-- Git
	{ "mhinz/vim-signify" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },
	{ "junegunn/gv.vim" },
	-- FZF & vim-rooter
	{ "junegunn/fzf" },
	{ "junegunn/fzf.vim" },
	{ "airblade/vim-rooter" },
	-- File Exproler
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-tree/nvim-tree.lua" },
	-- Toggle Trancparency
	{ "xiyaowong/nvim-transparent" },
	-- Toggle terminal
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{ "toppair/peek.nvim", run = "deno task --quiet build:fast" },
	-- GitHub Copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {},
	},
}
lazy.setup(plugin_list)
