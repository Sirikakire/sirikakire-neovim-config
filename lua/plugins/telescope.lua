return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  keys = require("keymap").telescope_keymaps,
  event = "VeryLazy",
  opts = function()
    local actions = require("telescope.actions")
    local common_setting = {
      -- theme = "dropdown",
    }
    require("telescope").load_extension("ui-select")

    return {
      extensions = {
        ["ui-select"] = {
          -- require("telescope.themes").get_dropdown({}),
        }
      },
      defaults = {
        prompt_prefix = "  ",
        file_ignore_patterns = {
          "node_modules/.*",
          "yarn.lock",
          "package%-lock.json",
          "lazy%-lock.json",
          "target/.*",
          ".git/.*",
          ".angular/.*",
          ".vscode/.*",
        },
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.92,
          height = 0.88,
        },
        wrap_results = true,
        dynamic_preview_title = true,
        -- path_display = { "smart" },
      },
      pickers = {
        find_files = vim.list_extend(common_setting, {}),
        live_grep = vim.list_extend(common_setting, {}),
        buffers = vim.list_extend(common_setting, {}),
        diagnostics = vim.list_extend(common_setting, {}),
        git_bcommits = vim.list_extend(common_setting, {}),
        lsp_references = vim.list_extend(common_setting, {}),
        highlights = vim.list_extend(common_setting, {}),
        autocommands = vim.list_extend(common_setting, {}),
      },
    }
  end
}
