return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 50, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    notify = true,
    preset = "helix",
    delay = 1000,    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    icons = {
      -- breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      -- separator = "➜", -- symbol used between a key and it's label
      -- group = "+", -- symbol prepended to a group
      breadcrumb = "", -- symbol used in the command line area that shows your active key combo
      separator = "󰛂", -- symbol used between a key and it's label
      group = "󰐗 ", -- symbol prepended to a group
    },
    win = {
      -- don't allow the popup to overlap with the cursor
      no_overlap = true,
      -- width = 1,
      -- height = { min = 4, max = 25 },
      -- col = 0,
      -- row = math.huge,
      -- border = "none",
      padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      title = true,
      title_pos = "center",
      zindex = 1000,
      -- Additional vim.wo and vim.bo options
      bo = {},
      wo = {
        -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      },
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    show_help = true, -- show a help message in the command line for using WhichKey
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    triggers = {
      { "<auto>", mode = "nxsot" }
    }, -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specifiy a list manually
    -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by default for Telescope
    disable = {
      buftypes = {},
      filetypes = {},
    },
  }
}
