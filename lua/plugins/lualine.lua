return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = '', right = '' },
        section_separators = { left = ' ', right = ' ' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 5000,
          tabline = 5000,
          winbar = 5000,
        }
      },
      sections = {
        lualine_a = {
          {
            function() return "Sirikakire" end,
            icon = "󱁂",
          },
        },
        lualine_b = {
          {
            'branch',
            icon = "",
            padding = { left = 1, right = 1 }
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
        lualine_c = { "buffer" },
        lualine_x = {},
        lualine_y = {
          { 'filetype' },
          { 'progress' },
        },
        lualine_z = {
          {
            'datetime',
            style = '%H:%M:%S %d/%m/%Y',
            icon = "󰔟",
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
