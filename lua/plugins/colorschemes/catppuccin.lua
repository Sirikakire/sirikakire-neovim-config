return vim.b.colorscheme ~= "catppuccin" and {} or {
  "catppuccin/nvim",
  priority = 100,
  config = function()
    require("catppuccin").setup(require("plugins.colorschemes.catppuccin-colorscheme.default"))
    vim.cmd.colorscheme "catppuccin-frappe"
  end
}
