return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    keys = require("keymap").mason_keymaps,
    opts = {
      log_level = vim.log.levels.OFF,
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

      -- NOTE: Disabled LSP generate logging file
      vim.lsp.set_log_level("off")

      -- NOTE: Mapping keymap for lsp
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          require("keymap").setup_lsp_keymap(opts)
        end,
      })

      -- NOTE: Diagnostic Sign
      vim.diagnostic.config({
        virtual_text = {
          prefix = " ",
          -- prefix = " ",
          source = "always"
        },
        -- virtual_text = false,
        -- virtual_lines = {},
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = require("utils").sign_icons.error,
            [vim.diagnostic.severity.WARN] = require("utils").sign_icons.warning,
            [vim.diagnostic.severity.HINT] = require("utils").sign_icons.hint,
            [vim.diagnostic.severity.INFO] = require("utils").sign_icons.info,
          },
          texthl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
          },
          linehl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticVirtualTextError",
            [vim.diagnostic.severity.WARN] = "DiagnosticVirtualTextWarn",
            [vim.diagnostic.severity.HINT] = "DiagnosticVirtualTextHint",
            [vim.diagnostic.severity.INFO] = "DiagnosticVirtualTextInfo",
          },
          numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = require("utils").border, source = true },
      })
    end
  }
}
