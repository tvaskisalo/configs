require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	integrations = {
		treesitter = true,
		nvimtree = true,
	},
})
vim.cmd.colorscheme("catppuccin")
