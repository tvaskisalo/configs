return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "kotlin_language_server", "lua_ls", "markdown_oxide", "rust_analyzer", "tsserver" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.kotlin_language_server.setup({
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
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.nixd.setup({
   			cmd = { "nixd" },
				settings = {
					nixd = {
						 nixpkgs = {
									expr = "import <nixpkgs> { }",
						 },
						 formatting = {
								command = { "nixpkgs-fmt" },
						 },
						 options = {
								nixos = {
									 expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.k-on.options',
								},
								home_manager = {
									 expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."ruixi@k-on".options',
								},
						 },
					},
				},
			})
			vim.keymap.set("n", "<space>T", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
