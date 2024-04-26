return {
  "SUSTech-data/wildfire.nvim",
  keys = require("keymap").wildfire_keymaps,
  config = function()
    require("wildfire").setup({
      surrounds = {
        { "(", ")" },
        { "{", "}" },
        { "<", ">" },
        { "[", "]" },
      },
      keymaps = {
        -- init_selection = "<CR>",
        -- node_incremental = "<CR>",
        -- node_decremental = "<BS>",
        init_selection = nil,
        node_incremental = nil,
        node_decremental = nil,
      },
      filetype_exclude = { "qf" }, --keymaps will be unset in excluding filetypes
    })
  end,
}
