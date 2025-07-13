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

-- flutter
vim.keymap.set("n", "<leader>hf", ":FlutterDebug<CR>", { noremap = true, desc = "Run Flutter Project (Debug)" })
vim.keymap.set("n", "<leader>hr", ":FlutterRun<CR>", { noremap = true, desc = "Run Flutter Project in (Release)" })
vim.keymap.set("n", "<leader>hh", ":FlutterReload<CR>", { noremap = true, desc = "Reload Flutter Project" })
vim.keymap.set("n", "<leader>hH", ":FlutterRestart<CR>", { noremap = true, desc = "Restart Flutter Project" })
vim.keymap.set("n", "<leader>hl", ":FlutterLogToggle<CR>", { noremap = true, desc = "Toggle Flutter Log buffer" })
