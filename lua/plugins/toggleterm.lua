return {
  "akinsho/toggleterm.nvim",
  keys = require("keymap").toggle_term_keymaps,
  config = function()
    require("toggleterm").setup({
      shade_terminals = false,
      persist_size = true,
      persist_mode = false,
      start_in_insert = false,
      direction = "horizontal",
      auto_scroll = true,
      title_pos = "center",
      highlights = {
        NormalFloat = {
          link = "NormalFloat"
        }
      },
      float_opts = {
        border = require("utils").border,
      },
    })
  end,
}
