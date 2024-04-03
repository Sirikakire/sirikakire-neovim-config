return {
  {
    "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
    config = function ()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ea9ba1" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#ecd09d" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#90c7f4" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#e1bc9a" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#b7d5a2" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#deb2ec" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#93d0d8" })
      end)

      require("ibl").setup {
        exclude = {
          filetypes = { "dashboard" }
        },
        scope = { enabled = false },
        indent = {
          -- highlight = highlight,
          char = "▏",
        } 
      }
    end
  },
  -- {
  --   "echasnovski/mini.indentscope",
  --   opts = {
  --     -- Draw options
  --     draw = {
  --       -- Delay (in ms) between event and start of drawing scope indicator
  --       delay = 50,
  --
  --       -- Animation rule for scope's first drawing. A function which, given
  --       -- next and total step numbers, returns wait time (in ms). See
  --       -- |MiniIndentscope.gen_animation| for builtin options. To disable
  --       -- animation, use `require('mini.indentscope').gen_animation.none()`.
  --       animation = function(s, n) return 15 end,
  --       -- Symbol priority. Increase to display on top of more symbols.
  --       priority = 2,
  --     },
  --
  --     -- Module mappings. Use `''` (empty string) to disable one.
  --     mappings = {
  --       -- Textobjects
  --       object_scope = 'ii',
  --       object_scope_with_border = 'ai',
  --
  --       -- Motions (jump to respective border line; if not present - body line)
  --       goto_top = '[i',
  --       goto_bottom = ']i',
  --     },
  --
  --     -- Options which control scope computation
  --     options = {
  --       -- Type of scope's border: which line(s) with smaller indent to
  --       -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
  --       border = 'both',
  --
  --       -- Whether to use cursor column when computing reference indent.
  --       -- Useful to see incremental scopes with horizontal cursor movements.
  --       indent_at_cursor = true,
  --
  --       -- Whether to first check input line to be a border of adjacent scope.
  --       -- Use it if you want to place cursor on function header to get scope of
  --       -- its body.
  --       try_as_border = false,
  --     },
  --
  --     -- Which character to use for drawing scope indicator
  --     symbol = '╎',
  --     -- symbol = "▎"
  --   },
  --   init = function()
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = {
  --         "help",
  --         "alpha",
  --         "dashboard",
  --         "neo-tree",
  --         "lazy",
  --         "mason",
  --         "notify",
  --         "toggleterm",
  --         "lazyterm",
  --       },
  --       callback = function()
  --         vim.b.miniindentscope_disable = true
  --       end,
  --     })
  --     vim.api.nvim_create_autocmd("BufRead", {
  --       pattern = {
  --         "terminal"
  --       },
  --       callback = function()
  --         vim.b.miniindentscope_disable = true
  --       end,
  --     })
  --
  --   end,
  -- }
}
