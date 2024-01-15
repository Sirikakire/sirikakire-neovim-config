return {
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {"italic"},
          functions = {"italic"},
          keywords = {"bold"},
          strings = {},
          variables = {},
          numbers = {"italic"},
          booleans = {"italic"},
          properties = {},
          types = {"bold"},
          operators = {},
        },
        custom_highlights = function(colors)
          return {
            Comment = { fg = "#89AEB1"},
            LineNr = { fg = colors.overlay0 },
            WarningMsg = { style = { "italic" } },
            ErrorMsg = { style = { "italic" } }
          }
        end,
        integrations = {
          cmp = true,
          treesitter = true,
          telescope = { enabled = true },
          notify = true,
          gitsigns = true,
          barbar = true,
          dashboard = true,
          indent_blankline = {
            enabled = true,
            scope_color = "",
            colored_indent_levels = false,
          },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          },

          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })
      -- vim.cmd.colorscheme "catppuccin-mocha"
    end
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      -- vim.cmd.colorscheme "kanagawa"
    end
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme "nightfly"
    end
  },
  {
    "rmehri01/onenord.nvim",
    config = function()
      -- vim.cmd.colorscheme "onenord"
    end
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require 'nordic' .load()
      -- vim.cmd.colorscheme("nordic")
    end
  },
  {
    'AhmedAbdulrahman/aylin.vim', branch = '0.5-nvim',
    config = function()
      --vim.cmd.colorscheme("aylin")
    end
  },
  {
    "EdenEast/nightfox.nvim",
    config = function ()
      -- Default options
      require('nightfox').setup({
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath("cache") .. "/nightfox",
          compile_file_suffix = "_compiled", -- Compiled file suffix
          transparent = false,     -- Disable setting background
          terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false,    -- Non focused panes set to alternative background
          module_default = true,   -- Default enable value for modules
          colorblind = {
            enable = false,        -- Enable colorblind support
            simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
            severity = {
              protan = 0,          -- Severity [0,1] for protan (red)
              deutan = 0,          -- Severity [0,1] for deutan (green)
              tritan = 0,          -- Severity [0,1] for tritan (blue)
            },
          },
          styles = {               -- Style to be applied to different syntax groups
            comments = "italic", -- Change the style of comments
            conditionals = "NONE",
            functions = "bold",
            keywords = "bold",
            strings = "NONE",
            variables = "NONE",
            numbers = "NONE",
            booleans = "NONE",
            properties = "bold",
            types = "bold",
            operators = "bold",
          },
          inverse = {             -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
        },
        palettes = {},
        specs = {},
        groups = {},
      })

      -- setup must be called before loading
      vim.cmd.colorscheme("nordfox")
    end
  }
}
