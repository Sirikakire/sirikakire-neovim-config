return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  branch = "main",
  opts = {
    experimental = {
      check_rtp = false,
      check_rtp_message = false
    },
    preview = {
      filetypes = { "markdown", "Avante" },
      ignore_buftypes = {},
    },
    max_length = 99999,
  }
};
