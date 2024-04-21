return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = "auto",
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        component_separators = { left = '┃', right = '┃'},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {
          function() return "Sirikakire " end,
        },
        lualine_b = {
          {
            'branch',
            icon = "󰊢"
          },
          -- 'branch',
          {
            'diff',
            symbols = {
              added = " ",
              modified = "󰈚 ",
              removed = " "
            },
          },
          {
            'diagnostics',
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = " "
            },
          }
        },
        lualine_c = {},
        lualine_x = {
          -- 'filesize',
        },
        -- lualine_y = {
        --   {
        --     'datetime',
        --     style = '%H:%M:%S %d/%m/%Y',
        --   }
        -- },
        -- lualine_z = {'location'}
        lualine_y = {
          'filetype',
          {
            'progress',
            color = {gui = "bold"}
          }
        },
        lualine_z = {
          {
            'datetime',
            style = '%H:%M:%S %d/%m/%Y',
            icon = " "
          }
        }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        -- lualine_c = {'filename'},
        -- lualine_x = {'location'},
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
        "mason"
      }
    }
  end
}
