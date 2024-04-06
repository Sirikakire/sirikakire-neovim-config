-- Setup global leader keymap
vim.g.mapleader = " "

-- Setup autocmd and hightlight
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

-- Setup synchronized WinSeparator background
vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
  desc = 'Synchronized WinSeparator',
  callback = function()
    vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "WinSeparator" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "WinSeparator" })
  end,
})

vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
  desc = 'Set transparent background',
  callback = function()
    -- Optional transparent WinSeparator
    vim.cmd("highlight WinSeparator ctermbg=NONE guibg=NONE")
    vim.cmd("highlight GitSignsAdd ctermbg=NONE guibg=NONE")
    vim.cmd("highlight GitSignsChange ctermbg=NONE guibg=NONE")
    vim.cmd("highlight GitSignsDelete ctermbg=NONE guibg=NONE")
    vim.cmd("highlight GitSignsTopdelete ctermbg=NONE guibg=NONE")
    vim.cmd("highlight GitSignsUntracked ctermbg=NONE guibg=NONE")
    vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NormalFloat ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NormalNC ctermbg=NONE guibg=NONE")
    vim.cmd("highlight SignColumn ctermbg=NONE guibg=NONE")
    vim.cmd("highlight SignColumnSB ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NeoTree ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NeoTreeNormal ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NeoTreeNormalNC ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NeoTreeEndOfBuffer ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NeoTreeSignColumn ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NeoTreeTabInactive ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NvimTreeNormal ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NvimTreeNormalNC ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NvimTreeEndOfBuffer ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NvimTreeSignColumn ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopeNormal ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopePreviewNormal ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopePreviewTitle ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopePromptCounter ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopePromptNormal ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopePromptPrefix ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopePromptTitle ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopeResultsNormal ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopeResultsTitle ctermbg=NONE guibg=NONE")
  end,
})
