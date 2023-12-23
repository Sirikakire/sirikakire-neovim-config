local options = {
  "set autoindent",
  "set smartindent",
  "set expandtab",
  "set shiftwidth=2",
  "set tabstop=2",
  "set wrap",
  "set autoread",
  "set autowrite",
  "set cursorline",
  "set showcmd",
  "set laststatus=2",
  "set shiftround",
  "set signcolumn=yes",
  "set linebreak",
  "set number relativenumber",
  "set clipboard+=unnamedplus"
}
for i, option in pairs(options) do vim.cmd(option) end

vim.keymap.set('n', ':', ':FineCmdline<CR>')
vim.g.mapleader = " "
vim.keymap.set('n', '<C-o>', '')
vim.keymap.set('n', '<leader>nhl', ':nohlsearch<CR>')
vim.opt.termguicolors = true
