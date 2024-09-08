name = "catppuccin"
priority = 1000
require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	integrations = {
		treesitter = true,
	},
})
vim.cmd.colorscheme("catppuccin")
