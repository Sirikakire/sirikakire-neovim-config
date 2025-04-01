return {
  "nvim-telescope/telescope.nvim",
  keys = require("keymap").telescope_keymaps,
  event = "VeryLazy",
  config = function()
    local actions = require("telescope.actions")
    local common_setting = { theme = "ivy" }

    local select_one_or_multi = function(prompt_bufnr)
      local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
      local multi = picker:get_multi_selection()
      if not vim.tbl_isempty(multi) then
        require('telescope.actions').close(prompt_bufnr)
        for _, j in pairs(multi) do
          local file = j.path or j.filename or j.value
          local lnum = j.lnum or 1
          local lcol = j.col or 1

          if file ~= nil then
            vim.cmd(string.format("%s %s", "edit", file))
            vim.cmd(string.format("%s %sG%s|", "normal!", lnum, lcol))
          end
        end
      else
        require('telescope.actions').select_default(prompt_bufnr)
      end
    end

    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_ivy({}),
        },
        ["fidget"] = {
          require("telescope.themes").get_ivy({}),
        },
      },
      defaults = {
        preview = {
          filesize_limit = 0.5555,
          highlights_limit = 0.555,
          timeout = 100,
        },
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
            ["<CR>"] = select_one_or_multi
          },
        },
        sorting_strategy = "ascending",
        -- layout_config = {
        --   horizontal = {
        --     prompt_position = "top",
        --     preview_width = 0.55,
        --   },
        --   width = 0.92,
        --   height = 0.88,
        -- },
        wrap_results = true,
        dynamic_preview_title = true,
        path_display = { "absolute" },
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
    })

    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("fidget")
  end
}
