return vim.b.colorscheme ~= "night-owl" and {} or {
  "oxfist/night-owl.nvim",
  config = function()
    vim.cmd.colorscheme("night-owl")
  end
}
