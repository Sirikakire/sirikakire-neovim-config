-- NOTE: Loading Neovim global variable
require("init").setup({
  transparent_background = false,
  mapleader = " ",
  border_color = "#cbc398",
  doc_border = false,
  win_separator = true,
  thick_win_separator = false,
  syn_all_border_color = false,
  syn_all_telescope_border = false,
  syn_neotree_with_normal = false,
  float_window_brightness = 0,
  better_cmp_cursor_line = true,
  colorscheme = "nightfox",
  neovide_setting = {
    font_setting = {
      transparency = 1,
      name = "CaskaydiaCove Nerd Font",
      size = 12,
      bold = false,
    }
  }
})

require("autocmd") -- NOTE: Autocmd
require("options-setup") -- NOTE: Neovim options
require("lazy-nvim") -- NOTE: Lazy vim install and import plugins
require("wsl-win32yank") -- NOTE: Clipboard integration for Neovim on WSL, should install win32yank via scoop
require("keymap").setup_keymap() -- NOTE: Neovim keymap
require("keymap").setup_whichkey_keymap() -- NOTE: Neovim whichkey keymap
require("neovide")
require("highlight") -- NOTE: Neovim highlight
