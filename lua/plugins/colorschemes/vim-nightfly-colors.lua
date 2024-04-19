return vim.b.colorscheme ~= "nightfly" and {} or {
  "bluz71/vim-nightfly-colors",
  name = "nightfly",
  config = function()
    vim.g.nightflyVirtualTextColor = true
    vim.g.nightglyItalic = true
    vim.cmd.colorscheme "nightfly"
  end
}

