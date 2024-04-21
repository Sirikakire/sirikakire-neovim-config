return vim.b.colorscheme ~= "night-owl" and {} or {
  "oxfist/night-owl.nvim",
  priority = 100,
  config = function()
    vim.cmd.colorscheme("night-owl")
  end
}
