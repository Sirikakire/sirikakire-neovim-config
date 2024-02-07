return {
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      require('telescope').setup({
        pickers = {
          find_files = {
            hidden = true
          },
          live_grep = {
            hidden = true
          },
          buffers = {},
          diagnostics = {},
          git_bcommits = {},
        },
      })
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fp', builtin.git_bcommits, {})
      require("telescope").load_extension("ui-select")
    end
  }
}
