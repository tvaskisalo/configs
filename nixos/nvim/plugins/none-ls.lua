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
					vim.lsp.buf.format({ async = false, timeout_ms = 2000 })
				end,
			})
		end
	end,
	sources = {
		null_ls.builtins.formatting.rustywind, -- TailwindCSS
		null_ls.builtins.formatting.stylua, -- Lua
		null_ls.builtins.formatting.prettierd, -- Typescript/Javascript
		null_ls.builtins.formatting.nixfmt, -- Nix
		null_ls.builtins.formatting.ktlint, -- Kotlin
		null_ls.builtins.formatting.black, -- Python
		null_ls.builtins.diagnostics.ktlint, -- Kotlin
		null_ls.builtins.diagnostics.alex, -- Markdown
		null_ls.builtins.diagnostics.markdownlint_cli2, -- Markdown
		null_ls.builtins.diagnostics.statix, -- Nix
		null_ls.builtins.diagnostics.pylint, -- Python
		null_ls.builtins.completion.luasnip, -- Lua
	},
})
