return vim.b.colorscheme ~= "palenight" and {} or {
  "drewtempelmeyer/palenight.vim",
  config = function()
    vim.cmd.colorscheme("palenight")
  end
}

