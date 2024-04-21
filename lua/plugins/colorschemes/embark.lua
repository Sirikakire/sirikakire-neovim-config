return vim.b.colorscheme ~= "embark" and {} or {
  'embark-theme/vim',
  priority = 100,
  config = function()
    vim.cmd.colorscheme("embark")
  end
}

