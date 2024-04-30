return {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = function()
      local null_ls = require("null-ls")
      local builtins = null_ls.builtins
      null_ls.setup({
        sources = {
          -- NOTE: Formatting
          builtins.formatting.stylua,
          builtins.formatting.prettierd,

          -- NOTE: Diagnostic
          -- builtins.diagnostics.codespell,

          -- NOTE: Completion
          builtins.completion.spell
        },
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = "VeryLazy",
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = require("utils").null_ls_formatters,
      })
    end,
  },
}
