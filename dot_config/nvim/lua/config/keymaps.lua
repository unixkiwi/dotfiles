-- Telescope
vim.keymap.set("n", "<leader><space>", ":Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>f", ":Telescope live_grep<CR>", { desc = "Grep files" })

-- show Neotree
vim.keymap.set("n", "<C-b>", ":Neotree filesystem reveal left<CR>", {})

-- bufferline
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { noremap = true })
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { noremap = true })
vim.keymap.set("n", "<leader>bd", ":bdelete!<CR>", { noremap = true, desc = "Close current buffer (tab)" })

-- flutter
vim.keymap.set("n", "<leader>hf", ":FlutterDebug<CR>", { noremap = true, desc = "Run Flutter Project (Debug)" })
vim.keymap.set("n", "<leader>hr", ":FlutterRun<CR>", { noremap = true, desc = "Run Flutter Project in (Release)" })
vim.keymap.set("n", "<leader>hh", ":FlutterReload<CR>", { noremap = true, desc = "Reload Flutter Project" })
vim.keymap.set("n", "<leader>hH", ":FlutterRestart<CR>", { noremap = true, desc = "Restart Flutter Project" })
vim.keymap.set("n", "<leader>hl", ":FlutterLogToggle<CR>", { noremap = true, desc = "Toggle Flutter Log buffer" })

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<leader>sx", ":close<CR>", { noremap = true, silent = true, desc = "Close split" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true, desc = "Split horizontally" })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Split vertically" })
