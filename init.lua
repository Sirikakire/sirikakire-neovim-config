-- NOTE: Loading Neovim global variable
require("init").setup({
  transparent_background = false,
  mapleader = " ",
  border_color = "#e7c173",
  doc_border_type = "padding",
  win_separator = false,
  background_theme = "dark",
  thick_win_separator = false,
  syn_all_border_color = false,
  syn_all_noice_cmdline_border = false,
  syn_all_telescope_border = false,
  syn_sidebar_with_normal = false,
  float_window_brightness = -5,
  better_cmp_cursor_line = true,
  line_space = 1,
  colorscheme = "nightfox",
  neovide_setting = {
    transparency = 0.75,
    font_setting = {
      name = "FantasqueSansM Nerd Font Propo",
      size = 13,
      bold = false,
    }
  }
})

require("autocmd") -- NOTE: Autocmd
require("options-setup") -- NOTE: Neovim options
require("lazy-nvim") -- NOTE: Lazy vim install and import plugins
require("wsl-win32yank") -- NOTE: Clipboard integration for Neovim on WSL, should install win32yank via scoop
require("keymap").setup_custom_keymap() -- NOTE: Neovim custom keymap
require("neovide") -- NOTE: Neovide setting
require("highlight") -- NOTE: Neovim custom highlight
