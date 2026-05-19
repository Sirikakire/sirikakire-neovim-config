-- NOTE: Setup autocmd and highlight
vim.cmd('autocmd FileType ruby setlocal indentkeys-=.') -- NOTE:  Disable auto indent for ruby
-- vim.cmd('autocmd BufNewFile,BufRead,BufEnter *.jbuilder set ft=ruby') -- NOTE:  Set filetype for jbuilder as ruby filetype
vim.cmd('autocmd BufEnter * set formatoptions-=cro') -- NOTE:  Disable auto comment on new line

vim.filetype.add({
  extension = {
    jbuilder = "ruby", -- Set filetype for jbuilder as ruby filetype
  },
})
-- NOTE: Setup autocmd for better yank UI
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function ()
    vim.hl.on_yank({
      higroup = "IncSearch",
      timeout = 200
    })
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = require('nvim-treesitter').get_installed(),
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
  end,
})
