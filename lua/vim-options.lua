-- Vim basic configuration options
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
  "completeopt=menuone,noinsert,noselect",
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
  "undofile",
}
for i, option in pairs(options) do vim.cmd("set "..option) end
vim.opt.fillchars = { eob = ' ' }
vim.g.mapleader = " "
vim.keymap.set('n', '<C-j>', "a<CR><esc>")
vim.keymap.set('n', '<C-o>', '')
vim.keymap.set('n', '<C-z>', '')
vim.keymap.set('n', '<leader>nhl', ':nohlsearch<CR>')
vim.keymap.set('n', '<C-a>', 'gg<S-V><S-G>')
vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')
vim.cmd('autocmd BufNewFile,BufRead *.jbuilder set ft=ruby')
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('highlight WinSeparator guibg=None')
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function ()
    vim.highlight.on_yank()
  end
})
