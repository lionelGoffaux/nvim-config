vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>Y', '"+yg_', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>yy', '"+yy', { noremap = true, silent = true })

-- Paste from clipboard
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>P', '"+P', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>p', '"+p', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>P', '"+P', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

vim.opt.wrap = false
vim.opt.scrolloff = 8
