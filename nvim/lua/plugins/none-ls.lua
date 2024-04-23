return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				require("none-ls.code_actions.eslint"),
				require("none-ls.diagnostics.eslint"),
				require("none-ls.formatting.eslint"),
				null_ls.builtins.formatting.rustywind,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.ktlint,
				null_ls.builtins.diagnostics.alex,
				null_ls.builtins.diagnostics.markdownlint,
			},
		})
		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({ timeout_ms = 5000 })
		end, {})
	end,
}
