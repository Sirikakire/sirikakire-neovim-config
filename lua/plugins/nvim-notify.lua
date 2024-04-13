return {
  'rcarriga/nvim-notify',
  config = function()
		require("notify").setup({
			-- background_colour = "Normal",
			background_colour = vim.b.transparent_background and "#000000" or "Normal",
			fps = 60,
			icons = {
				DEBUG = " ",
				ERROR = " ",
				INFO = " ",
				TRACE = " ✎",
				WARN = " "
			},
			-- level = 0,
			minimum_width = 50,
			render = "compact",
			stages = "fade",
			time_formats = {
				notification = "%T",
				notification_history = "%FT%T"
			},
			timeout = 2000,
			top_down = true
		})
		vim.notify = require('notify')
	end
}
