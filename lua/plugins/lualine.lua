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
          winbar = {
            "toggleterm",
            "NvimTree"
          },
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
          {
            function () return "" end,
            padding = 0,
            separator = { left = "", right = "█" },
            draw_empty = true,
          },
          -- {
          --   "buffers",
          --   color = { gui = "" },
          --   hide_filename_extension = true,
          --   use_mode_colors = false,
          --   max_length = vim.o.columns * 1 / 3,
          --   buffers_color = {
          --     active = 'lualine_a_buffers_insert',
          --     inactive = 'lualine_a_buffers_inactive',
          --   },
          --   symbols = {
          --     modified = ' ●',      -- Text to show when the buffer is modified
          --     alternate_file = '', -- Text to show to identify the alternate file
          --     directory =  '',     -- Text to show when the buffer is a directory
          --   },
          -- }
        },
        lualine_b = {},
        lualine_c = {
          {
            function() return "Sirikakire" end, icon = "",
            color = function ()
              local opts = {}
              if vim.g.terminal_color_4 then
                opts.fg = vim.g.terminal_color_4
              end
              return opts
            end
          },
          {
            'branch',
            icon = "",
            color = function ()
              local opt = {}
              if vim.g.terminal_color_1 then
                opt.fg = vim.g.terminal_color_1
              end
              return opt
            end
          }
        },
        lualine_x = {
          {
            function ()
              local curr_line = vim.fn.line('.')
              local lines = vim.fn.line('$')
              local sbar = require("utils").sbar
              local divide = curr_line / lines
              local percentage = curr_line == 1 and "Top"
              or curr_line == lines
              and "Bot"
              or require("init").round(divide * 100) .. '%%'
              local i = require("init").round(divide * #sbar)
              i = i == 0 and 1 or i

              return percentage .. ' ' .. sbar[i]
            end,
            color = function ()
              local opts = {}
              if vim.g.terminal_color_3 then
                opts.fg = vim.g.terminal_color_3
              end
              return opts
            end
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
          },
        },
        lualine_y = {},
        lualine_z = {
          {
            function () return "" end,
            padding = 0,
            separator = { left = "", right = "█" },
            draw_empty = true,
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
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {}
      },
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
