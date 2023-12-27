-- This file is automatically loaded by plugins.core
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.nu = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for
opt.scrolloff = 8 -- Keep at least 8 lines loaded from top of screen
opt.completeopt = "menu,menuone,noselect"

opt.swapfile = false -- Disable swap file
opt.hlsearch = false -- Disable search highlighting
opt.incsearch = true -- Enable incremental search

opt.wrap = false -- Disable softwrap

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end

