return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  event = "BufRead",
  opts = function()
    local palette = vim.opt.background._value == "light" and require("utils").light_palette or require("utils").dark_palette

    return {
      ---Whether to attach navic to language servers automatically.
      ---
      ---@type boolean
      attach_navic = true,

      ---Whether to create winbar updater autocmd.
      ---
      ---@type boolean
      create_autocmd = false,

      ---Buftypes to enable winbar in.
      ---
      ---@type string[]
      include_buftypes = { "" },

      ---Filetypes not to enable winbar in.
      ---
      ---@type string[]
      exclude_filetypes = {
        "toggleterm",
        "NvimTree",
        "copilot-chat"
      },

      modifiers = {
        ---Filename modifiers applied to dirname.
        ---
        ---See: `:help filename-modifiers`
        ---
        ---@type string
        dirname = ":~:.",

        ---Filename modifiers applied to basename.
        ---
        ---See: `:help filename-modifiers`
        ---
        ---@type string
        basename = "",
      },

      ---Whether to display path to file.
      ---
      ---@type boolean
      show_dirname = true,

      ---Whether to display file name.
      ---
      ---@type boolean
      show_basename = true,

      ---Whether to replace file icon with the modified symbol when buffer is
      ---modified.
      ---
      ---@type boolean
      show_modified = true,

      ---Get modified status of file.
      ---
      ---NOTE: This can be used to get file modified status from SCM (e.g. git)
      ---
      ---@type fun(bufnr: number): boolean
      modified = function(bufnr) return vim.bo[bufnr].modified end,

      ---Whether to show/use navic in the winbar.
      ---
      ---@type boolean
      show_navic = true,

      ---Get leading custom section contents.
      ---
      ---NOTE: This function shouldn't do any expensive actions as it is run on each
      ---render.
      ---
      ---@type fun(bufnr: number, winnr: number): barbecue.Config.custom_section
      lead_custom_section = function() return " " end,

      ---@alias barbecue.Config.custom_section
      ---|string # Literal string.
      ---|{ [1]: string, [2]: string? }[] # List-like table of `[text, highlight?]` tuples in which `highlight` is optional.
      ---
      ---Get custom section contents.
      ---
      ---NOTE: This function shouldn't do any expensive actions as it is run on each
      ---render.
      ---
      ---@type fun(bufnr: number, winnr: number): barbecue.Config.custom_section
      custom_section = function() return " " end,

      ---@alias barbecue.Config.theme
      ---|'"auto"' # Use your current colorscheme's theme or generate a theme based on it.
      ---|string # Theme located under `barbecue.theme` module.
      ---|barbecue.Theme # Same as '"auto"' but override it with the given table.
      ---
      ---Theme to be used for generating highlight groups dynamically.
      ---
      ---@type barbecue.Config.theme
      theme = {
        normal = { fg = palette.text },
        ellipsis = { fg = palette.overlay1 },
        separator = { fg = palette.overlay1 },
        modified = { fg = palette.peach },
        dirname = { fg = palette.overlay1 },
        basename = { fg = palette.text},
        context = { fg = palette.overlay1 },
        context_file = { fg = palette.blue },
        context_module = { fg = palette.blue },
        context_namespace = { fg = palette.blue },
        context_package = { fg = palette.blue },
        context_class = { fg = palette.yellow },
        context_method = { fg = palette.blue },
        context_property = { fg = palette.green },
        context_field = { fg = palette.green },
        context_constructor = { fg = palette.blue },
        context_enum = { fg = palette.green },
        context_interface = { fg = palette.yellow },
        context_function = { fg = palette.blue },
        context_variable = { fg = palette.flamingo },
        context_constant = { fg = palette.peach },
        context_string = { fg = palette.green },
        context_number = { fg = palette.peach },
        context_boolean = { fg = palette.peach },
        context_array = { fg = palette.blue },
        context_object = { fg = palette.blue },
        context_key = { fg = palette.flamingo },
        context_enum_member = { fg = palette.red },
        context_struct = { fg = palette.blue },
        context_event = { fg = palette.blue },
        context_operator = { fg = palette.blue },
        context_type_parameter = { fg = palette.blue },
      },

      ---Whether context text should follow its icon's color.
      ---
      ---@type boolean
      context_follow_icon_color = false,

      symbols = {
        ---Modification indicator.
        ---
        ---@type string
        modified = "●",

        ---Truncation indicator.
        ---
        ---@type string
        ellipsis = "…",

        ---Entry separator.
        ---
        ---@type string
        -- separator = "",
        separator = ">"
      },

      ---@alias barbecue.Config.kinds
      ---|false # Disable kind icons.
      ---|table<string, string> # Type to icon mapping.
      ---
      ---Icons for different context entry kinds.
      ---
      ---@type barbecue.Config.kinds
      kinds = require("utils").nv_chad_icons
    }
  end,
  config = function ()
    vim.opt.updatetime = 200

    vim.api.nvim_create_autocmd({
      "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
      "BufWinEnter",
      "CursorHold",
      "InsertLeave",

      -- include this if you have set `show_modified` to `true`
      "BufModifiedSet",
    }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
  end
}
