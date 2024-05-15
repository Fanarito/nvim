-- This file is automatically loaded by plugins.core
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.nu = true             -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.shiftround = true     -- Round indent
opt.shiftwidth = 4        -- Size of an indent
opt.tabstop = 4           -- Number of spaces tabs count for
opt.scrolloff = 8         -- Keep at least 8 lines loaded from top of screen
opt.completeopt = "menu,menuone,noselect"

opt.swapfile = false -- Disable swap file
opt.incsearch = true -- Enable incremental search

-- Highlight the search but map <Esc> to clear the highlighting
opt.hlsearch = true -- Disable search highlighting
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')

opt.wrap = false -- Disable softwrap

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end

-- Set keymaps for terminal
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Only show top 15 items in completion menu
opt.pumheight = 15
