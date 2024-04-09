-- Setup global leader keymap
vim.g.mapleader = " "

-- Setup autocmd and highlight
vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')
vim.cmd('autocmd BufNewFile,BufRead *.jbuilder set ft=ruby')
vim.cmd('autocmd BufEnter * set formatoptions-=cro')

-- Setup autocmd for better yank UI
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function ()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200
    })
  end
})
