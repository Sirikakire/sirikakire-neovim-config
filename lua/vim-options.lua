-- Vim basic configuration options
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
  "set clipboard+=unnamedplus",
  "set laststatus=3"
}
for i, option in pairs(options) do vim.cmd(option) end
vim.keymap.set('n', ':', ':FineCmdline<CR>')
vim.g.mapleader = " "
vim.keymap.set('n', '<C-o>', '')
vim.keymap.set('n', '<leader>nhl', ':nohlsearch<CR>')
vim.keymap.set('n', '<C-z>', '')
vim.opt.termguicolors = true

-- Vim terminal configuration keymap
local function navigateToTerminal()
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
vim.keymap.set('n', '<leader>t', function() navigateToTerminal() end)
