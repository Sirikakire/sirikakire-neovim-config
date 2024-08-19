return {
  "brenoprata10/nvim-highlight-colors",
  event = "BufRead",
  opts = {
    ---@usage 'background'|'foreground'|'virtual'
    render = 'background',
    virtual_symbol = '■',
    enable_named_colors = true,
    enable_tailwind = false,
  }
}
