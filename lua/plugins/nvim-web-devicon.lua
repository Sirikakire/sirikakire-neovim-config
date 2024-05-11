return {
  "nvim-tree/nvim-web-devicons",
  priority = 1000,
  config = function ()
    require("nvim-web-devicons").setup({
      -- NOTE: override the icon
      override_by_extension = require("utils").icons,
      color_icons = true,
      strict = true,
    })
  end
}
