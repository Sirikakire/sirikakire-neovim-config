return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  priority = 80,
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      preview = {},
      config = {
        week_header = { enable = true },
        packages = { enable = true },
        project = {
          enable = true,
          limit = 5,
          icon = "  ",
          label = "Recent projects",
          action = "cd ",
        },
        mru = { limit = 5, icon = "󰏓  ", label = "Recent files", cwd_only = false },
        footer = { '', '♥  Hello Sirikakire ♥ ', 'Hope you will have a wonderful day  ' },
        shortcut = {
          { desc = "Open Lazy 󰒲 ", action = "Lazy", key = "l" },
          { desc = "Open Mason  ", action = "Mason", key = "m" },
          { desc = "Navigate To Configuration 󱘎 ", action = "cd ~/.config/nvim | lua vim.notify('Successfully navigate to neovim configuration directory')", key = "c" },
        },
      },
    })
  end,
}
