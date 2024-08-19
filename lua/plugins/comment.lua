return {
  'numToStr/Comment.nvim',
  event = "BufRead",
  opts = {
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
      line = 'gcc',
      block = 'gbc',
    },
    opleader = {
      line = 'gc',
      block = 'gb',
    },
    mappings = {
      basic = true,
      extra = false,
    },
    pre_hook = nil,
    post_hook = nil,
  }
}
