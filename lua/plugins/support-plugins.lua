return {
  { "nvim-lua/plenary.nvim" } ,
  { "MunifTanjim/nui.nvim", lazy = true } ,
  { "nvim-telescope/telescope-ui-select.nvim", lazy = true },
  {
    -- Make sure to set this up properly if you have lazy=true
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
  },
}
