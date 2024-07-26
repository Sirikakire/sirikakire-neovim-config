return vim.b.colorscheme ~= "edge" and {} or {
  "sainnhe/edge",
  priority = 100,
  config = function ()
    vim.g.edge_better_performance = 1
    vim.g.edge_enable_italic = 1
    vim.g.edge_transparent_background = 0
    -- vim.g.edge_dim_inactive_windows = 0
    vim.g.edge_diagnostic_text_highlight = 1
    vim.g.edge_diagnostic_line_highlight = 1
    vim.g.edge_diagnostic_virtual_text = "highlighted"
    vim.cmd.colorscheme('edge')
  end
}
