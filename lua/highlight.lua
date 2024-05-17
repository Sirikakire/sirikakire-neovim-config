local init = require("init")

-- NOTE: Setup highlight
local setup_highlight = function()
  -- highlight! link NvimTreeFolderIcon guifg=#e7c173
  --[[
     NOTE: 
    - Remove diagnostic sign background
    - Sign icons highlight
    - Neotree folder color
    - Get rid of dim background
    - Remove cmp item background
    - sync neotree and nvim tree separator
  ]]
  vim.cmd([[
    highlight! GitGutterAdd ctermbg=NONE guibg=NONE
    highlight! GitGutterDelete ctermbg=NONE guibg=NONE
    highlight! GitGutterChange ctermbg=NONE guibg=NONE
    highlight! link DiffAdd GitSignsAdd
    highlight! link DiffDelete GitSignsDelete
    highlight! link DiffChange GitSignsChange
    highlight! link NvimTreeGitNew GitSignsAdd
    highlight! link NvimTreeGitDeleted GitSignsDelete
    highlight! link NvimTreeGitDirty GitSignsChange
    highlight! link NvimTreeGitStaged GitSignsAdd
    highlight! link NeoTreeGitNew GitSignsAdd
    highlight! link NeoTreeGitUntracked GitSignsAdd
    highlight! link NeoTreeGitModified GitSignsChange

    highlight! link NvimTreeFolderIcon NvimTreeFolderName

    highlight! link WinBar Normal
    highlight! link WinBarNC NormalNC
    highlight! link StatusLine lualine_c_normal
    highlight! link StatusLineNC lualine_c_normal
    highlight! link NeoTreeNormal Normal
    highlight! link NeoTreeNormalNC NormalNC
    highlight! link NvimTreeNormal Normal
    highlight! link NvimTreeNormalNC NormalNC
    highlight! link NeoTreeExpander NeoTreeDirectoryIcon

    highlight! CmpItemAbbr ctermbg=NONE guibg=NONE
    highlight! CmpItemKind ctermbg=NONE guibg=NONE
    highlight! CmpItemMenu ctermbg=NONE guibg=NONE

    highlight! link NeoTreeWinSeparator WinSeparator
    highlight! link NvimTreeWinSeparator WinSeparator
  ]])

  -- NOTE: sync color line 
  local cursorLineBackground = init.getHexColor("CursorLine").background
  vim.cmd("highlight! IblScope guibg=NONE ctermbg=NONE guifg="..cursorLineBackground)
  vim.cmd("highlight! IblIndent guibg=NONE ctermbg=NONE guifg="..cursorLineBackground)
  vim.cmd("highlight! WinSeparator guibg=NONE ctermbg=NONE guifg="..cursorLineBackground)

  -- NOTE: Remove FloatBorder bg but keep the fg and ctermbg
  vim.cmd("highlight! FloatBorder ctermbg=NONE guibg=NONE")
end

local setup_terminal_highlight = function()
  local terminal_colors = {
    "#737994", "#e78284", "#a6d189", "#e5c890",
    "#8caaee", "#f4b8e4", "#99d1db", "#c6d0f5",
    "#838ba7", "#e78284", "#a6d189", "#e5c890",
    "#8caaee", "#f4b8e4", "#99d1db", "#c6d0f5",
  }
  for i, color in ipairs(terminal_colors) do
    vim.g["terminal_color_" .. i-1] = color
  end
end

-- NOTE: Setup better cmp cursor line
local setup_better_cmp_cursor_line = function()
  local cmpColorAfter = {}

  if vim.b.transparent_background then
    cmpColorAfter = {
      background = vim.b.border_color,
      foreground = init.complementaryColor(vim.b.border_color)
    }
  else
    local cmpColor = init.getHexColor("NormalFloat")
    cmpColorAfter = {
      background = init.complementaryColor(cmpColor.background),
      foreground = cmpColor.foreground == "NONE" and cmpColor.background or init.complementaryColor(cmpColor.foreground),
    }
  end
  vim.cmd("highlight! PmenuSel guibg="..cmpColorAfter.background.." guifg="..cmpColorAfter.foreground)
end

-- NOTE: Hide WinSepartor linking with Normal
local hide_win_separator = function()
  vim.cmd("highlight! link WinSeparator Normal")
end


-- NOTE: sync Neotree/NvimTree with normal
local setup_syn_sidebar_with_normal = function()
  vim.cmd([[
    highlight! link NeoTreeNormal Normal
    highlight! link NvimTreeNormal Normal
  ]])
end

-- NOTE: Setup add brightness to float window
local setup_add_brightness_to_float_window = function()
  local normalFloatBackground = init.getHexColor("NormalFloat").background
  if normalFloatBackground == "NONE" then return end
  local normalFloatBackgroundAfterAddBrightness = init.addBrightnessToHexColor(normalFloatBackground, vim.b.float_window_brightness)
  vim.cmd("highlight! NormalFloat guibg="..normalFloatBackgroundAfterAddBrightness)
