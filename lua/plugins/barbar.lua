return {
  "romgrk/barbar.nvim",
  keys = require("keymap").barbar_keymaps,
  event = "VimEnter",
  init = function()
    vim.g.barbar_auto_setup = true
  end,
  opts = {
    animation = true,
    auto_hide = false,
    tabpages = true,
    clickable = true,
    focus_on_close = 'left',
    hide = {extensions = false, inactive = false},
    highlight_alternate = false,
    highlight_inactive_file_icons = false,
    highlight_visible = false,
    icons = {
      buffer_index = false,
      buffer_number = false,
      button = '',
      diagnostics = {
        -- [vim.diagnostic.severity.ERROR] = {enabled = false},
        -- [vim.diagnostic.severity.WARN] = {enabled = false},
        -- [vim.diagnostic.severity.INFO] = {enabled = false},
        -- [vim.diagnostic.severity.HINT] = {enabled = false},
      },
      gitsigns = {
        added = {enabled = false, icon = '+'},
        changed = {enabled = false, icon = '~'},
        deleted = {enabled = false, icon = '-'},
      },
      filetype = {
        custom_colors = false,
        enabled = true,
      },
      inactive = {
        separator = {left = '', right = ''},
      },
      -- separator = {left = '▎', right = ''},
      separator = {left = '', right = ''},
      separator_at_end = false,
      modified = {button = '●'},
      pinned = {button = '', filename = true},
      -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
      preset = 'default',

      -- Configure the icons on the bufferline based on the visibility of a buffer.
      -- Supports all the base icon options, plus `modified` and `pinned`.
      -- alternate = {filetype = {enabled = false}},
      -- current = {buffer_index = true},
      -- inactive = {button = '×'},
      -- visible = {modified = {buffer_number = false}},
    },

    insert_at_end = false,
    insert_at_start = false,
    maximum_padding = 4,
    minimum_padding = 2,
    maximum_length = 30,
    minimum_length = 0,
    semantic_letters = true,

    sidebar_filetypes = {
      NvimTree = true,
    },
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
    no_name_title = nil,
  }
}
