local M = {}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.b.win_separator = true
vim.b.border_color = "#ffffff"
vim.b.transparent_background = false
vim.b.thick_win_separator = false
vim.b.syn_all_border_color = false
vim.b.syn_all_telescope_border = false
vim.b.float_window_brightness = 0
vim.b.doc_border = false
vim.b.better_cmp_cursor_line = false
vim.b.colorscheme = ""
vim.b.syn_sidebar_with_normal = false
vim.b.line_space = 0
vim.b.neovide_setting = {
  scale_factor = 1,
  transparency = 1,
  font_setting = {
    name = "",
    size = 18,
    bold = false,
    italic = false
  }
}
vim.o.foldlevel = 99 --Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

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

  if params.better_cmp_cursor_line ~= nil then
    vim.b.better_cmp_cursor_line = params.better_cmp_cursor_line
  end

  if params.colorscheme ~= nil then
    vim.b.colorscheme = params.colorscheme
  end

  if params.thick_win_separator ~= nil then
    vim.b.thick_win_separator = params.thick_win_separator
  end

  if params.syn_sidebar_with_normal ~= nil then
    vim.b.syn_sidebar_with_normal = params.syn_sidebar_with_normal
  end

  if params.neovide_setting ~= nil then
    local setting = params.neovide_setting
    local default_setting = vim.b.neovide_setting

    local neovide_setting = {
      scale_factor = setting.scale_factor or default_setting.scale_factor,
      transparency = setting.transparency or default_setting.transparency,
      font_setting = {
        name = setting.font_setting.name or default_setting.font_setting.name,
        size = setting.font_setting.size or default_setting.font_setting.size,
        bold = setting.font_setting.bold or default_setting.font_setting.bold,
        italic = setting.font_setting.italic or default_setting.font_setting.italic
      }
    }

    vim.b.neovide_setting = neovide_setting
  end

  if params.line_space ~= nil then
    vim.b.line_space = params.line_space
  end
end

M.getHexColor = function (highlight)
  local color = vim.api.nvim_get_hl_by_name(highlight, true)
  return {
    background = color.background and ("#"..string.format("%06x", color.background)) or "NONE",
    foreground = color.foreground and ("#"..string.format("%06x", color.foreground)) or "NONE",
  }
end

M.addBrightnessToHexColor = function (hexColor, brightness)
  if brightness == nil then brightness = 0 end

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
  return string.format("#%02X%02X%02X", r, g, b)
end

M.complementaryColor = function (hexColor)
  -- Kiểm tra xem mã màu có dấu # không, nếu không có, thêm dấu #
  if string.sub(hexColor, 1, 1) ~= "#" then hexColor = "#" .. hexColor end

  -- Loại bỏ dấu # từ mã màu
  hexColor = string.sub(hexColor, 2)

  -- Chuyển đổi mã màu từ hex sang RGB
  local r = tonumber(string.sub(hexColor, 1, 2), 16)
  local g = tonumber(string.sub(hexColor, 3, 4), 16)
  local b = tonumber(string.sub(hexColor, 5, 6), 16)

  -- Tính toán màu bổ sung (complementary)
  local comp_r = 255 - r
  local comp_g = 255 - g
  local comp_b = 255 - b

  -- Chuyển đổi màu bổ sung (complementary) từ RGB sang hex
  return string.format("#%02X%02X%02X", comp_r, comp_g, comp_b)
end

return M
