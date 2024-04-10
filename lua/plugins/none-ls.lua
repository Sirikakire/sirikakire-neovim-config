return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local builtins = null_ls.builtins
      null_ls.setup({
        sources = {
          -- Formatting
          builtins.formatting.stylua,
          builtins.formatting.prettierd,
          -- builtins.formatting.rubocop,
          builtins.formatting.codespell,

          -- Diagnostic
          builtins.diagnostics.codespell,
        },
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = require("utils").null_ls_formatters,
      })
    end,
  },
}
