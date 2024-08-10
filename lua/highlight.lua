local init = require("init")

-- NOTE: Setup highlight
local setup_highlight = function()
  -- highlight! link NvimTreeFolderIcon guifg=#e7c173
  --[[
     NOTE: Personal highlight setting: 
    - Remove FloatBorder bg but keep the guifg
    - Remove Diagnostic sign and Git sign background
    - Remove signcolumn background
    - Sign icons highlight
    - Neotree folder color
    - Get rid of dim background
    - sync neotree and nvim tree separator
  ]]
  vim.cmd([[
    highlight! link DiffAdd GitSignsAdd
    highlight! link DiffDelete GitSignsDelete
    highlight! link DiffChange GitSignsChange
    highlight! link NvimTreeGitNew GitSignsAdd
    highlight! link NvimTreeGitDeleted GitSignsDelete
    highlight! link NvimTreeGitDirty GitSignsChange
    highlight! link NvimTreeGitStaged GitSignsAdd
    highlight! link NvimTreeDiagnosticHintIcon DiagnosticSignHint
    highlight! link NvimTreeDiagnosticInfoIcon DiagnosticSignInfo
    highlight! link NvimTreeDiagnosticWarnIcon DiagnosticSignWarn
    highlight! link NvimTreeDiagnosticErrorIcon DiagnosticSignError
    highlight! link NeoTreeGitNew GitSignsAdd
    highlight! link NeoTreeGitUntracked GitSignsAdd
    highlight! link NeoTreeGitModified GitSignsChange

    highlight! link BufferDefaultOffset NvimTreeNormal
    highlight! link NvimTreeFolderIcon NvimTreeFolderName

    highlight! link WinBar Normal
    highlight! link WinBarNC NormalNC

    highlight! link StatusLine Normal
    highlight! link StatusLineNC Normal
    highlight! link NeoTreeExpander NeoTreeDirectoryIcon

    highlight! link NeoTreeWinSeparator WinSeparator
    highlight! link NvimTreeWinSeparator WinSeparator

    highlight! LineNr ctermbg=NONE guibg=NONE
    highlight! SignColumn ctermbg=NONE guibg=NONE

    highlight! FloatBorder ctermbg=NONE guibg=NONE
    highlight! NonText guibg=NONE

		highlight! link BufferCurrentMod Normal
		" highlight! link TabLineFill Normal
  ]])
end

-- NOTE: setup cursor line highlight
local setup_cursor_line_highlight = function()
  -- NOTE: sync color line 
  local cursorLineBackground = init.getHexColor("CursorLine").background
  vim.cmd("highlight! IblScope guibg=NONE ctermbg=NONE guifg="..cursorLineBackground)
  vim.cmd("highlight! IblIndent guibg=NONE ctermbg=NONE guifg="..cursorLineBackground)
  vim.cmd("highlight! WinSeparator guibg=NONE ctermbg=NONE guifg="..cursorLineBackground)
end

-- NOTE: Setup barbar highlight
local setup_barbar_highlight = function()
  local normalColor = init.getHexColor("Normal")
  vim.cmd("highlight! BufferCurrent guibg="..normalColor.background.." guifg="..normalColor.foreground.." gui=bold")
end

