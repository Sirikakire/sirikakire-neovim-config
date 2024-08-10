return {
   "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
   event = "BufEnter",
   config = function()
     require('nvim-treesitter.configs').setup({
       ensure_installed = require("utils").treesitter_parsers,
       auto_install = true,
       sync_install = true,
       highlight = {
         enable = true,
         additional_vim_regex_highlighting = false,
       },
       indent = { enable = true },
       autotag = {
         enable = true,
         enable_rename = true,
         enable_close = true,
         enable_close_on_slash = true,
       },
     })
   end
}
