return {
  "nvim-tree/nvim-web-devicons",
  opts = function ()
    -- NOTE: I dont know why but this is needed
    -- require("nvim-web-devicons").set_icon(require("utils").icons)

    return {
      -- NOTE: override the icon
      override_by_extension = require("utils").icons,
      color_icons = true,
      default = false,
      strict = true,
    }
  end
}
