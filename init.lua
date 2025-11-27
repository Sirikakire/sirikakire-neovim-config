require("init").setup({
  transparent_background = false,
  mapleader = " ",
  border_color = "#e7c173",
  doc_border_type = "single",
  win_separator = true,
  background_theme = "dark",
  thick_win_separator = true, -- Đổi thành false để giảm tải rendering
  syn_sidebar_with_normal = true,
  float_window_brightness = 40,
  better_cmp_cursor_line = true,
  line_space = 0,
  colorscheme = "nordic",
  neovide_setting = {
    transparency = 1,
    opacity = 1,
    dont_apply_transparent_background = true,
    font_setting = {
      name = "JetBrainsMonoNL Nerd Font",
      size = 13,
      bold = false,
    }
  }
})

require("autocmd") -- NOTE: Autocmd
require("lazy-nvim") -- NOTE: Lazy vim install and import plugins
require("options-setup") -- NOTE: Neovim options
require("clipboard-provider") -- NOTE: Clipboard integration for Neovim on WSL, should install win32yank via scoop
require("keymap").setup_custom_keymap() -- NOTE: Neovim custom keymap
require("neovide") -- NOTE: Neovide setting

-- Defer non-critical highlights
vim.defer_fn(function()
  require("highlight").init_highlight()
end, 100)
