vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")

vim.keymap.set("n", "<C-c>", "<cmd>close<cr>")
vim.keymap.set("n", "<C-f>", "<cmd>Files<cr>")
vim.keymap.set("n", "<TAB>", "<cmd>bnext<cr>")
vim.keymap.set("n", "<S-TAB>", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<Leader>e", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<Leader>d", "<cmd>bd<cr>")
-- Copy all text in the file
vim.keymap.set("n", "ya", "ggVGy")
-- Toggle DBUI
vim.keymap.set("n", "<Leader>c", "<cmd>DBUIToggle<cr>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
