return vim.b.colorscheme ~= "oceanic-next" and {} or {
  "mhartington/oceanic-next",
  config = function()
    vim.cmd.colorscheme("OceanicNext")
  end
}

