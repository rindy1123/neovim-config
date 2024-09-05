require("conform").setup({
	-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "gofmt", "golines" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		rust = { "rustfmt" },
		json = { "jq" },
		markdown = { "mdformat" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
	["*"] = { "codespell", "trim_whitespace" },
})
