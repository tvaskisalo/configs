require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	integrations = {
		treesitter = true,
	},
})
vim.cmd.colorscheme("catppuccin")
