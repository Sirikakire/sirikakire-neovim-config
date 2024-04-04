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
  "foldexpr=nvim_treesitter#foldexpr()",
  "foldmethod=expr",
  "nofoldenable",
  -- "undofile",
}
for i, option in pairs(options) do vim.cmd("set "..option) end
vim.opt.fillchars = { eob = ' ' }
vim.g.mapleader = " "
vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')
vim.cmd('autocmd BufNewFile,BufRead *.jbuilder set ft=ruby')
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('highlight WinSeparator guibg=None')
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function ()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200
    })
  end
})
vim.fn.sign_define(
  {
    { name = "DiagnosticSignError", text = "", texthl = "DiagnosticSignError", linehl = "ErrorLine" },
    { name = "DiagnosticSignWarn", text = "", texthl = "DiagnosticSignWarn", linehl = "WarningLine" },
    { name = "DiagnosticSignInfo", text = "", texthl = "DiagnosticSignInfo", linehl = "InfoLine" },
    { name = "DiagnosticSignHint", text = "", texthl = "DiagnosticSignHint", linehl = "HintLine" },
  }
)
vim.cmd("set fillchars+=vert:\\▏")
vim.cmd("set fillchars+=horiz:\\▁")

vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'FocusGained' }, {
  desc = 'git branch',
  callback = function()
    if vim.fn.isdirectory '.git' ~= 0 then
      local branch = vim.fn.system "git branch --show-current | tr -d '\n'"
      vim.b.branch_name = branch
    end
  end,
})
