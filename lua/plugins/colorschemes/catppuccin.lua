return vim.b.colorscheme ~= "catppuccin" and {} or {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup(require("plugins.colorschemes.catppuccin-colorscheme.high-contrast"))
    vim.cmd.colorscheme "catppuccin-mocha"
  end
}

