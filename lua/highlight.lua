local init = require("init")

-- NOTE: Setup highlight
local setup_highlight = function()
  -- NOTE: Remove background for icons
  vim.cmd("highlight! GitSignsAdd ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! GitSignsDelete ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! GitSignsChange ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! DiagnosticSignOk ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! DiagnosticSignError ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! DiagnosticSignHint ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! DiagnosticSignInfo ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! DiagnosticSignWarn ctermbg=NONE guibg=NONE")

  -- NOTE: remove ctermbg and guibg for WinSeparator
  vim.cmd("highlight! WinSeparator ctermbg=NONE guibg=NONE")

  -- NOTE: Sync winbar with normal
  vim.cmd("highlight! link WinBar Normal")

  -- NOTE: Get rid of dim background
  -- vim.cmd("highlight! link NormalNC Normal")
  vim.cmd("highlight! link NormalNC Normal")
  vim.cmd("highlight! link NeoTreeNormalNC NeoTreeNormal")
  vim.cmd("highlight! link NvimTreeNormalNC NvimTreeNormal")
  vim.cmd("highlight! link NeoTreeExpander NeoTreeDirectoryIcon")

  -- NOTE: Remove cmp item background
  vim.cmd("highlight! CmpItemAbbr guibg=NONE")
  vim.cmd("highlight! CmpItemKind guibg=NONE")
  vim.cmd("highlight! CmpItemMenu guibg=NONE")

  -- NOTE: sync neotree and nvim tree separator
  vim.cmd("highlight! link NeoTreeWinSeparator WinSeparator")
  vim.cmd("highlight! link NvimTreeWinSeparator WinSeparator")

  -- NOTE: sync color line same as comment
  vim.cmd("highlight! link IblScope Comment")
  vim.cmd("highlight! link IblIndent Comment")
  vim.cmd("highlight! link WinSeparator Comment")

  -- NOTE: Remove FloatBorder bg but keep the fg and ctermbg
  local floatBorderForeground = vim.b.syn_all_border_color and vim.b.border_color or init.getHexColor("FloatBorder").foreground
  vim.cmd("highlight! FloatBorder ctermbg=NONE guibg=NONE guifg="..floatBorderForeground)
end

-- NOTE: sync Neotree/NvimTree with normal
local setup_syn_sidebar_with_normal = function()
  vim.cmd("highlight! link NeoTreeNormal Normal")
  vim.cmd("highlight! link NvimTreeNormal Normal")
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

-- NOTE: Remove WinSepartor
local hide_win_separator = function()
  -- NOTE: Sync WinSeparator with Normal to hide win_separator
  vim.cmd("highlight! link WinSeparator Normal")
end

-- NOTE: Setup add brightness to float window
local setup_add_brightness_to_float_window = function()
  local normalFloatBackground = init.getHexColor("NormalFloat").background
  if normalFloatBackground ~= "NONE" then
    local normalFloatBackgroundAfterAddBrightness = init.addBrightnessToHexColor(normalFloatBackground, vim.b.float_window_brightness)
    vim.cmd("highlight! NormalFloat guibg="..normalFloatBackgroundAfterAddBrightness)
  end
end

-- NOTE: Setup synchronized Telescope border
local setup_synchronized_telescope = function ()
  vim.cmd("highlight! TelescopeTitle ctermbg=NONE guibg=NONE guifg="..vim.b.border_color)
  vim.cmd("highlight! link TelescopePreviewTitle TelescopeTitle")
  vim.cmd("highlight! link TelescopePromptTitle TelescopeTitle")
  vim.cmd("highlight! link TelescopeResultsTitle TelescopeTitle")
  vim.cmd("highlight! link TelescopePreviewBorder WinSeparator")
  vim.cmd("highlight! link TelescopePromptBorder WinSeparator")
  vim.cmd("highlight! link TelescopeResultsBorder WinSeparator")
end

-- NOTE: Setup synchronized WinSeparator background
local setup_synchronized_winseparator = function()
  vim.cmd("highlight! WinSeparator ctermbg=NONE guibg=NONE guifg="..vim.b.border_color)
end

-- NOTE: Optional transparent 
local setup_transparent_background = function()
  vim.cmd("highlight! GitGutterDelete ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! GitGutterChangeDelete ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! GitGutterChange ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! GitGutterAdd ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! GitSignsAdd ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! GitSignsChange ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! GitSignsDelete ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! GitSignsTopdelete ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! GitSignsUntracked ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! Normal ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! NormalFloat ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! NormalNC ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! LineNr ctermbg=NONE guibg=NONE guifg=NONE")
  vim.cmd("highlight! CursorLineNr ctermbg=NONE guibg=NONE guifg=NONE")
  vim.cmd("highlight! SignColumn ctermbg=NONE guibg=NONE guifg=NONE")
  vim.cmd("highlight! SignColumnSB ctermbg=NONE guibg=NONE guifg=NONE")
  vim.cmd("highlight! NeoTree ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! NeoTreeNormal ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! NeoTreeNormalNC ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! NeoTreeEndOfBuffer ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! NeoTreeSignColumn ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! NeoTreeTabInactive ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! NvimTreeNormal ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! NvimTreeNormalNC ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! NvimTreeEndOfBuffer ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! NvimTreeSignColumn ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! WhichKey ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! WhichKeyFloat ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! TelescopePromptBorder ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! TelescopePreviewBorder ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! TelescopeResultsBorder ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! TelescopeNormal ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! TelescopePreviewNormal ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! TelescopePreviewTitle ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! TelescopePromptCounter ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! TelescopePromptNormal ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! TelescopePromptPrefix ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! TelescopePromptTitle ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! TelescopeResultsNormal ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! TelescopeResultsTitle ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! TreesitterContext ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! TreesitterContextLineNumber ctermbg=NONE guibg=NONE guifg=NONE")
  vim.cmd("highlight! DiagnosticSignError ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! DiagnosticSignWarn ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! DiagnosticSignInfo ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! DiagnosticSignHint ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! DiagnosticSignOk ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! DiagnosticError ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! DiagnosticWarn ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! DiagnosticInfo ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! DiagnosticHint ctermbg=NONE guibg=NONE")
  vim.cmd("highlight! DiagnosticOk ctermbg=NONE guibg=NONE")
end

local init_highlight = function()
  setup_highlight()
  if not vim.b.win_separator then hide_win_separator() end
  if vim.b.better_cmp_cursor_line then setup_better_cmp_cursor_line() end
  if vim.b.syn_sidebar_with_normal then setup_syn_sidebar_with_normal() end
  if vim.b.float_window_brightness then setup_add_brightness_to_float_window() end
  if vim.b.transparent_background then setup_transparent_background() end
  if vim.b.syn_all_border_color then setup_synchronized_winseparator() end
  if vim.b.syn_all_telescope_border then setup_synchronized_telescope() end
end

init_highlight()
