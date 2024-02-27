return {
  'rcarriga/nvim-notify',
  opts = {
    render = "wrapped-compact",
  },
  config = function()
    vim.notify = require('notify')
  end
}
