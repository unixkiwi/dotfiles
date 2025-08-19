vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])

vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.completeopt = { "fuzzy", "menu", "menuone", "noselect" }
vim.opt.mouse = "a"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.termguicolors = true

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
