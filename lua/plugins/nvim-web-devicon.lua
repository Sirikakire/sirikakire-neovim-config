return {
  "nvim-tree/nvim-web-devicons",
  event = "VimEnter",
  opts = {
    override_by_extension = require("utils").icons,
    color_icons = true,
    default = false,
    strict = true,
  }
}
