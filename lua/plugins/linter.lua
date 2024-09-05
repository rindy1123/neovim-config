require("lint").linters_by_ft = {
	-- https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
	javascript = { "eslint", "cspell" },
	typescript = { "eslint", "cspell" },
	typescriptreact = { "eslint", "cspell" },
	go = { "cspell" },
	rust = { "cspell" },
	lua = { "cspell" },
	solidity = { "solhint" },
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint(nil, { ignore_errors = true })
	end,
})
