return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local actions = require("telescope.actions")

      require('telescope').setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_ivy({}),
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
          path_display = { "smart" },
        },
        pickers = {
          find_files = {
            theme = "ivy",
            prompt_prefix = "  ",
            hidden = true
          },
          live_grep = {
            theme = "ivy",
            prompt_prefix = "  ",
          },
          buffers = {
            theme = "ivy",
            prompt_prefix = "  ",
          },
          diagnostics = {
            theme = "ivy",
            prompt_prefix = "  ",
          },
          git_bcommits = {
            theme = "ivy",
            prompt_prefix = "  ",
          },
          lsp_references = {
            theme = "ivy",
            prompt_prefix = "  ",
          },
          highlights = {
            theme = "ivy",
            prompt_prefix = "  ",
          },
          autocommands = {
            theme = "ivy",
            prompt_prefix = "  ",
          },
        },
      })
      -- require("telescope").load_extension("noice")
      require("telescope").load_extension("ui-select")
    end
  }
}
