return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        -- theme = 'nord',
        -- theme = "nightfox",
        theme = "auto",
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
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
          function ()
           return "󰊢 " .. vim.b.branch_name
          end,
          -- 'branch',
          'diff',
          'diagnostics'
        },
        lualine_c = {},
        lualine_x = {
          'filetype',
          'filesize',
        },
        lualine_y = {
          {
            'datetime',
            style = '%H:%M:%S %d/%m/%Y',
          }
        },
        -- lualine_z = {'location'}
        lualine_z = {}
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
