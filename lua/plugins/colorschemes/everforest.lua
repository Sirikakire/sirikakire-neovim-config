return vim.b.colorscheme ~= "everforest" and {} or {
  "sainnhe/everforest",
  priority = 100,
  config = function ()
    vim.g.everforest_background = 'hard'
    vim.g.everforest_better_performance = 1
    vim.g.everforest_enable_italic = 1
    vim.g.everforest_transparent_background = 0
    -- vim.g.everforest_dim_inactive_windows = 0
    vim.g.everforest_diagnostic_text_highlight = 1
    vim.g.everforest_diagnostic_line_highlight = 1
    vim.g.everforest_diagnostic_virtual_text = "highlighted"
    vim.cmd.colorscheme("everforest")
  end
}

