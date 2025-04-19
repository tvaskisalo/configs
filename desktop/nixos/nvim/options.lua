-- Lint settings
vim.o.number = true -- Show line numbers
vim.o.tabstop = 2 -- Tab length
vim.o.shiftwidth = 4 -- Indentation space count
vim.o.smartindent = true -- Auto indent lines
vim.o.wrap = false -- Disable line wrap

-- Leader settings
vim.g.mapleader = " "

-- Clipboard
vim.opt.clipboard = "unnamedplus"
vim.api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", { noremap = true, silent = true })

-- Split navigation
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { silent = true })

-- Unmap arrowkeys
vim.keymap.set({ "n", "v", "i" }, "<Up>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v", "i" }, "<Down>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v", "i" }, "<Left>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v", "i" }, "<Right>", "<Nop>", { silent = true })

-- Telescope keybinds
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

-- Nvim-tree keybinds
require("nvim-tree").setup()
vim.keymap.set("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", { silent = true })

-- LspConfig keybinds
vim.keymap.set("n", "<space>T", vim.lsp.buf.type_definition, {})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- None-ls keybinds
vim.keymap.set("n", "<leader>gf", function()
	vim.lsp.buf.format({ async = false, timeout_ms = 2000 })
end, {})

-- Oil keybinds
require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Dap debugging keybinds
local dap = require("dap")
vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
