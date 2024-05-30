return vim.b.colorscheme ~= "sonokai" and {} or {
  "sainnhe/sonokai",
  priority = 100,
  config = function()
    -- `'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`, `'espresso'`
    vim.g.sonokai_style = "andromeda"
    vim.g.sonokai_enable_italic = 1
    vim.g.sonokai_diagnostic_text_highlight = 1
    vim.g.sonokai_diagnostic_line_highlight = 1
    vim.g.sonokai_diagnostic_virtual_text = 1
    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_float_style = "dim"
    vim.g.sonokai_dim_inactive_windows = 0
    vim.cmd.colorscheme("sonokai")
  end
}

