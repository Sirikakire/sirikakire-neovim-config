return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
    -- config = function()
      -- require('nvim-treesitter').setup({
      --   auto_install = true, -- Tắt auto_install để tăng tốc khởi động
      --   sync_install = true, -- Tắt sync_install để tăng tốc khởi động
      --   highlight = {
      --     enable = true,
      --     additional_vim_regex_highlighting = false,
      --     disable = function(lang, buf)
      --       local max_filesize = 100 * 1024 -- Giảm xuống 100KB
      --       local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      --       if ok and stats and stats.size > max_filesize then
      --         return true
      --       end
      --     end,
      --     use_languagetree = false, -- Tắt use_languagetree để tối ưu hiệu suất
      --   },
      --   indent = {
      --     enable = true,
      --     -- disable = { "ruby", "yaml", "python" } -- Tắt indent cho một số ngôn ngữ nếu bạn thấy chậm
      --   },
      --   autotag = {
      --     enable = true,
      --     enable_rename = false, -- Chỉ bật tính năng cần thiết
      --     enable_close = true,
      --     enable_close_on_slash = false, -- Tắt để tăng hiệu suất
      --   },
      -- })
    -- end
    init = function()
      require('nvim-treesitter').install(require("utils").treesitter_parsers)
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.wo[0][0].foldmethod = 'expr'
    end
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter", -- Chỉ tải khi cần thiết
  }
}
