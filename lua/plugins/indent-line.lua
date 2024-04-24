return {
  "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
  event = { 'BufRead', 'BufEnter' },
  config = function ()
    require("ibl").setup {
      exclude = {
        filetypes = { "dashboard", "mason", "neo-tree", "lazy", "toggleterm", "TelescopePrompt" }
      },
      scope = { enabled = false },
      indent = {
        char = "▏",
      }
    }
  end
}
