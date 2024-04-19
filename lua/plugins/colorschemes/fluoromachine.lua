return vim.b.colorscheme ~= "fluoromachine" and {} or {
  'maxmx03/fluoromachine.nvim',
  config = function ()
    local fm = require 'fluoromachine'

    fm.setup {
      glow = true,
      theme = 'delta' -- fluoromachine, retrowave, delta
    }

    vim.cmd.colorscheme 'fluoromachine'
  end
}
