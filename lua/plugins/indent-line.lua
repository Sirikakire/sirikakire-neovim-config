return {
  "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
  event = { 'BufRead', 'BufEnter' },
  config = function ()
    -- local highlight = {
    --   "RainbowRed",
    --   "RainbowYellow",
    --   "RainbowBlue",
    --   "RainbowOrange",
    --   "RainbowGreen",
    --   "RainbowViolet",
    --   "RainbowCyan",
    -- }
    --
    -- local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    -- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ea9ba1" })
    -- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#ecd09d" })
    -- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#90c7f4" })
    -- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#e1bc9a" })
    -- vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#b7d5a2" })
    -- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#deb2ec" })
    -- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#93d0d8" })

    -- vim.api.nvim_set_hl(0, "RainbowRed", { link = "Comment" })
    -- vim.api.nvim_set_hl(0, "RainbowYellow", { link = "Comment" })
    -- vim.api.nvim_set_hl(0, "RainbowBlue", { link = "Comment" })
    -- vim.api.nvim_set_hl(0, "RainbowOrange", { link = "Comment" })
    -- vim.api.nvim_set_hl(0, "RainbowGreen", { link = "Comment" })
    -- vim.api.nvim_set_hl(0, "RainbowViolet", { link = "Comment" })
    -- vim.api.nvim_set_hl(0, "RainbowCyan", { link = "Comment" })
    -- end)

    require("ibl").setup {
      exclude = {
        filetypes = { "dashboard" }
      },
      scope = { enabled = false },
      indent = {
        -- highlight = highlight,
        char = "▏",
      }
    }
  end
}
