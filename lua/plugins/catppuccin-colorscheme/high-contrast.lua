return {
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic", "bold" }, -- Change the style of comments
    conditionals = { "italic" },
    loops = {"italic", "bold"},
    functions = {"bold", "italic"},
    keywords = {"bold"},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {"bold"},
    types = {"bold"},
    operators = {"bold"},
  },
  custom_highlights = function(colors)
    return {
      WarningMsg = { style = { "italic", "bold" } },
      ErrorMsg = { style = { "italic", "bold" } },
      HintMsg = { style = { "italic", "bold" } },
      InfoMsg = { style = { "italic", "bold" } }
    }
  end,
  color_overrides = {
		mocha = {
			rosewater = "#efc9c2",
			flamingo = "#ebb2b2",
			pink = "#f2a7de",
			mauve = "#b889f4",
			red = "#ea7183",
			maroon = "#ea838c",
			peach = "#f39967",
			yellow = "#eaca89",
			green = "#96d382",
			teal = "#78cec1",
			sky = "#91d7e3",
			sapphire = "#68bae0",
			blue = "#739df2",
			lavender = "#a0a8f6",
			text = "#b5c1f1",
			subtext1 = "#a6b0d8",
			subtext0 = "#959ec2",
			overlay2 = "#848cad",
			overlay1 = "#717997",
			overlay0 = "#63677f",
			surface2 = "#505469",
			surface1 = "#3e4255",
			surface0 = "#2c2f40",
			base = "#1a1c2a",
			mantle = "#141620",
			crust = "#0e0f16",
		},
	},
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
