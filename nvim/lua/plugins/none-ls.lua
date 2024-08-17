return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
			sources = {
				require("none-ls.code_actions.eslint"),
				require("none-ls.diagnostics.eslint"),
				require("none-ls.formatting.eslint"),
				null_ls.builtins.formatting.rustywind,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.nixfmt,
				null_ls.builtins.diagnostics.ktlint,
				null_ls.builtins.diagnostics.alex,
				null_ls.builtins.diagnostics.markdownlint_cli2,
				null_ls.builtins.diagnostics.statix,
				null_ls.builtins.completion.luasnip,
			},
		})
		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({ async = false })
		end, {})
	end,
}
