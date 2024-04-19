return vim.b.colorscheme ~= "embark" and {} or {
  'embark-theme/vim',
  config = function()
    vim.cmd.colorscheme("embark")
  end
}

