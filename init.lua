require("autocmd") -- NOTE: Autocmd
require("init").setup({
  transparent_background = false,
  mapleader = " ",
  border_color = "#e7c173",
  doc_border_type = "single",
  win_separator = true,
  background_theme = "dark",
  thick_win_separator = false, -- Đổi thành false để giảm tải rendering
  syn_all_border_color = false,
  syn_all_noice_cmdline_border = false,
  syn_all_telescope_border = false,
  syn_sidebar_with_normal = true,
  float_window_brightness = 0,
  better_cmp_cursor_line = true,
  line_space = 0,
  colorscheme = "everforest",
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
require("options-setup") -- NOTE: Neovim options
require("lazy-nvim") -- NOTE: Lazy vim install and import plugins
require("wsl-win32yank") -- NOTE: Clipboard integration for Neovim on WSL, should install win32yank via scoop
require("keymap").setup_custom_keymap() -- NOTE: Neovim custom keymap
require("neovide") -- NOTE: Neovide setting

-- Defer non-critical highlights
vim.defer_fn(function()
  require("highlight").init_highlight()
end, 100)
