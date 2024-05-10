return {
  "DaikyXendo/nvim-web-devicons",
  -- "nvim-tree/nvim-web-devicons",
  event = "VimEnter",
  config = function ()
    require("nvim-web-devicons").setup({
      -- NOTE: override the icon
      override = require("utils").icons,
      color_icons = true;
    })
  end
}
