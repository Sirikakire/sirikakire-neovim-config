-- NOTE: Loading Neovim global variable
require("init").setup({
  transparent_background = false,
  mapleader = " ",
  border_color = "#cbc398",
  doc_border = false,
  win_separator = true,
  syn_all_border_color = false,
  syn_all_telescope_border = false,
  float_window_brightness = 0,
  better_cmp_cursor_line = true,
  colorscheme = "rose-pine"
})

require("autocmd") -- NOTE: Autocmd
require("options-setup") -- NOTE: Neovim options
require("lazy-nvim") -- NOTE: Lazy vim install and import plugins
require("wsl-win32yank") -- NOTE: Clipboard integration for Neovim on WSL, should install win32yank via scoop
require("keymap") -- NOTE: Neovim keymap
require("highlight") -- NOTE: Neovim highlight
