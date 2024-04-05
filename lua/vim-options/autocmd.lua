-- Setup global leader keymap
vim.g.mapleader = " "

-- Setup autocmd and hightlight
vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')
vim.cmd('autocmd BufNewFile,BufRead *.jbuilder set ft=ruby')
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
-- vim.cmd('highlight WinSeparator guibg=None')

-- Setup autocmd for better yank UI
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function ()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200
    })
  end
})

-- Setup autocmd auto update git branch name to vim.b.branch_name
vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'FocusGained' }, {
  desc = 'git branch',
  callback = function()
    if vim.fn.isdirectory '.git' ~= 0 then
      local branch = vim.fn.system "git branch --show-current | tr -d '\n'"
      vim.b.branch_name = branch
    end
  end,
})

