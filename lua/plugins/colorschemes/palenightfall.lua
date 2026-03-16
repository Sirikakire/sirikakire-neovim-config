return vim.b.colorscheme ~= "palenightfall" and {} or {
  "JoosepAlviste/palenightfall.nvim",
  priority = 100,
  config = function()
    require('palenightfall').setup()
    vim.cmd.colorscheme("palenightfall")
  end
}
