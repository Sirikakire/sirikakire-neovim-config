-- Vim basic configuration options
local options = {
  "set autoindent",
  "set smartindent",
  "set expandtab",
  "set smarttab",
  "set breakindent",
  "set shiftwidth=2",
  "set tabstop=2",
  "set wrap",
  "set mouse=a",
  "set autoread",
  "set autowrite",
  "set cursorline",
  "set showcmd",
  "set cmdheight=0",
  "set completeopt=menuone,noinsert,noselect",
  "set backspace=start,eol,indent",
  "set shiftround",
  "set nobackup",
  "set ignorecase",
  "set signcolumn=yes",
  "set linebreak",
  "set number relativenumber",
  "set clipboard+=unnamedplus",
  "set laststatus=3",
  "set termguicolors",
  "set scrolloff=5",
  -- "set title"
}
vim.opt.fillchars = { eob = ' ' }
for i, option in pairs(options) do vim.cmd(option) end
vim.g.mapleader = " "
vim.keymap.set('n', '<C-j>', "a<CR><esc>")
vim.keymap.set('n', '<C-o>', '')
vim.keymap.set('n', '<C-z>', '')
vim.keymap.set('n', '<leader>nhl', ':nohlsearch<CR>')
vim.keymap.set('n', '<C-j>', "a<CR><esc>")
vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')
vim.cmd('autocmd BufNewFile,BufRead *.jbuilder set ft=ruby')
vim.cmd('highlight WinSeparator guibg=None')
-- vim.cmd('au TermOpen * au <buffer> WinEnter redraw!')
-- vim.cmd('autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE')
-- Vim terminal configuration keymap
--[[ local function navigateToTerminal()
  local currentBufNr = vim.api.nvim_get_current_buf()
  local termBufNr = nil

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then
      termBufNr = buf
      break
    end
  end
  if termBufNr and currentBufNr == termBufNr then
    vim.api.nvim_command('BufferClose!')
  elseif termBufNr then
    vim.api.nvim_command('buffer ' .. termBufNr)
  else
    vim.api.nvim_command("term")
  end
end
vim.keymap.set('n', '<leader>t', function() navigateToTerminal() end) ]]
