-- Vim basic configuration options
local options = {
  "autoindent",
  "incsearch",
  "smartindent",
  "expandtab",
  "smarttab",
  "breakindent",
  "shiftwidth=2",
  -- "guicursor=n-ci:hor10-iCursor",
  "tabstop=2",
  "wrap",
  "autoread",
  "autowrite",
  "cursorline",
  "noshowcmd",
  --[[ "fillchars+=vert:\\▏",
  "fillchars+=horiz:\\▁", ]]
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
  -- "undofile",
  "pumheight=10",
  "noswapfile",
  "noshowmode",
  "nowritebackup",
  "noruler"
}
for i, option in pairs(options) do vim.cmd("set "..option) end
vim.opt.fillchars = { eob = ' ' }
vim.g.mapleader = " "
vim.keymap.set('n', '<C-j>', "a<CR><esc>")
vim.keymap.set('n', '<C-o>', '')
vim.keymap.set('n', '<C-z>', '')
vim.keymap.set('n', '<leader>nhl', ':nohlsearch<CR>')
vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')
vim.cmd('autocmd BufNewFile,BufRead *.jbuilder set ft=ruby')
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('highlight WinSeparator guibg=None')
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function ()
    vim.highlight.on_yank()
  end
})
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
