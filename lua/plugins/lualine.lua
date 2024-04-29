return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = "auto",
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = '┃'},
        component_separators = { left = '┃', right = '┃' },
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
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {
          {
            function() return " " end,
            padding = 0
          },
        },
        lualine_b = {
          {
            function() return "Sirikakire" end,
            icon = "󱁇"
          },
          {
            'branch',
            icon = ""
          },
          -- 'branch',
          -- {
          --   'diff',
          --   symbols = {
          --     added = " ",
          --     modified = "󰈚 ",
          --     removed = " "
          --   },
          -- },
          -- {
          --   'diagnostics',
          --   symbols = {
          --     error = " ",
          --     warn = " ",
          --     info = " ",
          --     hint = " "
          --   },
          -- }
        },
        lualine_c = {
          "buffer"
        },
        lualine_x = {},
        lualine_y = {
          {
            'filetype',
          },
          {
            'progress',
          },
          {
            'datetime',
            style = '%H:%M:%S %d/%m/%Y',
            icon = "󰥔"
          }
        },
        lualine_z = {
          {
            function() return " " end,
            padding = 0
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
        "mason"
      }
    }
  end
}
