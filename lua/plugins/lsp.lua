-- Check here to see available lsp servers
-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
-- Don't forget to add the configuration to the end of the file
local servers = {
  "clangd",
  "gopls",
  "lua_ls",
  "rust_analyzer",
  "ts_ls",
  "jsonls",
  "docker_compose_language_service",
  "dockerls",
  "marksman",
  "eslint",
  "diagnosticls",
  "pyright",
  "solidity_ls",
  "svelte",
  "tailwindcss",
}
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Show inline errors and warnings
vim.diagnostic.config({ virtual_text = true })

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

local on_attach = function(_, _)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
  vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs(servers) do
  if lsp == "golsp" then
    lspconfig[lsp].setup({
      on_attach = on_attach,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
      capabilities = capabilities,
    })
  elseif lsp == "eslint" then
    lspconfig[lsp].setup({
      on_attach = function(_, bufnr)
        -- autoformat
        local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = lsp_fmt_group,
          callback = function()
            local efm = vim.lsp.get_clients({ name = "efm" })

            if vim.tbl_isempty(efm) then
              return
            end

            vim.lsp.buf.format({ name = "efm", async = true })
          end,
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
      capabilities = capabilities,
    })
  else
    lspconfig[lsp].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end
end

-- luasnip setup
local luasnip = require("luasnip")

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
    ["<C-d>"] = cmp.mapping.scroll_docs(4),  -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
})
