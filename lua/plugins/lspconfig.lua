return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    keys = require("keymap").mason_keymaps,
    opts = {
      ui = {
        border = require("utils").border,
        icons = {
          package_pending = " ",
          package_installed = " ",
          package_uninstalled = " ",
        },
      },
      max_concurrent_installers = 10,
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = require("utils").lsp_servers,
      automatic_installation = true,
    }
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      -- NOTE: Styling
      require("lspconfig.ui.windows").default_options.border = require("utils").border

      -- NOTE: Setup LSP capabilities
      local capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        -- require('cmp_nvim_lsp').default_capabilities()
        require('blink.cmp').get_lsp_capabilities()
      )

      require("mason-lspconfig").setup_handlers({
        function(lsp_server)
          require("lspconfig")[lsp_server].setup({
            capabilities = capabilities,
          })
        end
      })

      -- NOTE: Disabled LSP generate logging file
      vim.lsp.set_log_level("off")

      -- NOTE: Mapping keymap for lsp
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          require("keymap").setup_lsp_keymap(opts)
        end,
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = require("utils").border,
      })

      -- NOTE: Diagnostic Sign
      vim.diagnostic.config({
        -- virtual_text = {
        --   prefix = " ",
        --   -- prefix = " ",
        --   source = "always"
        -- },
        virtual_text = false,
        virtual_lines = {},
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = require("utils").border, source = "always" },
      })

      -- NOTE: Setup diagnostic highlight and icon
      local signs = {
        Error = require("utils").sign_icons.error,
        Warn = require("utils").sign_icons.warning,
        Hint = require("utils").sign_icons.hint,
        Info = require("utils").sign_icons.info,
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        local linehl = "DiagnosticVirtualText" .. type
        vim.fn.sign_define(hl, {
          text = icon,
          texthl = hl,
          numhl = hl,
          linehl = linehl
        })
      end
    end
  }
}
