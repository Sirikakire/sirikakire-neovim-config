-- NOTE: Loading Neovim global variable
require("init").setup({
  transparent_background = false,
  mapleader = " ",
  border_color = "#cbc398",
  doc_border = false,
  win_separator = false,
  thick_win_separator = false,
  syn_all_border_color = false,
  syn_all_telescope_border = false,
  syn_sidebar_with_normal = false,
  float_window_brightness = -10,
  better_cmp_cursor_line = true,
  line_space = 0,
  colorscheme = "rose-pine",
  neovide_setting = {
    transparency = 1,
    font_setting = {
      name = "CaskaydiaCove Nerd Font",
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
