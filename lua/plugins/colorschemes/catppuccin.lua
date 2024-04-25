return vim.b.colorscheme ~= "catppuccin" and {} or {
  "catppuccin/nvim",
  priority = 100,
  config = function()
    require("catppuccin").setup(require("plugins.colorschemes.catppuccin-colorscheme.thanhvule"))
    vim.cmd.colorscheme "catppuccin-mocha"
  end
}

