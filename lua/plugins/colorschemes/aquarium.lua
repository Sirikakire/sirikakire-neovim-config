return vim.b.colorscheme ~= "aquarium" and {} or {
  "FrenzyExists/aquarium-vim",
  config = function()
    vim.g.aqua_bold = 1
    vim.g.aquarium_style = "dark"
    vim.cmd.colorscheme("aquarium")
  end
}
