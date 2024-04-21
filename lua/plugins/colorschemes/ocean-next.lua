return vim.b.colorscheme ~= "oceanic-next" and {} or {
  "mhartington/oceanic-next",
  priority = 100,
  config = function()
    vim.cmd.colorscheme("OceanicNext")
  end
}

