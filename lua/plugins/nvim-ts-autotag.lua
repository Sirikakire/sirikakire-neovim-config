return {
  "windwp/nvim-ts-autotag",
  event = "BufEnter",
  config = function ()
    require('nvim-treesitter.configs').setup({
      autotag = {
        enable = true,
      }
    })
  end
}