-- NOTE: Setup cmp highlight
local setup_cmp_highlight = function()
  local palette = vim.opt.background._value == "light" and require("utils").light_palette or require("utils").dark_palette

  local cmd_executions = {
    "highlight! CmpItemAbbr guibg=NONE guifg="..palette.overlay2,
    "highlight! CmpItemAbbrDeprecated guibg=NONE guifg="..palette.overlay0.." gui=strikethrough",
    "highlight! CmpItemKind guibg=NONE guifg="..palette.blue,
    "highlight! CmpItemMenu guibg=NONE guifg="..palette.text,
    "highlight! CmpItemAbbrMatch guibg=NONE guifg="..palette.text.. " gui=bold",
    "highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg="..palette.text.." gui=bold",
    "highlight! CmpItemKindSnippet guibg=NONE guifg="..palette.mauve,
    "highlight! CmpItemKindKeyword guibg=NONE guifg="..palette.red,
    "highlight! CmpItemKindText guibg=NONE guifg="..palette.teal,
    "highlight! CmpItemKindMethod guibg=NONE guifg="..palette.blue,
    "highlight! CmpItemKindConstructor guibg=NONE guifg="..palette.blue,
    "highlight! CmpItemKindFunction guibg=NONE guifg="..palette.blue,
    "highlight! CmpItemKindFolder guibg=NONE guifg="..palette.blue,
    "highlight! CmpItemKindModule guibg=NONE guifg="..palette.blue,
    "highlight! CmpItemKindConstant guibg=NONE guifg="..palette.peach,
    "highlight! CmpItemKindField guibg=NONE guifg="..palette.green,
    "highlight! CmpItemKindProperty guibg=NONE guifg="..palette.green,
    "highlight! CmpItemKindEnum guibg=NONE guifg="..palette.green,
    "highlight! CmpItemKindUnit guibg=NONE guifg="..palette.green,
    "highlight! CmpItemKindClass guibg=NONE guifg="..palette.yellow,
    "highlight! CmpItemKindVariable guibg=NONE guifg="..palette.flamingo,
    "highlight! CmpItemKindFile guibg=NONE guifg="..palette.blue,
    "highlight! CmpItemKindInterface guibg=NONE guifg="..palette.yellow,
    "highlight! CmpItemKindColor guibg=NONE guifg="..palette.red,
    "highlight! CmpItemKindReference guibg=NONE guifg="..palette.red,
    "highlight! CmpItemKindEnumMember guibg=NONE guifg="..palette.red,
    "highlight! CmpItemKindStruct guibg=NONE guifg="..palette.blue,
    "highlight! CmpItemKindValue guibg=NONE guifg="..palette.peach,
    "highlight! CmpItemKindEvent guibg=NONE guifg="..palette.blue,
    "highlight! CmpItemKindOperator guibg=NONE guifg="..palette.blue,
    "highlight! CmpItemKindTypeParameter guibg=NONE guifg="..palette.blue,
    "highlight! CmpItemKindCopilot guibg=NONE guifg="..palette.teal,
  }

  for i, cmd in ipairs(cmd_executions) do
    -- Check the highlight's guifg is Existed

    -- Execute the command
    vim.cmd(cmd)
  end
end

-- NOTE: Safely remove diagnostic sign background
local remove_diagnostic_sign_background = function()
  local diagnostic_signs = { "Ok", "Error", "Warn", "Info", "Hint" }
  for i, sign in pairs(diagnostic_signs) do
    local sign_foreground = init.getHexColor("DiagnosticSign"..sign).foreground

    if sign_foreground ~= "NONE" then
      vim.cmd("highlight! DiagnosticSign"..sign.." ctermbg=NONE guibg=NONE guifg="..sign_foreground)
    end
  end
end

-- NOTE: Safely remove git sign background
local remove_git_sign_background = function()
  local git_signs = { "Add", "Delete", "Change" }
  for i, sign in pairs(git_signs) do
    local sign_foreground = init.getHexColor("GitSigns"..sign).foreground

    if sign_foreground ~= "NONE" then
      vim.cmd("highlight! GitSigns"..sign.." ctermbg=NONE guibg=NONE guifg="..sign_foreground)
    end
  end
end

local setup_terminal_highlight = function()
  local terminal_colors = vim.opt.background._value == "light" and require("utils").terminal_light_palette or require("utils").terminal_dark_palette

  for i, color in ipairs(terminal_colors) do
    if not vim.g["terminal_color_" .. i-1] then
      vim.g["terminal_color_" .. i-1] = color
    end
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

-- NOTE: Hide WinSepartor by linking with Normal
local hide_win_separator = function()
  vim.cmd("highlight! link WinSeparator Normal")
end


