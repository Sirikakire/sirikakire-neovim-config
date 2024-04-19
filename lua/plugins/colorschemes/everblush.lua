return vim.b.colorscheme ~= "everblush" and {} or {
  "Everblush/nvim",
  config = function ()
   vim.cmd.colorscheme("everblush")
  end
}
