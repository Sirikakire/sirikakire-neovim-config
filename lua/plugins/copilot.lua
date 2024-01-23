return {
  {
    {
      "zbirenbaum/copilot.lua",
      config = function()
        vim.keymap.set({ "n", "v" }, "<leader>cp", ":Copilot panel<CR>")
        require('copilot').setup({
          panel = {
            enabled = true,
            auto_refresh = true,
            keymap = {
              jump_prev = "[[",
              jump_next = "]]",
              accept = "<CR>",
              refresh = "gr",
            },
            layout = {
              position = "left", -- | top | left | right
              ratio = 0.4
            },
          },
          suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
              accept = "<Tab>",
              accept_word = false,
              accept_line = false,
            },
          },
          --[[ filetypes = {
            yaml = false,
            markdown = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false,
          }, ]]
          filetypes = {
            ["*"] = true
          },
          copilot_node_command = 'node', -- Node.js version must be > 18.x
          server_opts_overrides = {},
        })
      end
    },
    {
      "zbirenbaum/copilot-cmp",
      config = function ()
        require("copilot_cmp").setup()
      end
    }
  }
}
