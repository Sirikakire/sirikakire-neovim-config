return {
  -- 'romgrk/barbar.nvim',
  -- init = function() vim.g.barbar_auto_setup = false end,
  -- opts = {
  --   insert_at_start = false,
  -- },
  -- -- version = 'main',
  -- config = function()
  --   require('barbar').setup({
  --     animation = true,
  --
  --     -- Automatically hide the tabline when there are this many buffers left.
  --     -- Set to any value >=0 to enable.
  --     auto_hide = false,
  --
  --     -- Enable/disable current/total tabpages indicator (top right corner)
  --     tabpages = true,
  --
  --     -- Enables/disable clickable tabs
  --     --  - left-click: go to buffer
  --     --  - middle-click: delete buffer
  --     clickable = true,
  --
  --     -- Excludes buffers from the tabline
  --     exclude_ft = { 'neo-tree' },
  --     exclude_name = {},
  --
  --     -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
  --     -- Valid options are 'left' (the default), 'previous', and 'right'
  --     focus_on_close = 'left',
  --
  --     -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
  --     -- hide = {extensions = true, inactive = true},
  --
  --     -- Disable highlighting alternate buffers
  --     highlight_alternate = false,
  --
  --     -- Disable highlighting file icons in inactive buffers
  --     highlight_inactive_file_icons = false,
  --
  --     -- Enable highlighting visible buffers
  --     highlight_visible = true,
  --
  --     icons = {
  --       -- Configure the base icons on the bufferline.
  --       -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
  --       buffer_index = false,
  --       buffer_number = false,
  --       button = ' ',
  --       ---- Enables / disables diagnostic symbols
  --       diagnostics = {
  --         [vim.diagnostic.severity.ERROR] = {enabled = false},
  --         [vim.diagnostic.severity.WARN] = {enabled = false},
  --         [vim.diagnostic.severity.INFO] = {enabled = false},
  --         [vim.diagnostic.severity.HINT] = {enabled = false},
  --       },
  --       gitsigns = {
  --         added = {enabled = false, icon = '+'},
  --         changed = {enabled = false, icon = '~'},
  --         deleted = {enabled = false, icon = '-'},
  --       },
  --       filetype = {
  --         -- Sets the icon's highlight group.
  --         -- If false, will use nvim-web-devicons colors
  --         custom_colors = false,
  --
  --         -- Requires `nvim-web-devicons` if `true`
  --         enabled = true,
  --       },
  --       -- separator = {left = '|', right = '|'},
  --       -- separator = {left = '▎', right = ''},
  --       separator = { left = '', right = '' },
  --       separator_at_end = false,
  --
  --       -- Configure the icons on the bufferline when modified or pinned.
  --       -- Supports all the base icon options.
  --       modified = {button = '● '},
  --       pinned = {button = '', filename = true},
  --
  --       -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
  --       preset = 'default',
  --
  --       -- Configure the icons on the bufferline based on the visibility of a buffer.
  --       -- Supports all the base icon options, plus `modified` and `pinned`.
  --       -- alternate = {filetype = {enabled = true}},
  --       -- current = {buffer_index = true},
  --       -- inactive = {button = '×'},
  --       -- visible = {modified = {buffer_number = true}},
  --     },
  --
  --     -- If true, new buffers will be inserted at the start/end of the list.
  --     -- Default is to insert after current buffer.
  --     insert_at_end = false,
  --     insert_at_start = false,
  --
  --     -- Sets the maximum padding width with which to surround each tab
  --     maximum_padding = 0,
  --
  --     -- Sets the minimum padding width with which to surround each tab
  --     minimum_padding = 2,
  --
  --     -- Sets the maximum buffer name length.
  --     maximum_length = 200,
  --
  --     -- Sets the minimum buffer name length.
  --     minimum_length = 0,
  --
  --     -- If set, the letters for each buffer in buffer-pick mode will be
  --     -- assigned based on their name. Otherwise or in case all letters are
  --     -- already assigned, the behavior is to assign letters in order of
  --     -- usability (see order below)
  --     semantic_letters = true,
  --
  --     -- Set the filetypes which barbar will offset itself for
  --     sidebar_filetypes = {
  --     -- Use the default values: {event = 'BufWinLeave', text = nil}
  --     -- NvimTree = true,
  --     -- NeoTree = true
  --     -- Or, specify the text used for the offset:
  --     -- undotree = {text = 'undotree'},
  --     -- Or, specify the event which the sidebar executes when leaving:
  --     ['neo-tree'] = true
  --     -- Or, specify both
  --     -- Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
  --     },
  --     -- New buffer letters are assigned in this order. This order is
  --     -- optimal for the qwerty keyboard layout but might need adjustment
  --     -- for other layouts.
  --     letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  --
  --     -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  --     -- where X is the buffer number. But only a static string is accepted here.
  --     no_name_title = 'Blank buffer',
  --   })
  -- end
  'akinsho/bufferline.nvim', version = "*",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        mode = "buffers", -- buffers \ set to "tabs" to only show tabpages instead
        style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
        themable = true, -- true | false, -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers = "ordinal", --"none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
        indicator = {
          -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
          icon = '┃',
          style = 'icon', -- 'icon' | 'underline' | 'none',
        },
        -- buffer_close_icon = '󰅖',
        modified_icon = '●',
        -- close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        name_formatter = function(buf)  -- buf contains:
          -- name                | str        | the basename of the active file
          -- path                | str        | the full path of the active file
          -- bufnr (buffer only) | int        | the number of the active buffer
          -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
          -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 18,
        diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = true,
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = ""
            if e == "error" then
              sym = "  "
            elseif e == "warning" then
              sym = "  "
            elseif e == "info" then
              sym = "  "
            elseif e == "hint" then
              sym = "  "
            end
            s = s..sym..n
          end
          return s
        end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        -- custom_filter = function(buf_number, buf_numbers)
        --   -- filter out filetypes you don't want to see
        --   -- if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        --   --     return true
        --   -- end
        --   -- filter out by buffer name
        --   -- if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        --   --     return true
        --   -- end
        --   -- filter out based on arbitrary rules
        --   -- e.g. filter out vim wiki buffer from tabline in your work repo
        --   -- if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        --   --     return true
        --   -- end
        --   -- filter out by it's index number in list (don't show first buffer)
        --   -- if buf_numbers[1] ~= buf_number then
        --   --     return true
        --   -- end
        -- end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "", -- "File Explorer" | function ,
            text_align = "center", -- "left" | "center" | "right"
            separator = false
          }
        },
        color_icons = true, -- true | false, -- whether or not to add the filetype icon highlights
        get_element_icon = function(element)
          local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
          return icon, hl
          -- or
          -- local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
          -- return custom_map[element.filetype]
        end,
        show_buffer_icons = true, -- true | false, -- disable filetype icons for buffers
        show_buffer_close_icons = false, -- true | false,
        show_close_icon = false, -- true | false,
        show_tab_indicators = true, -- true | false,
        show_duplicate_prefix = true, -- true | false, -- whether to show duplicate buffer prefix
        duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        move_wraps_at_ends = true, -- whether or not the move command "wraps" at the first or last position
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = { '┃', '┃' }, -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true, -- false | true,
        always_show_bufferline = true, -- true | false,
        auto_toggle_bufferline = true, -- true | false,
        hover = {
          enabled = false,
          delay = 200,
          reveal = {'close'}
        },
        sort_by = 'insert_after_current',--[[  insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
                -- add custom logic
                return buffer_a.modified > buffer_b.modified
            end ]]
      }
    })
  end
}
