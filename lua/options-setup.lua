local options = {
  "autoindent",
  "incsearch",
  "smartindent",
  "expandtab",
  "smarttab",
  "breakindent",
  "completeopt=menu,menuone,noinsert", -- Đơn giản hóa completeopt
  "shiftwidth=2",
  "tabstop=2",
  "nowrap",
  "autoread",
  "autowrite",
  "nocursorline", -- Tắt cursorline để tăng hiệu suất
  "history=0",
  "confirm",
  "noshowcmd",
  "cmdheight=0",
  "backspace=start,eol,indent",
  "shiftround",
  "nobackup",
  "nowritebackup",
  "ignorecase",
  "notagstack",
  "signcolumn=yes:1",
  "nolinebreak",
  "number relativenumber", -- Bỏ relativenumber để tăng hiệu suất
  "clipboard+=unnamedplus",
  "shada=!,'20,<10,s10,h",
  "laststatus=3",
  "termguicolors",
  "scrolloff=3", -- Giảm scrolloff để tối ưu hiệu suất cuộn
  "title",
  "nosmoothscroll", -- Tắt smoothscroll
  "pumheight=8", -- Giảm kích thước popup menu
  "noswapfile",
  "noshowmode",
  "noruler",
  "foldexpr=nvim_treesitter#foldexpr()",
  "foldmethod=expr", -- Sử dụng manual folding thay vì treesitter để tăng hiệu suất
  "nofoldenable",
  "fillchars+=eob:\\ ",
  "noundofile",
  "lazyredraw", -- Thêm lazyredraw để giảm việc vẽ lại màn hình không cần thiết
  "nottimeout", -- Tắt timeout để tránh độ trễ khi nhấn phím
  "synmaxcol=200", -- Giới hạn syntax highlighting tới cột thứ 200
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

if (vim.g.neovide) then
  options = vim.list_extend(options, {
    "linespace=" .. vim.b.line_space
  })
end

for i, option in pairs(options) do
  vim.cmd("set "..option)
end
