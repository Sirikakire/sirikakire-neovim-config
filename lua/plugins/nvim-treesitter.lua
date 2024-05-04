return {
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
  event = "BufEnter",
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "json",
        "ruby",
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
        "markdown",
        "markdown_inline"
      },
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
