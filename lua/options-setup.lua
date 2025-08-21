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
  "nospell",
  "nowritebackup",
  "ignorecase",
  "notagstack",
  "signcolumn=yes:1",
  "nolinebreak",
  -- Set the session options to save and restore
  -- 'buffers'  : save and restore buffers
  -- 'tabpages' : save and restore tab pages
  -- 'winsize'  : save and restore window sizes
  -- 'winpos'   : save and restore window positions
  -- 'terminal' : save and restore terminal buffers
  -- 'localoptions' : save and restore local options
  "sessionoptions=buffers,tabpages,winsize,winpos,localoptions",
  -- .  - current buffer
  -- w  - buffers in windows
  -- b  - other loaded buffers
  -- u  - unloaded buffers
  -- t  - tags
  -- i  - included files
  -- k  - dictionary
  "complete=",
  -- Set the jump options
  -- 'jumpoptions' controls how Neovim handles the jump list (CTRL-O and CTRL-I navigation)
  -- Available options:
  --   'stack': Makes each window maintain its own separate jump list history
  --   'view': Saves the view (viewport position, folds, etc.) when adding a jump
  --   'clear': Removes jumps that do not resolve to valid buffer positions
  --   Multiple options can be combined like: "stack,view,clear"
  "jumpoptions=clean",
-- Control whether Neovim adds a newline at end of file
-- When false, Neovim will not automatically add a newline at EOF
-- Useful for maintaining exact file contents without modifications
-- Some file formats or systems don't require trailing newlines
  "nofixendofline",
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
  "syntax=off",
  "updatetime=4000", -- Tăng updatetime để giảm tần suất xử lý sự kiện
  "nohlsearch", -- Tắt highlight kết quả tìm kiếm
  "re=1" -- Sử dụng regex engine cũ nhưng nhanh hơn
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

if (vim.g.neovide) and (vim.b.line_space) then
  options = vim.list_extend(options, {
    "linespace=" .. vim.b.line_space
  })
end

for i, option in pairs(options) do
  vim.cmd("set "..option)
end
