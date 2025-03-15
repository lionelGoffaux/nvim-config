vim.opt.expandtab = true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.g.mapleader = " "

-- disable default errors
vim.diagnostic.config({
	virtual_text = false,
})

-- toggle between buffers
vim.keymap.set('n', '<leader><leader>', '<c-^>', { noremap = true, silent = true })

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
