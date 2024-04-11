return {
  "windwp/nvim-ts-autotag",
  event = { "BufRead", "BufEnter" },
  config = function ()
    require('nvim-treesitter.configs').setup({
      autotag = {
        enable = true,
      }
    })
  end
}

