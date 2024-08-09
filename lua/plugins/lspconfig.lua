return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      -- NOTE: Disabled LSP generate logging file
      vim.lsp.set_log_level("off")

      -- NOTE: Mapping keymap for lsp
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
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
          prefix = " ",
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
      local client_notifs = {}
      local spinner_frames = require("utils").spinner_frames
      local success_icon = require("utils").sign_icons.success

      local function get_notif_data(client_id, token)
        client_notifs[client_id] = client_notifs[client_id] or {}
        client_notifs[client_id][token] = client_notifs[client_id][token] or {}
        return client_notifs[client_id][token]
      end

      local function update_spinner(client_id, token)
        local notif_data = get_notif_data(client_id, token)

        if notif_data.spinner then
          local new_spinner = (notif_data.spinner + 1) % #spinner_frames
          notif_data.spinner = new_spinner

          notif_data.notification = vim.notify(nil, nil, {
            title = "Messages",
            hide_from_history = true,
            icon = spinner_frames[new_spinner],
            replace = notif_data.notification,
          })

          vim.defer_fn(function()
            update_spinner(client_id, token)
          end, 100)
        end
      end

      local function format_message(message, percentage)
        return (percentage and percentage .. "%\t" or "") .. (message or "")
      end

      vim.lsp.handlers["$/progress"] = function(_, result, ctx)
        local val = result.value
        if val.title == "Diagnosing" or not val.kind then return end

        local client_id = ctx.client_id
        local notif_data = get_notif_data(client_id, result.token)

        local function notify_user(message, options)
          options = options or {}
          options.title = "Messages"
          options.hide_from_history = options.hide_from_history or false
          options.replace = notif_data.notification
          notif_data.notification = vim.notify(message, "info", options)
        end

        if val.kind == "begin" then
          notify_user(format_message(val.title, val.percentage), {icon = spinner_frames[1], timeout = false})
          notif_data.spinner = 1
          update_spinner(client_id, result.token)
        elseif val.kind == "report" and notif_data.notification then
          notify_user(format_message(val.message, val.percentage))
        elseif val.kind == "end" and notif_data.notification then
          notify_user(val.message and format_message(val.message) or "Complete", {icon = success_icon, timeout = 1500})
          notif_data.spinner = nil
        end
      end
    end
  },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    keys = require("keymap").mason_keymaps,
    config = function()
      require("mason").setup({
        ui = { border = require("utils").border },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local setupLSP = function(lsp_server)
        require("lspconfig")[lsp_server].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            if client.server_capabilities["documentSymbolProvider"] then
              require("nvim-navic").attach(client, bufnr)
            end
          end
        })
      end

      require("mason-lspconfig").setup({
        ensure_installed = require("utils").lsp_servers,
        handlers = { setupLSP },
        automatic_installation = true,
      })
    end,
  }
}
