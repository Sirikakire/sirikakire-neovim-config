return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 5000,
          winbar = 5000,
        }
      },
      sections = {
        lualine_a = {
          -- {
          --   function () return "" end,
          --   padding = 0,
          --   separator = { left = "", right = "█" },
          --   draw_empty = true,
          -- },
          {
            "buffers",
            color = { gui = "" },
            hide_filename_extension = true,
            use_mode_colors = false,
            max_length = vim.fn.winwidth(0) * 1 / 2,
            symbols = {
              modified = ' ●',      -- Text to show when the buffer is modified
              alternate_file = '', -- Text to show to identify the alternate file
              directory =  '',     -- Text to show when the buffer is a directory
            },
          }
        },
        lualine_c = {
          -- { function() return "Sirikakire" end, icon = "" },
        },
        lualine_b = {},
        lualine_x = {},
        lualine_y = {
          {
            function ()
              local curr_line = vim.fn.line('.')
              local lines = vim.fn.line('$')
              local sbar = require("utils").sbar
              local divide = curr_line / lines
              -- local percentage = curr_line == 1 and "Top"
              --                                     or curr_line == lines
              --                                   and "Bot"
              --                                     or round(divide * 100) .. '%%'
              local i = require("init").round(divide * #sbar)
              i = i == 0 and 1 or i

              -- return percentage .. ' ' .. sbar[i]
              return sbar[i]
            end,
            padding = { left = 1, right = 1 }
          },
          {
            'datetime',
            style = '%H:%M %d/%m/%Y',
            icon = "󱑔",
            color = function()
              local opt = {}
              if vim.g.terminal_color_2 then
                opt.fg = vim.g.terminal_color_2
              end
              return opt
            end,
            padding = { left = 0, right = 1 }
          },
        },
        lualine_z = {
          {
            'branch',
            icon = "",
            fmt = require("init").trunc(95),
            color = {
              gui = "",
            }
          },
        }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {
        "neo-tree",
        "toggleterm",
        "lazy",
        "mason",
        "nvim-tree"
      }
    }
  end
}
