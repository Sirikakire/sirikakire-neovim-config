return {
  {
    "catppuccin/nvim",
    config = function()
      -- require("catppuccin").setup(require(".plugins.catppuccin-colorscheme.thanhvule3"))
      -- vim.cmd.colorscheme "catppuccin-mocha"
    end
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      -- require("kanagawa").setup({
      --   compile = true,             -- enable compiling the colorscheme
      --   undercurl = true,            -- enable undercurls
      --   commentStyle = { italic = true, bold = true },
      --   functionStyle = { bold = true, italic = true },
      --   keywordStyle = { italic = true},
      --   statementStyle = { bold = true },
      --   typeStyle = { bold = true },
      --   transparent = false,         -- do not set background color
      --   dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
      --   terminalColors = true,       -- define vim.g.terminal_color_{0,17}
      --   colors = {                   -- add/modify theme and palette colors
      --     palette = {},
      --     theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      --   },
      --   overrides = function(colors) -- add/modify highlights
      --     return {}
      --   end,
      --   theme = "wave",              -- Load "wave" theme when 'background' option is not set
      --   background = {               -- map the value of 'background' option to a theme
      --     dark = "wave",           -- try "dragon" !
      --     light = "lotus"
      --   },
      -- })
      -- vim.cmd.colorscheme "kanagawa-dragon"
    end
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    config = function()
      -- vim.g.nightflyVirtualTextColor = true
      -- vim.g.nightglyItalic = true
      -- vim.cmd.colorscheme "nightfly"
    end
  },
  {
    "rmehri01/onenord.nvim",
    config = function()
      --[[ require('onenord').setup({
        theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
        borders = false, -- Split window borders
        fade_nc = false, -- Fade non-current windows, making them more distinguishable
        -- Style that is applied to various groups: see `highlight-args` for options
        -- styles = {
          comments = "italic",
          strings = "NONE",
          keywords = "bold",
          functions = "bold",
          variables = "NONE",
          diagnostics = "underline",
        -- },
        disable = {
          background = false, -- Disable setting the background color
          float_background = false, -- Disable setting the background color for floating windows
          cursorline = false, -- Disable the cursorline
          eob_lines = true, -- Hide the end-of-buffer lines
        },
        -- Inverse highlight for different groups
        inverse = {
          match_paren = false,
        },
        custom_highlights = {}, -- Overwrite default highlight groups
        custom_colors = {}, -- Overwrite default colors
      })
      vim.cmd.colorscheme "onenord" ]]
    end
  },
  {
    'AlexvZyl/nordic.nvim',
    config = function()
      --[[ require 'nordic' .setup {
        -- This callback can be used to override the colors used in the palette.
        on_palette = function(palette)
          -- print(vim.inspect(palette))
          -- return palette
          return palette
        end,
        -- Enable bold keywords.
        bold_keywords = true,
        -- Enable italic comments.
        italic_comments = true,
        -- Enable general editor background transparency.
        transparent_bg = false,
        -- Enable brighter float border.
        bright_border = false,
        -- Reduce the overall amount of blue in the theme (diverges from base Nord).
        reduced_blue = true,
        -- Swap the dark background with the normal one.
        swap_backgrounds = false,
        -- Override the styling of any highlight group.
        -- Cursorline options.  Also includes visual/selection.
        cursorline = {
          -- Bold font in cursorline.
          bold = false,
          -- Bold cursorline number.
          bold_number = true,
          -- Avialable styles: 'dark','light'.
          theme = 'dark',
          -- Blending the cursorline bg with the buffer bg.
          blend = 0.85,
        },
        noice = {
          -- Available styles: `classic`, `flat`.
          style = 'flat',
        },
        telescope = {
          -- Available styles: `classic`, `flat`.
          style = 'flat',
        },
        leap = {
          -- Dims the backdrop when using leap.
          dim_backdrop = false,
        },
        ts_context = {
          -- Enables dark background for treesitter-context window
          dark_background = true,
        },
        override = {},
      }
      vim.cmd.colorscheme("nordic") ]]
    end
  },
  {
    'AhmedAbdulrahman/aylin.vim',
    config = function()
      -- vim.cmd.colorscheme("aylin")
    end
  },
  {
    "EdenEast/nightfox.nvim",
    config = function ()
      -- Default options
      -- require('nightfox').setup({
      --   options = {
      --     -- Compiled file's destination location
      --     compile_path = vim.fn.stdpath("cache") .. "/nightfox",
      --     compile_file_suffix = "_compiled", -- Compiled file suffix
      --     transparent = false,     -- Disable setting background
      --     terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
      --     dim_inactive = false,    -- Non focused panes set to alternative background
      --     module_default = true,   -- Default enable value for modules
      --     colorblind = {
      --       enable = false,        -- Enable colorblind support
      --       simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
      --       severity = {
      --         protan = 0,          -- Severity [0,1] for protan (red)
      --         deutan = 0,          -- Severity [0,1] for deutan (green)
      --         tritan = 0,          -- Severity [0,1] for tritan (blue)
      --       },
      --     },
      --     styles = {               -- Style to be applied to different syntax groups
      --       comments = "italic", -- Change the style of comments
      --       conditionals = "italic,bold",
      --       functions = "italic",
      --       keywords = "bold",
      --       strings = "NONE",
      --       variables = "NONE",
      --       numbers = "NONE",
      --       booleans = "NONE",
      --       properties = "italic",
      --       types = "bold",
      --       operators = "italic,bold",
      --     },
      --     inverse = {             -- Inverse highlight for different types
      --       match_paren = false,
      --       visual = false,
      --       search = false,
      --     },
      --   },
      --   palettes = {},
      --   specs = {},
      --   groups = {},
      -- })
      --
      -- -- setup must be called before loading
      -- vim.cmd.colorscheme("nightfox")
    end
  },
  {
    "sainnhe/everforest",
    config = function ()
      -- vim.g.everforest_background = 'soft'
      -- vim.g.everforest_better_performance = 1
      -- vim.g.everforest_enable_italic = 1
      -- vim.g.everforest_transparent_background = 1
      -- vim.g.everforest_dim_inactive_windows = 1
      -- vim.g.everforest_diagnostic_text_highlight = 1
      -- vim.g.everforest_diagnostic_line_highlight = 1
      -- vim.g.everforest_diagnostic_virtual_text = "highlighted"
      -- vim.cmd.colorscheme("everforest")
    end
  },
  {
    "folke/tokyonight.nvim",
    config = function ()
      -- require("tokyonight").setup({
      --   -- your configuration comes here
      --   -- or leave it empty to use the default settings
      --   style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      --   light_style = "day", -- The theme is used when the background is set to light
      --   transparent = false, -- Enable this to disable setting the background color
      --   terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
      --   styles = {
      --     -- Style to be applied to different syntax groups
      --     -- Value is any valid attr-list value for `:help nvim_set_hl`
      --     comments = { bold = true, italic = true }, -- Change the style of comments
      --     conditionals = { italic = true },
      --     functions = { bold = true, italic = true },
      --     keywords = { bold = true },
      --     strings = {},
      --     variables = {},
      --     numbers = {},
      --     booleans = {},
      --     properties = { bold = true },
      --     types = { bold = true, italic = true },
      --     operators = { bold = true },
      --     -- Background styles. Can be "dark", "transparent" or "normal"
      --     sidebars = "dark", -- style for sidebars, see below
      --     floats = "dark", -- style for floating windows
      --   },
      --   sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      --   day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      --   hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      --   dim_inactive = true, -- dims inactive windows
      --   lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
      --
      --   --- You can override specific color groups to use other groups or a hex color
      --   --- function will be called with a ColorScheme table
      --   on_colors = function(colors) end,
      --
      --   --- You can override specific highlights to use other groups or a hex color
      --   --- function will be called with a Highlights and ColorScheme table
      --   on_highlights = function(highlights, colors) end,
      -- })
      -- vim.cmd.colorscheme("tokyonight-storm")
    end
  },
  {
    'embark-theme/vim',
    config = function()
      -- vim.cmd.colorscheme("embark")
    end
  },
  {
    "oxfist/night-owl.nvim",
    config = function()
      -- vim.cmd.colorscheme("night-owl")
    end
  },
  {
    "rose-pine/neovim",
    config = function()
      --[[ require("rose-pine").setup({
        variant = "auto", -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },
        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },
        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",

          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",

          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",

          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },

        highlight_groups = {
          -- Comment = { fg = "foam" },
          -- VertSplit = { fg = "muted", bg = "muted" },
        },

        before_highlight = function(group, highlight, palette)
          -- Disable all undercurls
          -- if highlight.undercurl then
          --     highlight.undercurl = false
          -- end
          --
          -- Change palette colour
          -- if highlight.fg == palette.pine then
          --     highlight.fg = palette.foam
          -- end
        end,
      }) ]]

      -- vim.cmd("colorscheme rose-pine")
      -- vim.cmd("colorscheme rose-pine-main")
      -- vim.cmd("colorscheme rose-pine-moon")
      -- vim.cmd("colorscheme rose-pine-dawn")
    end
  },
  {
    "drewtempelmeyer/palenight.vim",
    config = function()
      -- vim.cmd.colorscheme("palenight")
    end
  },
  {
    "projekt0n/github-nvim-theme",
    config = function ()
      require("github-theme").setup({})

      -- vim.cmd.colorscheme("github_dark")
    end
  },
  {
    "joshdick/onedark.vim",
    config = function()
      -- vim.cmd.colorscheme("onedark")
    end
  },
  {
    "sainnhe/sonokai",
    config = function()
       -- `'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`, `'espresso'`
      vim.g.sonokai_style = "andromeda"
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_diagnostic_text_highlight = 1
      vim.g.sonokai_diagnostic_line_highlight = 1
      vim.g.sonokai_diagnostic_virtual_text = 1
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_float_style = "dim"
      vim.g.sonokai_dim_inactive_windows = 1
      vim.cmd.colorscheme("sonokai")
    end
  },
  --[[ {
    "ntk148v/habamax.nvim",
    dependencies={ "rktjmp/lush.nvim" },
    config = function ()
      vim.cmd.colorscheme("habamax.nvim")
    end
  } ]]
}
