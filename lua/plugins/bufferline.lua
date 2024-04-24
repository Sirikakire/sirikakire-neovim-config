return {
  -- 'romgrk/barbar.nvim',
  -- init = function() vim.g.barbar_auto_setup = false end,
  -- opts = {
  --   insert_at_start = false,
  -- },
  -- config = function()
  --   require('barbar').setup({
  --     animation = true,
  --     auto_hide = false,
  --     tabpages = true,
  --     clickable = true,
  --     exclude_ft = { 'neo-tree' },
  --     exclude_name = {},
  --     focus_on_close = 'left',
  --     highlight_alternate = false,
  --     highlight_inactive_file_icons = false,
  --     highlight_visible = true,
  --     icons = {
  --       buffer_index = true,
  --       buffer_number = false,
  --       button = ' ',
  --       diagnostics = {
  --         [vim.diagnostic.severity.ERROR] = {
  --           enabled = false
  --         },
  --         [vim.diagnostic.severity.WARN] = {
  --           enabled = false
  --         },
  --         [vim.diagnostic.severity.INFO] = {
  --           enabled = false
  --         },
  --         [vim.diagnostic.severity.HINT] = {
  --           enabled = false
  --         },
  --       },
  --       gitsigns = {
  --         added = {enabled = false, icon = '+'},
  --         changed = {enabled = false, icon = '~'},
  --         deleted = {enabled = false, icon = '-'},
  --       },
  --       filetype = {
  --         custom_colors = false,
  --         enabled = true,
  --       },
  --       separator = { left = '┃', right = '' },
  --       inactive = {
  --         separator = {
  --           left = '┃', -- FIX: fix inactive separator still visualize
  --         },
  --       },
  --       separator_at_end = false,
  --       modified = {button = '● '},
  --       pinned = {button = '', filename = true},
  --       preset = 'default',
  --     },
  --     insert_at_end = false,
  --     insert_at_start = false,
  --     maximum_padding = 0,
  --     minimum_padding = 2,
  --     maximum_length = 200,
  --     minimum_length = 0,
  --     semantic_letters = true,
  --     sidebar_filetypes = {
  --       ['neo-tree'] = true
  --     },
  --     letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
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
        numbers = "none", --"none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
        indicator = {
          -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
          icon = ' 󰁙 ',
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
        diagnostics = "flase", -- false | "nvim_lsp" | "coc",
        diagnostics_update_in_insert = false,
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = ""
            if e == "error" then
              sym = "  "
            elseif e == "warning" then
              sym = "  "
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
        -- get_element_icon = function(element)
        --   local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
        --   return icon, hl
        --   -- or
        --   -- local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
        --   -- return custom_map[element.filetype]
        -- end,
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
        separator_style = { '', '' }, -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = false, -- false | true,
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
