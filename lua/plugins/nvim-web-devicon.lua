return {
  "nvim-tree/nvim-web-devicons",
  pin = "nerd-v2-compat",
  priority = 10000,
  event = "VeryLazy",
  opts = {
    override_by_extension = require("utils").icons,
    color_icons = true,
    default = false,
    strict = true,
  },
  config = function(_, opts)
    require("nvim-web-devicons").set_icon(require("utils").icons)
    require("nvim-web-devicons").setup(opts)
    require("nvim-web-devicons").set_icon(require("utils").icons)
  end
}
