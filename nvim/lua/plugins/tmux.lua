return {
	"aserowy/tmux.nvim",
	config = function()
		local tmux = require("tmux")
		tmux.setup({
			copy_sync = {
				enable = false
			},
		})
	end,
}
