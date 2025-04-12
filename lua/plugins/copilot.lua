require("copilot").setup({
  suggestion = {
    auto_trigger = true,
    debounce = 300,
    keymap = {
      accept = "<A-y>",
    },
  },
  filetypes = {
    yaml = true,
    markdown = true,
    gitcommit = true,
    gitrebase = true,
  },
})
