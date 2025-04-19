local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
lspconfig.clangd.setup({
	capabilities = capabilities,
})
lspconfig.hls.setup({
	capabilities = capabilities,
})
lspconfig.kotlin_language_server.setup({
	init_options = {
		-- Fixes kotlin_language_server crashing on opening kotlin file
		storagePath = vim.fn.resolve(vim.fn.stdpath("cache") .. "/kotlin_language_server"),
	},
	capabilities = capabilities,
})
lspconfig.lua_ls.setup({
	capabilities = capabilities,
})
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = false,
			},
		},
	},
})
lspconfig.ts_ls.setup({
	capabilities = capabilities,
})
lspconfig.nixd.setup({
	capabilities = capabilities,
})
