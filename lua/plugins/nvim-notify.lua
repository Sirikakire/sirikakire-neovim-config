return {
  'rcarriga/nvim-notify',
  event = "VeryLazy",
  keys = require("keymap").notify_keymaps,
  config = function()
		require("notify").setup({
			background_colour = vim.b.transparent_background and "#000000" or "Normal",
			fps = vim.g.neovide and 30 or 60,
			icons = {
				DEBUG = " ",
				ERROR = " ",
				INFO = " ",
				TRACE = " ✎",
				WARN = " "
			},
			minimum_width = 50,
			render = "wrapped-compact",
			stages = "slide",
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
