return {
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
  config = function()
    local treesitter_config = require('nvim-treesitter.configs')
    treesitter_config.setup({
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "java",
        "json",
        "ruby",
        "sql",
        "html",
        "css",
        "scss",
        "angular",
        "bash",
        "dockerfile",
        "gitignore",
        "regex",
        "tsx",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
      },
      sync_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = { "html" , "xml" },
      }
    })
  end
}
