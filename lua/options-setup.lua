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
  "history=0",
  "confirm",
  "noshowcmd",
  "cmdheight=0",
  "backspace=start,eol,indent",
  "shiftround",
  "nobackup",
  "nowritebackup",
  "ignorecase",
  "signcolumn=yes:1",
  "linebreak",
  "number relativenumber",
  "clipboard+=unnamedplus",
  "shada=!,'20,<10,s10,h",
  "laststatus=3",
  "termguicolors",
  "scrolloff=5",
  "title",
  "smoothscroll",
  "pumheight=10",
  "noswapfile",
  "noshowmode",
  "noruler",
  "foldexpr=nvim_treesitter#foldexpr()",
  "foldmethod=expr",
  "nofoldenable",
  "fillchars+=eob:\\ ",
  "noundofile",
  "guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",
}

if(vim.b.win_separator) then
  options = vim.b.thick_win_separator
  and
    vim.list_extend(options, {
      "fillchars+=horiz:\\━",
      "fillchars+=horizup:\\┻",
      "fillchars+=horizdown:\\┳",
      "fillchars+=vert:\\┃",
      "fillchars+=vertleft:\\┫",
      "fillchars+=vertright:\\┣",
      "fillchars+=verthoriz:\\╋",
    })
  or
    vim.list_extend(options, {
    "fillchars+=horiz:\\─",
    "fillchars+=horizup:\\┴",
    "fillchars+=horizdown:\\┬",
    "fillchars+=vert:\\│",
    "fillchars+=vertleft:\\┤ ",
    "fillchars+=vertright:\\├",
    "fillchars+=verthoriz:\\┼",
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

options = vim.list_extend(options, {
  "linespace=" .. vim.b.line_space
})

for i, option in pairs(options) do
  vim.cmd("set "..option)
end
