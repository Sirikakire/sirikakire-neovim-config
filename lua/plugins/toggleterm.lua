return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function ()
      require("toggleterm").setup({
        shade_terminals = false,
        persist_size = true,
        persist_mode = false,
        start_in_insert = false,
        direction = "float",
        auto_scroll = true,
        title_pos = "center",
        float_opts = {
          border = require(".plugins.border"),
        },
      })
    end
  }
}
