-- [[ Pre-config ]]
-- Leader key (should happen before plugins loaded)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Nerd Font
vim.g.have_nerd_font = true

-- [[ Options ]] `:help vim.opt` `:help option-list`

-- replace netrw with nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- editor
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.showmode = false          -- already in status line

vim.opt.clipboard = 'unnamedplus' -- sync with OS `:help clipboard`
vim.opt.breakindent = true        -- indent wrapped lines

vim.o.mouse = 'a'                 -- enable mouse
