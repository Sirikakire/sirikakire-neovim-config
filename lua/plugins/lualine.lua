return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
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
          {
            function () return "" end,
            padding = 0,
            separator = { left = "", right = "█" },
            draw_empty = true,
          }
        },
        lualine_b = {
          { function() return "Sirikakire" end, icon = "" },
        },
        lualine_c = {
          {
            'branch',
            icon = "",
            color = function()
              local opt = {}
              if vim.g.terminal_color_1 then
                opt.fg = vim.g.terminal_color_1
              end
              return opt
            end
          },
        },
        lualine_x = {
          { 'filetype' },
          { 'progress' },
          {
            'datetime',
            style = '%H:%M:%S %d/%m/%Y',
            icon = "󰔟",
            color = function()
              local opt = {}
              if vim.g.terminal_color_2 then
                opt.fg = vim.g.terminal_color_2
              end
              return opt
            end
          }
        },
        lualine_y = {},
        lualine_z = {
          {
            function () return "" end,
            padding = 0,
            separator = { left = "", right = "█" },
            draw_empty = true,
          }
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
