-- Loading Neovim global variable
require("init").setup({
  transparent_background = false,
  mapleader = " ",
  border_color = "#cbc398",
  win_separator = false,
  syn_all_border_color = true,
  syn_all_telescope_border = true,
  float_window_brightness = 0,
})

require("autocmd") -- Autocmd
require("options-setup") -- Neovim options
require("lazy-nvim") -- Lazy vim install and import plugins
require("wsl-win32yank") -- Clipboard integration for Neovim on WSL, should install win32yank via scoop
require("keymap") -- Neovim keymap
require("highlight") -- Neovim highlight
