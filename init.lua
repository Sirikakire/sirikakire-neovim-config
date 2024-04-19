-- Loading Neovim global variable
require("init").setup({
  transparent_background = false,
  mapleader = " ",
  border_color = "#cbc398",
  doc_border = true,
  win_separator = false,
  syn_all_border_color = false,
  syn_all_telescope_border = false,
  float_window_brightness = 50,
  better_cmp_cursor_line = true,
  colorscheme = "mellow"
})

require("autocmd") -- Autocmd
require("options-setup") -- Neovim options
require("lazy-nvim") -- Lazy vim install and import plugins
require("wsl-win32yank") -- Clipboard integration for Neovim on WSL, should install win32yank via scoop
require("keymap") -- Neovim keymap
require("highlight") -- Neovim highlight
