return {
  "akinsho/toggleterm.nvim",
  keys = require("keymap").toggle_term_keymaps,
  opts = {
    hide_numbers = true,
    shade_terminals = false,
    shading_factor = -15, -- the percentage by which to lighten dark terminal background, default: -30
    shading_ratio = 0, -- the ratio of shading factor for light/dark terminal background, default: -3
    persist_size = true,
    persist_mode = false,
    start_in_insert = false,
    direction = "horizontal",
    auto_scroll = true,
    title_pos = "center",
    highlights = {
      -- NormalFloat = {
      --   link = "NormalFloat"
      -- },
      -- Normal = {
      --   link = "Normal"
      -- },
      -- SignColumn = {
      --   link = "SignColumn"
      -- }
    },
    float_opts = {
      border = require("utils").border,
    },
    winbar = {
      enabled = false,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end
    },
    responsiveness = {
      -- breakpoint in terms of `vim.o.columns` at which terminals will start to stack on top of each other
      -- instead of next to each other
      -- default = 0 which means the feature is turned off
      -- horizontal_breakpoint = 135,
    },
    on_open = function(term)
      vim.defer_fn(function()
        vim.wo[term.window].winbar = ""
      end, 0)
    end
  }
}
