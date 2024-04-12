local getHexColor = function (highlight)
  local color = vim.api.nvim_get_hl_by_name(highlight, true)
  return {
    background = string.format("%06x", color.background),
    foreground = string.format("%06x", color.foreground),
  }
end

local addBrightnessToHexColor = function (hexColor, brightness)
    -- Remove the hash symbol if present
    local hex = hexColor:gsub("#", "")

    -- Extract red, green, blue components from the hex string
    local r = tonumber(hex:sub(1, 2), 16)
    local g = tonumber(hex:sub(3, 4), 16)
    local b = tonumber(hex:sub(5, 6), 16)

    -- Calculate the adjustment factor
    local factor = (100 + brightness) / 100

    -- Adjust the brightness
    r = math.min(255, math.floor(r * factor))
    g = math.min(255, math.floor(g * factor))
    b = math.min(255, math.floor(b * factor))

    -- Reassemble into a hex string and return
    local adjustedHex = string.format("#%02X%02X%02X", r, g, b)
    return adjustedHex
end

-- Setup highlight
local setup_highlight = function()
  -- sync treesitter context with normal
  vim.api.nvim_set_hl(0, "TreesitterContext", { link = "Normal" })
  vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "LineNr" })
  vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "LineNr" })

  -- Make NormalFloat brighter
  local normalFloatBackground = addBrightnessToHexColor(getHexColor("NormalFloat").background, vim.b.float_window_brightness)
  vim.cmd("highlight NormalFloat guibg="..normalFloatBackground)

  -- remove FloatBorder bg but keep the fg and ctermbg
  vim.cmd("highlight FloatBorder ctermbg=NONE guibg=NONE")
end

-- Setup synchronized Telescope border
local setup_synchronized_telescope = function ()
  vim.cmd("highlight TelescopeTitle ctermbg=NONE guibg=NONE guifg="..vim.b.border_color)
  vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { link = "TelescopeTitle" })
  vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "TelescopeTitle" })
  vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { link = "TelescopeTitle" })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "WinSeparator" })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "WinSeparator" })
  vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "WinSeparator" })
end

-- Setup synchronized WinSeparator background
local setup_synchronized_winseparator = function()
  vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { link = "WinSeparator" })
  vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { link = "WinSeparator" })
  vim.cmd("highlight WinSeparator ctermbg=NONE guibg=NONE guifg="..vim.b.border_color)
end

-- Optional transparent WinSeparator
local setup_transparent_background = function()
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
end

setup_highlight()
if vim.b.transparent_background then setup_transparent_background() end
if vim.b.syn_all_border_color then setup_synchronized_winseparator() end
if vim.b.syn_all_telescope_border then setup_synchronized_telescope() end
