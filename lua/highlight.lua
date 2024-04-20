local init = require("init")

-- NOTE: Setup highlight
local setup_highlight = function()
  -- NOTE: sync treesitter context
  vim.api.nvim_set_hl(0, "TreesitterContext", { link = "Normal" })
  vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "LineNr" })
  vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "LineNr" })

  -- NOTE: sync neotree and nvim tree separator
  vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { link = "WinSeparator" })
  vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { link = "WinSeparator" })
  vim.api.nvim_set_hl(0, "BufferLineOffsetSeparator", { link = "WinSeparator" })

  -- NOTE: sync indent line scope
  vim.api.nvim_set_hl(0, "IblScope", { link = "Comment" })

  -- NOTE: Remove FloatBorder bg but keep the fg and ctermbg
  local floatBorderForeground = vim.b.syn_all_border_color and vim.b.border_color or init.getHexColor("FloatBorder").foreground
  vim.cmd("highlight FloatBorder ctermbg=NONE guibg=NONE guifg="..floatBorderForeground)
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
  vim.cmd("highlight PmenuSel guibg="..cmpColorAfter.background.." guifg="..cmpColorAfter.foreground)
end

-- NOTE: Remove WinSepartor
local remove_win_separator = function()
  -- NOTE: Get rid of dim background
  vim.api.nvim_set_hl(0, "NormalNC", { link = "Normal" })
  -- NOTE: Sync WinSeparator with Normal to hide win separator
  vim.api.nvim_set_hl(0, "WinSeparator", { link = "Normal" })
end

-- NOTE: Setup add brightness to float window
local setup_add_brightness_to_float_window = function()
  local normalFloatBackground = init.getHexColor("NormalFloat").background
  if normalFloatBackground ~= "NONE" then
    local normalFloatBackgroundAfterAddBrightness = init.addBrightnessToHexColor(normalFloatBackground, vim.b.float_window_brightness)
    vim.cmd("highlight NormalFloat guibg="..normalFloatBackgroundAfterAddBrightness)
  end
end

-- NOTE: Setup synchronized Telescope border
local setup_synchronized_telescope = function ()
  vim.cmd("highlight TelescopeTitle ctermbg=NONE guibg=NONE guifg="..vim.b.border_color)
  vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { link = "TelescopeTitle" })
  vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "TelescopeTitle" })
  vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { link = "TelescopeTitle" })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "WinSeparator" })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "WinSeparator" })
  vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "WinSeparator" })
end

-- NOTE: Setup synchronized WinSeparator background
local setup_synchronized_winseparator = function()
  vim.cmd("highlight WinSeparator ctermbg=NONE guibg=NONE guifg="..vim.b.border_color)
end

-- NOTE: Optional transparent WinSeparator
local setup_transparent_background = function()
  vim.cmd("highlight GitGutterDelete ctermbg=NONE guibg=NONE")
  vim.cmd("highlight GitGutterChangeDelete ctermbg=NONE guibg=NONE")
  vim.cmd("highlight GitGutterChange ctermbg=NONE guibg=NONE")
  vim.cmd("highlight GitGutterAdd ctermbg=NONE guibg=NONE")
  vim.cmd("highlight GitSignsAdd ctermbg=NONE guibg=NONE")
  vim.cmd("highlight GitSignsChange ctermbg=NONE guibg=NONE")
  vim.cmd("highlight GitSignsDelete ctermbg=NONE guibg=NONE")
  vim.cmd("highlight GitSignsTopdelete ctermbg=NONE guibg=NONE")
  vim.cmd("highlight GitSignsUntracked ctermbg=NONE guibg=NONE")
  vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
  vim.cmd("highlight NormalFloat ctermbg=NONE guibg=NONE")
  vim.cmd("highlight NormalNC ctermbg=NONE guibg=NONE")
  vim.cmd("highlight LineNr ctermbg=NONE guibg=NONE guifg=NONE")
  vim.cmd("highlight CursorLineNr ctermbg=NONE guibg=NONE guifg=NONE")
  vim.cmd("highlight SignColumn ctermbg=NONE guibg=NONE guifg=NONE")
  vim.cmd("highlight SignColumnSB ctermbg=NONE guibg=NONE guifg=NONE")
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
  vim.cmd("highlight WhichKey ctermbg=NONE guibg=NONE")
  vim.cmd("highlight WhichKeyFloat ctermbg=NONE guibg=NONE")
  vim.cmd("highlight TelescopePromptBorder ctermbg=NONE guibg=NONE")
  vim.cmd("highlight TelescopePreviewBorder ctermbg=NONE guibg=NONE")
  vim.cmd("highlight TelescopeResultsBorder ctermbg=NONE guibg=NONE")
  vim.cmd("highlight TelescopeNormal ctermbg=NONE guibg=NONE")
  vim.cmd("highlight TelescopePreviewNormal ctermbg=NONE guibg=NONE")
  vim.cmd("highlight TelescopePreviewTitle ctermbg=NONE guibg=NONE")
  vim.cmd("highlight TelescopePromptCounter ctermbg=NONE guibg=NONE")
  vim.cmd("highlight TelescopePromptNormal ctermbg=NONE guibg=NONE")
  vim.cmd("highlight TelescopePromptPrefix ctermbg=NONE guibg=NONE")
  vim.cmd("highlight TelescopePromptTitle ctermbg=NONE guibg=NONE")
  vim.cmd("highlight TelescopeResultsNormal ctermbg=NONE guibg=NONE")
  vim.cmd("highlight TelescopeResultsTitle ctermbg=NONE guibg=NONE")
  vim.cmd("highlight TreesitterContext ctermbg=NONE guibg=NONE")
  vim.cmd("highlight TreesitterContextLineNumber ctermbg=NONE guibg=NONE guifg=NONE")
  vim.cmd("highlight DiagnosticSignError ctermbg=NONE guibg=NONE")
  vim.cmd("highlight DiagnosticSignWarn ctermbg=NONE guibg=NONE")
  vim.cmd("highlight DiagnosticSignInfo ctermbg=NONE guibg=NONE")
  vim.cmd("highlight DiagnosticSignHint ctermbg=NONE guibg=NONE")
  vim.cmd("highlight DiagnosticSignOk ctermbg=NONE guibg=NONE")
  vim.cmd("highlight DiagnosticError ctermbg=NONE guibg=NONE")
  vim.cmd("highlight DiagnosticWarn ctermbg=NONE guibg=NONE")
  vim.cmd("highlight DiagnosticInfo ctermbg=NONE guibg=NONE")
  vim.cmd("highlight DiagnosticHint ctermbg=NONE guibg=NONE")
  vim.cmd("highlight DiagnosticOk ctermbg=NONE guibg=NONE")
end

setup_highlight()
if vim.b.win_separator == false then remove_win_separator() end
if vim.b.better_cmp_cursor_line then setup_better_cmp_cursor_line() end
if vim.b.float_window_brightness then setup_add_brightness_to_float_window() end
if vim.b.transparent_background then setup_transparent_background() end
if vim.b.syn_all_border_color then setup_synchronized_winseparator() end
if vim.b.syn_all_telescope_border then setup_synchronized_telescope() end
