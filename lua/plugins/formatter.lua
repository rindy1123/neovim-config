require("conform").setup({
  -- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
  formatters_by_ft = {
    clang = { "astyle" },
    lua = { "stylua" },
    go = { "goimports", "gofmt", "golines" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    solidity = { "prettierd" },
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
