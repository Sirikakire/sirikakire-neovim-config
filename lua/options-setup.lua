local options = {
  "autoindent",
  "incsearch",
  "smartindent",
  "expandtab",
  "smarttab",
  "breakindent",
  "shiftwidth=2",
  "tabstop=2",
  "wrap",
  "autoread",
  "autowrite",
  "cursorline",
  "noshowcmd",
  "cmdheight=0",
  "backspace=start,eol,indent",
  "shiftround",
  "nobackup",
  "ignorecase",
  "signcolumn=yes",
  "linebreak",
  "number relativenumber",
  "clipboard+=unnamedplus",
  "laststatus=3",
  "termguicolors",
  "scrolloff=5",
  "title",
  "pumheight=10",
  "noswapfile",
  "noshowmode",
  "nowritebackup",
  "noruler",
  "foldexpr=nvim_treesitter#foldexpr()",
  "foldmethod=expr",
  "nofoldenable",
  "fillchars+=eob:\\ "
  -- "undofile",
}

if(vim.b.win_separator) then
  -- options = vim.list_extend(options, {
  --  "fillchars+=horiz:\\─",
  --  "fillchars+=horizup:\\┴",
  --  "fillchars+=horizdown:\\┬",
  --  "fillchars+=vert:\\│",
  --  "fillchars+=vertleft:\\┤ ",
  --  "fillchars+=vertright:\\├",
  --  "fillchars+=verthoriz:\\┼",
  -- })

  options = vim.list_extend(options, {
    "fillchars+=horiz:\\━",
    "fillchars+=horizup:\\┻",
    "fillchars+=horizdown:\\┳",
    "fillchars+=vert:\\┃",
    "fillchars+=vertleft:\\┫",
    "fillchars+=vertright:\\┣",
    "fillchars+=verthoriz:\\╋",
  })
else
  options = vim.list_extend(options, {
    "fillchars+=horiz:\\ ",
    "fillchars+=horizup:\\ ",
    "fillchars+=horizdown:\\ ",
    "fillchars+=vert:\\ ",
    "fillchars+=vertleft:\\ ",
    "fillchars+=vertright:\\ ",
    "fillchars+=verthoriz:\\ ",
  })
end

for i, option in pairs(options) do
  vim.cmd("set "..option)
end
