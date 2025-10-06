return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "master",
    lazy = false,
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = require("utils").treesitter_parsers,
        auto_install = true, -- Tắt auto_install để tăng tốc khởi động
        sync_install = true, -- Tắt sync_install để tăng tốc khởi động
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- Giảm xuống 100KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          use_languagetree = false, -- Tắt use_languagetree để tối ưu hiệu suất
        },
        indent = {
          enable = true,
          -- disable = { "ruby", "yaml", "python" } -- Tắt indent cho một số ngôn ngữ nếu bạn thấy chậm
        },
        autotag = {
          enable = true,
          enable_rename = false, -- Chỉ bật tính năng cần thiết
          enable_close = true,
          enable_close_on_slash = false, -- Tắt để tăng hiệu suất
        },
      })
    end
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter", -- Chỉ tải khi cần thiết
  }
}
