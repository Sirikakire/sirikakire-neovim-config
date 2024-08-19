return {
  'rcarriga/nvim-notify',
  event = "VeryLazy",
  keys = require("keymap").notify_keymaps,
  opts = {
    background_colour = vim.b.transparent_background and "#000000" or "Normal",
    fps = vim.g.neovide and 30 or 60,
    icons = {
      DEBUG = "  ",
      ERROR = require("utils").sign_icons.error,
      INFO = require("utils").sign_icons.info,
      TRACE = require("utils").sign_icons.hint,
      WARN = require("utils").sign_icons.warning,
    },
    minimum_width = 25,
    render = "default",
    stages = "fade",
    time_formats = {
      notification = "%T",
      notification_history = "%FT%T"
    },
    timeout = 1000,
    top_down = true
  },
  config = function(_, opts)
    local notify = require('notify')
    notify.setup(opts)
    vim.notify = notify
  end
}
