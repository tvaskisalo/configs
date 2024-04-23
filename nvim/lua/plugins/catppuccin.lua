return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	config = function ()
		-- Colorscheme
		require('catppuccin').setup({
			flavour = 'mocha',
			transparent_background = true,
			integrations = {
				treesitter = true,
			},
		})
		vim.cmd.colorscheme 'catppuccin'
	end
}
