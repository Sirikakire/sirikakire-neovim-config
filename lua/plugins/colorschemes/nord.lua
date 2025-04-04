return vim.b.colorscheme ~= "nord" and {} or {
  "shaunsingh/nord.nvim",
  priority = 100,
  config = function ()
    vim.g.nord_contrast = false
    vim.g.nord_borders = false
    vim.g.nord_disable_background = false
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = false
    vim.g.nord_bold = true

    vim.cmd.colorscheme("nord")
  end
}
