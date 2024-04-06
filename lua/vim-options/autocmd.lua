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

-- Setup WinSeparator background
vim.api.nvim_create_autocmd({ 'ColorScheme'}, {
  desc = 'Remove WinSeparator',
  callback = function()
    vim.cmd("highlight WinSeparator ctermbg=NONE guibg=NONE")
  end,
})
-- Setup transparent background
vim.api.nvim_create_autocmd({ 'ColorScheme'}, {
  desc = 'Set transparent background',
  callback = function()
    -- vim.cmd("highlight BufferInactive ctermbg=NONE guibg=NONE")
    -- vim.cmd("highlight BufferInactiveIndex ctermbg=NONE guibg=NONE")
    -- vim.cmd("highlight BufferInactiveMod ctermbg=NONE guibg=NONE")
    -- vim.cmd("highlight BufferInactiveSign ctermbg=NONE guibg=NONE")
    -- vim.cmd("highlight BufferInactiveTarget ctermbg=NONE guibg=NONE")
    -- vim.cmd("highlight VertSplit ctermbg=NONE guibg=NONE")
    -- vim.cmd("highlight DiagnosticShowNormal ctermbg=NONE guibg=NONE")
    -- vim.cmd("highlight DiagnosticNormal ctermbg=NONE guibg=NONE")
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
    vim.cmd("highlight NeoTreeWinSeparator ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NeoTreeTabInactive ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NvimTreeNormal ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NvimTreeNormalNC ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NvimTreeEndOfBuffer ctermbg=NONE guibg=NONE")
    vim.cmd("highlight NvimTreeSignColumn ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopeNormal ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopePreviewBorder ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopePreviewNormal ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopePreviewTitle ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopePromptBorder ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopePromptCounter ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopePromptNormal ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopePromptPrefix ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopePromptTitle ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopeResultsBorder ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopeResultsNormal ctermbg=NONE guibg=NONE")
    vim.cmd("highlight TelescopeResultsTitle ctermbg=NONE guibg=NONE")
  end,
})
