return {
  'numToStr/Comment.nvim',
  event = { "BufRead", "BufEnter" },
  config = function ()
    local comment = require("Comment")
    comment.setup({
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
      ---lhs of extra mappings
      -- extra = {
      --   ---add comment on the line above
      --   above = 'gco',
      --   ---Add comment on the line below
      --   below = 'gco',
      --   ---Add comment at the end of line
      --   eol = 'gcA',
      -- },
      --- NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
        basic = true,
        extra = false,
      },
      pre_hook = nil,
      post_hook = nil,
    })
  end
}
