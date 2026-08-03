return vim.b.colorscheme ~= "catppuccin" and {} or {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup(require("plugins.colorschemes.catppuccin-colorscheme.default"))
    vim.cmd.colorscheme("catppuccin-macchiato")
  end
}
