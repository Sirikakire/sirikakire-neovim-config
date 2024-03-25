return {
  'rcarriga/nvim-notify',
  config = function()
    require("notify").setup({
      background_colour = "NotifyBackground",
      fps = 60,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
      },
      level = 2,
      minimum_width = 50,
      render = "wrapped-compact",
      stages = "slide",
      time_formats = {
        notification = "%T",
        notification_history = "%FT%T"
      },
      timeout = 5000,
      top_down = true
    })
    vim.notify = require('notify')
    vim.keymap.set("n", "<leader>nt", ":lua require('notify').notify('This is a test notification', 'error')<CR>")
  end
}
