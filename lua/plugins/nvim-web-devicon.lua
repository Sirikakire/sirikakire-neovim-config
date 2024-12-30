return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  event = "VimEnter",
  config = function()
    require("nvim-web-devicons").setup({
      override_by_extension = require("utils").icons,
      color_icons = true,
      default = false,
      strict = true,
    })
  end,
}
