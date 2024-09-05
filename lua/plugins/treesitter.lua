local configs = require("nvim-treesitter.configs")

configs.setup({
	-- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
	ensure_installed = {
		"c",
		"lua",
		"go",
		"gomod",
		"json",
		"rust",
		"sql",
		"javascript",
		"html",
		"typescript",
		"sql",
		"solidity",
	},
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
