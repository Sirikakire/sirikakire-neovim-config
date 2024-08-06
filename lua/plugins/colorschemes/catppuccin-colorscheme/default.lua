return {
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic", "bold" }, -- Change the style of comments
    conditionals = { "italic" },
    loops = {"italic"},
    functions = {"italic"},
    keywords = {"bold"},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {"bold"},
    operators = {},
  },
  custom_highlights = function(colors)
    return {
      WarningMsg = { style = { "italic", "bold" } },
      ErrorMsg = { style = { "italic", "bold" } },
      HintMsg = { style = { "italic", "bold" } },
      InfoMsg = { style = { "italic", "bold" } }
    }
  end,
  integrations = {
    cmp = true,
    treesitter = true,
    telescope = { enabled = true },
    notify = true,
    gitsigns = true,
    barbar = true,
    markdown = true,
    mason = true,
    noice = true,
    nvimtree = true,
    which_key = true,
    flash = true,
    dashboard = true,
    indent_blankline = {
      enabled = true,
      scope_color = "",
      colored_indent_levels = false,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic", "bold" },
        hints = { "italic", "bold" },
        warnings = { "italic", "bold" },
        information = { "italic", "bold" },
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
}
