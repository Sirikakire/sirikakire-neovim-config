return {
  "nvim-tree/nvim-web-devicons",
  event = "VimEnter",
  config = function ()
    local devicons = require("nvim-web-devicons")
    devicons.setup({
      -- NOTE: override the icon
      -- override = require("utils").icons,
      override_by_extension = require("utils").icons,
      color_icons = true,
      default = false,
      strict = true,
    })
    devicons.set_icon(require("utils").icons)
  end
}
