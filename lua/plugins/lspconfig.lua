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

      -- NOTE: Fixing a bug that trigger vim.lsp.buf.hover multiple times when using it when running multiple lsp in a single buffer
      vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
        config = config or {}
        config.focus_id = ctx.method
        config.border = require("utils").border
        if not (result and result.contents) then return end
        local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
        markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
        if vim.tbl_isempty(markdown_lines) then return end
        return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
      end

      -- NOTE: Styling
      require("lspconfig.ui.windows").default_options.border = require("utils").border

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = require("utils").border,
      })

      -- NOTE: Diagnostic Sign
      vim.diagnostic.config({
        virtual_text = {
          -- prefix = " ",
          prefix = " ",
          source = "always"
        },
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

      -- NOTE: Nvim lsp progress notify
      -- local client_notifs = {}
      -- local success_icon = require("utils").sign_icons.success
      --
      -- local function get_notif_data(client_id, token)
      --   client_notifs[client_id] = client_notifs[client_id] or {}
      --   client_notifs[client_id][token] = client_notifs[client_id][token] or {}
      --   return client_notifs[client_id][token]
      -- end
      --
      -- local function update_spinner(client_id, token)
      --   local notif_data = get_notif_data(client_id, token)
      --
      --   if notif_data.spinner then
      --     local notification_data = MiniNotify.get(notif_data.notification)
      --     MiniNotify.update(notif_data.notification, {
      --       msg = notification_data.msg,
      --       level = "INFO",
      --     })
      --
      --     vim.defer_fn(function()
      --       update_spinner(client_id, token)
      --     end, 100)
      --   else
      --     vim.defer_fn(function() MiniNotify.remove(notif_data.notification) end, 1000)
      --   end
      -- end
      --
      -- local function format_message(title, message, percentage)
      --   return (title or "") .. (percentage and percentage .. "%\t" or "") .. (message or "")
      -- end
      --
      -- vim.lsp.handlers["$/progress"] = function(_, result, ctx)
      --   local val = result.value
      --   if val.title == "Diagnosing" or not val.kind then return end
      --
      --   local client_id = ctx.client_id
      --   local notif_data = get_notif_data(client_id, result.token)
      --
      --   local function notify_user(message, options)
      --     if notif_data.notification then
      --       MiniNotify.update(notif_data.notification, {
      --         msg = message,
      --         level = "INFO"
      --       })
      --     else
      --       notif_data.notification = MiniNotify.add(message, "INFO")
      --     end
      --   end
      --
      --   if val.kind == "begin" then
      --     notify_user(format_message(val.title, val.message, val.percentage))
      --     notif_data.spinner = 1
      --     update_spinner(client_id, result.token)
      --   elseif val.kind == "report" and notif_data.notification then
      --     notify_user(format_message(val.title, val.message, val.percentage))
      --   elseif val.kind == "end" and notif_data.notification then
      --     notify_user(format_message(val.title, val.message, val.percentage) or "Complete", {icon = success_icon, timeout = 1500})
      --     notif_data.spinner = nil
      --   end
      -- end
    end
  }
}
