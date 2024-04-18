local M = {}

vim.b.win_separator = true
vim.b.border_color = "#ffffff"
vim.b.transparent_background = false
vim.b.syn_all_border_color = false
vim.b.syn_all_telescope_border = false
vim.b.float_window_brightness = 0
vim.b.doc_border = false
vim.g.mapleader = " "

M.setup = function (params)
  if params.win_separator ~= nil then
    vim.b.win_separator = params.win_separator
  end

  if params.syn_all_border_color ~= nil then
    vim.b.syn_all_border_color = params.syn_all_border_color
  end

  if params.border_color ~= nil then
    vim.b.border_color = params.border_color
  end

  if params.transparent_background ~= nil then
    vim.b.transparent_background = params.transparent_background
  end

  if params.syn_all_telescope_border ~= nil then
    vim.b.syn_all_telescope_border = params.syn_all_telescope_border
  end

  if params.mapleader ~= nil then
    vim.g.mapleader = params.mapleader
  end

  if params.float_window_brightness ~= nil then
    vim.b.float_window_brightness = params.float_window_brightness
  end

  if params.doc_border ~= nil then
    vim.b.doc_border = params.doc_border
  end
end

M.getHexColor = function (highlight)
  local color = vim.api.nvim_get_hl_by_name(highlight, true)
  return {
    background = color.background and string.format("%06x", color.background) or "NONE",
    foreground = color.foreground and string.format("%06x", color.foreground) or "NONE",
  }
end

M.addBrightnessToHexColor = function (hexColor, brightness)
  if brightness == nil then
    brightness = 0
  end
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

return M