-- NOTE: sync Neotree/NvimTree with normal
local setup_syn_sidebar_with_normal = function()
  vim.cmd([[
    highlight! link NeoTreeNormal Normal
    highlight! link NvimTreeNormal Normal
    highlight! link NeoTreeNormalNC NormalNC
    highlight! link NvimTreeNormalNC NormalNC
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

local setup_synchronized_noice_cmdline = function ()
  vim.cmd([[
    highlight! link NoiceCmdline WinSeparator
    highlight! link NoiceCmdlineIcon NoiceCmdline
    highlight! link NoiceCmdlineIconCalculator NoiceCmdline
    highlight! link NoiceCmdlineIconCmdline NoiceCmdline
    highlight! link NoiceCmdlineIconFilter NoiceCmdline
    highlight! link NoiceCmdlineIconHelp NoiceCmdline
    highlight! link NoiceCmdlineIconIncRename NoiceCmdline
    highlight! link NoiceCmdlineIconInput NoiceCmdline
    highlight! link NoiceCmdlineIconLua NoiceCmdline
    highlight! link NoiceCmdlineIconSearch NoiceCmdline
    highlight! link NoiceCmdlinePopupBorderCalculator NoiceCmdline
    highlight! link NoiceCmdlinePopupBorderFilter NoiceCmdline
    highlight! link NoiceCmdlinePopupBorderHelp NoiceCmdline
    highlight! link NoiceCmdlinePopupBorderIncRename NoiceCmdline
    highlight! link NoiceCmdlinePopupBorderInput NoiceCmdline
    highlight! link NoiceCmdlinePopupBorderLua NoiceCmdline
    highlight! link NoiceCmdlinePopupBorderSearch NoiceCmdline
    highlight! link NoiceCmdlinePrompt NoiceCmdline
    highlight! link NoiceCmdlinePopupTitle NoiceCmdline
    highlight! link NoiceCmdlinePopup NONE
    highlight! link NoiceCmdlinePopupBorderCmdline NONE
    highlight! link NoiceCmdlinePopupBorder NONE
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
    highlight! TelescopePromptCounter ctermbg=NONE guibg=NONE
    highlight! TreesitterContext ctermbg=NONE guibg=NONE
    highlight! TreesitterContextLineNumber ctermbg=NONE guibg=NONE guifg=NONE
    highlight! NoiceCmdline ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlineIcon ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlineIconCalculator ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlineIconCmdline ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlineIconFilter ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlineIconHelp ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlineIconIncRename ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlineIconInput ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlineIconLua ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlineIconSearch ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlinePopup ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlinePopupBorder ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlinePopupBorderCalculator ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlinePopupBorderCmdline ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlinePopupBorderFilter ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlinePopupBorderHelp ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlinePopupBorderIncRename ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlinePopupBorderInput ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlinePopupBorderLua ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlinePopupBorderSearch ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlinePopupTitle ctermbg=NONE guibg=NONE
    highlight! NoiceCmdlinePrompt ctermbg=NONE guibg=NONE
  ]])
end

local init_highlight = function()
  setup_highlight()
  setup_cursor_line_highlight()
  setup_cmp_highlight()
  setup_barbar_highlight()
  remove_diagnostic_sign_background()
  remove_git_sign_background()
  if vim.g.neovide then setup_terminal_highlight() end
  if not vim.b.win_separator then hide_win_separator() end
  if vim.b.syn_sidebar_with_normal then setup_syn_sidebar_with_normal() end
  if vim.b.float_window_brightness then setup_add_brightness_to_float_window() end
  if vim.b.better_cmp_cursor_line then setup_better_cmp_cursor_line() end
  if vim.b.transparent_background then setup_transparent_background() end
  if vim.b.syn_all_border_color then setup_synchronized_border_color() end
  if vim.b.syn_all_telescope_border then setup_synchronized_telescope() end
  if vim.b.syn_all_noice_cmdline_border then setup_synchronized_noice_cmdline() end
end

init_highlight()
