return vim.b.colorscheme ~= "palenight" and {} or {
  "drewtempelmeyer/palenight.vim",
  priority = 100,
  config = function()
    vim.cmd.colorscheme("palenight")
  end
}

