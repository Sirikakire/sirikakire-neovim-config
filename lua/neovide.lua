--[[ 
  NOTE: Neovide %Username%/AppData/roaming/neovide/config.toml file
  fork = true
  wsl = true
  no-multigrid = false
  vsync = true
  maximized = false
  srgb = true
  idle = true
  neovim-bin = "/opt/nvim-linux-x86_64/bin/nvim" # in reality found dynamically on $PATH if unset
  frame = "none"
  title-hidden = false
  tabs = true

  [box-drawing]
# "font-glyph", "native" or "selected-native"
  mode = "native"
]]

if vim.g.neovide and vim.b.neovide_setting then
  vim.cmd("cd ~")

  local setting = vim.b.neovide_setting

  if setting.font_setting ~=nil and setting.font_setting.name ~= "" then
    local font = setting.font_setting.name .. ":h" .. setting.font_setting.size
    font = setting.font_setting.italic and font .. ":i" or font
    font = setting.font_setting.bold and font .. ":b" or font
    vim.o.guifont = font
  end

  vim.g.neovide_opacity = setting.transparency
  vim.g.neovide_window_blurred = true
  vim.g.neovide_normal_opacity = setting.opacity
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_z_height = 0
  vim.g.neovide_light_angle_degrees = 5
  vim.g.neovide_light_radius = 0
  vim.g.neovide_show_border = false
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_scroll_animation_far_lines = 0
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_underline_stroke_scale = 1.0
  vim.g.neovide_unlink_border_highlights = false
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_no_idle = false
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_fullscreen = false
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_profiler = false
  vim.g.neovide_cursor_animation_length = 0.07
  vim.g.neovide_cursor_trail_size = 0.4
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_smooth_blink = false
  -- vim.g.neovide_title_background_color = string.format(
  --   "%x",
  --   vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg
  -- )
  --
  -- vim.g.neovide_title_text_color = "pink"
end
