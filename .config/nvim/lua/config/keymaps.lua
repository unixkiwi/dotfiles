-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- show Neotree
vim.keymap.set("n", "<C-b>", ":Neotree filesystem reveal left<CR>", {})
vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", {})

-- Format file
vim.keymap.set("n", "<C-S-i>", function()
  vim.lsp.buf.format()
end, {})

-- tabs
vim.keymap.set("n", "<C-w>", ":bd<CR>", {})
vim.keymap.set("n", "<C-Tab>", ":bn<CR>", {})
