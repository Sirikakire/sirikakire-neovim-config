return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim'
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    insert_at_start = false,
    vim.keymap.set('n', '<A-,>', ':BufferPrevious<CR>'),
    vim.keymap.set('n', '<A-.>', ':BufferNext<CR>'),
    vim.keymap.set('n', '<A-c>', ':BufferClose')
  },
  -- version = 'main',
  config = function()
    require('barbar').setup({
      animation = true,

      -- Automatically hide the tabline when there are this many buffers left.
      -- Set to any value >=0 to enable.
      auto_hide = false,

      -- Enable/disable current/total tabpages indicator (top right corner)
      tabpages = true,

      -- Enables/disable clickable tabs
      --  - left-click: go to buffer
      --  - middle-click: delete buffer
      clickable = true,

      -- Excludes buffers from the tabline
      exclude_ft = { 'neo-tree' },
      exclude_name = {},

      -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
      -- Valid options are 'left' (the default), 'previous', and 'right'
      focus_on_close = 'left',

      -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
      -- hide = {extensions = true, inactive = true},

      -- Disable highlighting alternate buffers
      highlight_alternate = true,

      -- Disable highlighting file icons in inactive buffers
      highlight_inactive_file_icons = true,

      -- Enable highlighting visible buffers
      highlight_visible = true,

      icons = {
        -- Configure the base icons on the bufferline.
        -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
        buffer_index = false,
        buffer_number = false,
        button = '',
        ---- Enables / disables diagnostic symbols
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = {enabled = false},
          [vim.diagnostic.severity.WARN] = {enabled = false},
          [vim.diagnostic.severity.INFO] = {enabled = false},
          [vim.diagnostic.severity.HINT] = {enabled = false},
        },
        gitsigns = {
          added = {enabled = false, icon = '+'},
          changed = {enabled = false, icon = '~'},
          deleted = {enabled = false, icon = '-'},
        },
        filetype = {
          -- Sets the icon's highlight group.
          -- If false, will use nvim-web-devicons colors
          custom_colors = false,

          -- Requires `nvim-web-devicons` if `true`
          enabled = true,
        },
        separator = {left = '▎', right = ''},
        -- separator = {left = '|', right = '|'},

        -- If true, add an additional separator at the end of the buffer list
        -- separator_at_end = true,

        -- Configure the icons on the bufferline when modified or pinned.
        -- Supports all the base icon options.
        modified = {button = '●'},
        pinned = {button = '', filename = true},

        -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
        preset = 'default',

        -- Configure the icons on the bufferline based on the visibility of a buffer.
        -- Supports all the base icon options, plus `modified` and `pinned`.
        -- alternate = {filetype = {enabled = true}},
        -- current = {buffer_index = true},
        -- inactive = {button = '×'},
        -- visible = {modified = {buffer_number = true}},
      },

      -- If true, new buffers will be inserted at the start/end of the list.
      -- Default is to insert after current buffer.
      insert_at_end = false,
      insert_at_start = false,

      -- Sets the maximum padding width with which to surround each tab
      maximum_padding = 0,

      -- Sets the minimum padding width with which to surround each tab
      minimum_padding = 0,

      -- Sets the maximum buffer name length.
      maximum_length = 30,

      -- Sets the minimum buffer name length.
      minimum_length = 20,

      -- If set, the letters for each buffer in buffer-pick mode will be
      -- assigned based on their name. Otherwise or in case all letters are
      -- already assigned, the behavior is to assign letters in order of
      -- usability (see order below)
      semantic_letters = true,

      -- Set the filetypes which barbar will offset itself for
      -- sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = nil}
        -- NvimTree = true,
        -- NeoTree = true
        -- Or, specify the text used for the offset:
        -- undotree = {text = 'undotree'},
        -- Or, specify the event which the sidebar executes when leaving:
        -- ['neo-tree'] = {event = {'BufWipeout', 'BufEnter'},
        -- Or, specify both
        -- Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
      -- },

      -- New buffer letters are assigned in this order. This order is
      -- optimal for the qwerty keyboard layout but might need adjustment
      -- for other layouts.
      letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

      -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
      -- where X is the buffer number. But only a static string is accepted here.
      no_name_title = 'Blank buffer',
    })
  end
}
