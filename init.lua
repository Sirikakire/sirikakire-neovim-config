-- Loading Neovim global variable
require("init").setup({
  mapleader = " ",
  win_separator = false,
  syn_all_border_color = true,
  syn_all_telescope_border = false,
  transparent_background = false,
})

require("autocmd") -- Autocmd
require("options-setup") -- Neovim options
require("lazy-nvim") -- Lazy vim install and import plugins
require("wsl-win32yank") -- Clipboard integration for Neovim on WSL, should install win32yank via scoop
require("keymap") -- Neovim keymap
require("highlight") -- Neovim highlight
