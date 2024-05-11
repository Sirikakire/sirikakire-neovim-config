return {
  "brenoprata10/nvim-highlight-colors",
  config = function ()
    require("nvim-highlight-colors").setup {
      ---@usage 'background'|'foreground'|'virtual'
      render = 'background',
      virtual_symbol = '■',
      enable_named_colors = true,
      enable_tailwind = false,
    }
  end
}
