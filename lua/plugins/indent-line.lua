return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = 'BufRead',
  config = function ()
    -- require("ibl").setup {
    --   exclude = {
    --     filetypes = {
    --       "dashboard",
    --       "mason",
    --       "neo-tree",
    --       "NvimTree",
    --       "lazy",
    --       "toggleterm",
    --       "copilot-chat",
    --       "TelescopePrompt"
    --     }
    --   },
    --   scope = { enabled = false },
    --   indent = {
    --     -- char = "▏",
    --     -- char = "▎"
    --     char = "┃"
    --   }
    -- }
  end
}
