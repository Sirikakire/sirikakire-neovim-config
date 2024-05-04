return {
  -- NOTE: making something ndqhuyqwdne
  {
    'rcarriga/nvim-notify',
    event = "VeryLazy",
    keys = require("keymap").notify_keymaps,
    config = function()
      local sign_icons = require("utils").sign_icons
      require("notify").setup({
        background_colour = vim.b.transparent_background and "#000000" or "Normal",
        fps = vim.g.neovide and 30 or 60,
        icons = {
          DEBUG = "  ",
          ERROR = sign_icons.error_2,
          INFO = sign_icons.info_2,
          TRACE = sign_icons.hint_2,
          WARN = sign_icons.warning_2,
        },
        minimum_width = 25,
        render = "default",
        stages = "fade",
        time_formats = {
          notification = "%T",
          notification_history = "%FT%T"
        },
        timeout = 1500,
        top_down = true
      })
      vim.notify = require('notify')
    end
  },
}
