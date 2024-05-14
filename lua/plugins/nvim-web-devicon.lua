return {
  "nvim-tree/nvim-web-devicons",
  config = function ()
    local devicons = require("nvim-web-devicons")
    devicons.setup({
      -- NOTE: override the icon
      override_by_extension = require("utils").icons,
      color_icons = true,
      default = false,
      strict = true,
    })

    -- NOTE: I dont know why but this is needed
    devicons.set_icon(require("utils").icons)
  end
}
