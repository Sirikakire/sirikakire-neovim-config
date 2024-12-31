return {
  "nvim-tree/nvim-web-devicons",
  event = "VimEnter",
  config = function()
    require("nvim-web-devicons").setup({
      -- override_by_extension = require("utils").icons,
      override = require("utils").icons,
      color_icons = true,
      default = false,
      strict = false,
    })
  end,
}