end

-- NOTE: Setup synchronized Telescope border
local setup_synchronized_telescope = function ()
  vim.cmd([[
    highlight! link TelescopePreviewTitle TelescopePreviewBorder
    highlight! link TelescopePromptTitle TelescopePromptBorder
    highlight! link TelescopeResultsTitle TelescopeResultsBorder
    highlight! link TelescopePreviewBorder TelescopeBorder
    highlight! link TelescopePromptBorder TelescopeBorder
    highlight! link TelescopeResultsBorder TelescopeBorder
    highlight! link TelescopeBorder WinSeparator
  ]])
end

-- NOTE: Setup synchronized WinSeparator background
local setup_synchronized_border_color = function()
  vim.cmd("highlight! WinSeparator ctermbg=NONE guibg=NONE guifg="..vim.b.border_color)
end

-- NOTE: Optional transparent 
local setup_transparent_background = function()
  vim.cmd([[
    highlight! GitGutterDelete ctermbg=NONE guibg=NONE
    highlight! GitGutterChangeDelete ctermbg=NONE guibg=NONE
    highlight! GitGutterChange ctermbg=NONE guibg=NONE
    highlight! GitGutterAdd ctermbg=NONE guibg=NONE
    highlight! GitSignsAdd ctermbg=NONE guibg=NONE
    highlight! GitSignsChange ctermbg=NONE guibg=NONE
    highlight! GitSignsDelete ctermbg=NONE guibg=NONE
    highlight! GitSignsTopdelete ctermbg=NONE guibg=NONE
    highlight! GitSignsUntracked ctermbg=NONE guibg=NONE
    highlight! Normal ctermbg=NONE guibg=NONE
    highlight! NormalFloat ctermbg=NONE guibg=NONE
    highlight! NormalNC ctermbg=NONE guibg=NONE
    highlight! LineNr ctermbg=NONE guibg=NONE guifg=NONE
    highlight! CursorLineNr ctermbg=NONE guibg=NONE guifg=NONE
    highlight! SignColumn ctermbg=NONE guibg=NONE guifg=NONE
    highlight! SignColumnSB ctermbg=NONE guibg=NONE guifg=NONE
    highlight! NeoTree ctermbg=NONE guibg=NONE
    highlight! NeoTreeNormal ctermbg=NONE guibg=NONE
    highlight! NeoTreeNormalNC ctermbg=NONE guibg=NONE
    highlight! NeoTreeEndOfBuffer ctermbg=NONE guibg=NONE
    highlight! NeoTreeSignColumn ctermbg=NONE guibg=NONE
    highlight! NeoTreeTabInactive ctermbg=NONE guibg=NONE
    highlight! NvimTreeNormal ctermbg=NONE guibg=NONE
    highlight! NvimTreeNormalNC ctermbg=NONE guibg=NONE
    highlight! NvimTreeEndOfBuffer ctermbg=NONE guibg=NONE
    highlight! NvimTreeSignColumn ctermbg=NONE guibg=NONE
    highlight! WhichKey ctermbg=NONE guibg=NONE
    highlight! WhichKeyFloat ctermbg=NONE guibg=NONE
    highlight! TelescopePromptBorder ctermbg=NONE guibg=NONE
    highlight! TelescopePreviewBorder ctermbg=NONE guibg=NONE
    highlight! TelescopeResultsBorder ctermbg=NONE guibg=NONE
    highlight! TelescopeNormal ctermbg=NONE guibg=NONE
    highlight! TelescopePreviewNormal ctermbg=NONE guibg=NONE
    highlight! TelescopePreviewTitle ctermbg=NONE guibg=NONE
    highlight! TelescopePromptCounter ctermbg=NONE guibg=NONE
    highlight! TelescopePromptNormal ctermbg=NONE guibg=NONE
    highlight! TelescopePromptPrefix ctermbg=NONE guibg=NONE
    highlight! TelescopePromptTitle ctermbg=NONE guibg=NONE
    highlight! TelescopeResultsNormal ctermbg=NONE guibg=NONE
    highlight! TelescopeResultsTitle ctermbg=NONE guibg=NONE
    highlight! TreesitterContext ctermbg=NONE guibg=NONE
    highlight! TreesitterContextLineNumber ctermbg=NONE guibg=NONE guifg=NONE
  ]])
end

local init_highlight = function()
  setup_highlight()
  if vim.g.neovide then setup_terminal_highlight() end
  if not vim.b.win_separator then hide_win_separator() end
  if vim.b.syn_sidebar_with_normal then setup_syn_sidebar_with_normal() end
  if vim.b.float_window_brightness then setup_add_brightness_to_float_window() end
  if vim.b.better_cmp_cursor_line then setup_better_cmp_cursor_line() end
  if vim.b.transparent_background then setup_transparent_background() end
  if vim.b.syn_all_border_color then setup_synchronized_border_color() end
  if vim.b.syn_all_telescope_border then setup_synchronized_telescope() end
end

init_highlight()
