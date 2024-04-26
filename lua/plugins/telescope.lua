return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  keys = require("keymap").telescope_keymaps,
  event = "VeryLazy",
  config = function()
    local actions = require("telescope.actions")
    local common_setting = {
      -- theme = "",
      prompt_prefix = "  ",
    }
    require('telescope').setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        }
      },
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close
          },
        },
        layout_config = {
          vertical = { width = 0.5 }
        },
        wrap_results = true,
        dynamic_preview_title = true,
        -- path_display = { "smart" },
      },
      pickers = {
        find_files = vim.list_extend(common_setting, {
          find_command = "rg,--ignore,--hidden,--files"
        }),
        live_grep = vim.list_extend(common_setting, {}),
        buffers = vim.list_extend(common_setting, {}),
        diagnostics = vim.list_extend(common_setting, {}),
        git_bcommits = vim.list_extend(common_setting, {}),
        lsp_references = vim.list_extend(common_setting, {}),
        highlights = vim.list_extend(common_setting, {}),
        autocommands = vim.list_extend(common_setting, {}),
      },
    })
    require("telescope").load_extension("noice")
    require("telescope").load_extension("ui-select")
  end
}
