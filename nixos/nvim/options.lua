-- Lint settings
vim.o.number = true      -- Show line numbers
vim.o.tabstop = 2        -- Tab length
vim.o.shiftwidth = 2     -- Indentation space count
vim.o.smartindent = true -- Auto indent lines
vim.o.wrap = false       -- Disable line wrap

-- Leader settings
vim.g.mapleader = ' '

-- Clipboard
vim.opt.clipboard = 'unnamedplus'
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })

-- Split navigation
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { silent = true })
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { silent = true })

-- Unmap arrowkeys
vim.keymap.set({'n', 'v', 'i'}, '<Up>', '<Nop>', { silent = true })
vim.keymap.set({'n', 'v', 'i'}, '<Down>', '<Nop>', { silent = true })
vim.keymap.set({'n', 'v', 'i'}, '<Left>', '<Nop>', { silent = true })
vim.keymap.set({'n', 'v', 'i'}, '<Right>', '<Nop>', { silent = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})




