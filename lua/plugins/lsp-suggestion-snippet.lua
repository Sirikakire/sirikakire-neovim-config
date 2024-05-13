return {
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    event = "InsertEnter",
  },
  {
    "github/copilot.vim",
    keys = require("keymap").copilot_keymaps,
    event = "VeryLazy"
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup({
        debug = false, -- Enable debug logging
        proxy = nil, -- [protocol://]host[:port] Use this proxy
        allow_insecure = false, -- Allow insecure server connections

        system_prompt = require('CopilotChat.prompts').COPILOT_INSTRUCTIONS, -- System prompt to use
        model = 'gpt-4', -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
        temperature = 0.1, -- GPT temperature

        question_header = '## User ', -- Header to use for user questions
        answer_header = '## Copilot ', -- Header to use for AI answers
        error_header = '## Error ', -- Header to use for errors
        separator = '---', -- Separator to use in chat

        show_folds = true, -- Shows folds for sections in chat
        show_help = true, -- Shows help message as virtual lines when waiting for user input
        auto_follow_cursor = true, -- Auto-follow cursor in chat
        auto_insert_mode = false, -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
        clear_chat_on_new_prompt = false, -- Clears chat on every new prompt

        context = nil, -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
        history_path = vim.fn.stdpath('data') .. '/copilotchat_history', -- Default path to stored history
        callback = nil, -- Callback to use when ask response is received

        -- default selection (visual or line)
        selection = function(source)
          return require('CopilotChat.select').visual(source) or require('CopilotChat.select').line(source)
        end,

        -- default prompts
        prompts = {
          Explain = {
            prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.',
          },
          Review = {
            prompt = '/COPILOT_REVIEW Review the selected code.',
            callback = function(response, source)
              -- see config.lua for implementation
            end,
          },
          Fix = {
            prompt = '/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.',
          },
          Optimize = {
            prompt = '/COPILOT_GENERATE Optimize the selected code to improve performance and readablilty.',
          },
          Docs = {
            prompt = '/COPILOT_GENERATE Please add documentation comment for the selection.',
          },
          Tests = {
            prompt = '/COPILOT_GENERATE Please generate tests for my code.',
          },
          FixDiagnostic = {
            prompt = 'Please assist with the following diagnostic issue in file:',
            selection = require('CopilotChat.select').diagnostics,
          },
          Commit = {
            prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
            selection = require('CopilotChat.select').gitdiff,
          },
          CommitStaged = {
            prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
            selection = function(source)
              return require('CopilotChat.select').gitdiff(source, true)
            end,
          },
        },

        -- default window options
        window = {
          layout = 'float', -- 'vertical', 'horizontal', 'float', 'replace'
          width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
          height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
          -- Options below only apply to floating windows
          relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
          border = require("utils").border, -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
          row = nil, -- row position of the window, default is centered
          col = nil, -- column position of the window, default is centered
          title = 'Sirikakire Copilot Chat', -- title of chat window
          footer = nil, -- footer of chat window
          zindex = 1, -- determines if window is on top or below other floating windows
        },

        -- default mappings
        mappings = {
          complete = {
            detail = 'Use @<Tab> or /<Tab> for options.',
            insert ='<Tab>',
          },
          close = {
            normal = 'q',
            insert = '<C-c>'
          },
          reset = {
            normal ='<C-l>',
            insert = '<C-l>'
          },
          submit_prompt = {
            normal = '<CR>',
            insert = '<C-m>'
          },
          accept_diff = {
            normal = '<C-y>',
            insert = '<C-y>'
          },
          yank_diff = {
            normal = 'gy',
          },
          show_diff = {
            normal = 'gd'
          },
          show_system_prompt = {
            normal = 'gp'
          },
          show_user_selection = {
            normal = 'gs'
          },
        },
      })
    end
  },
  { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
  { "hrsh7th/cmp-path", event = { "InsertEnter", "CmdlineEnter" } },
  { "hrsh7th/cmp-cmdline", event = { "InsertEnter", "CmdlineEnter" } },
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip").filetype_extend("ruby", { "rails" })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        completion = {
          -- noselect, 
          completeopt = "noselect, menu, menuone, noinsert, preview",
        },
        window = {
          completion = cmp.config.window.bordered({
            border = require("utils").border,
            winhighlight = "Normal:NormalFloat,CursorLine:PmenuSel,Search:None",
          }),
          documentation = cmp.config.window.bordered({
            border = require("utils").border,
            winhighlight = "Normal:NormalFloat,CursorLine:PmenuSel,Search:None",
          })
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              cmp_tabnine = "[TabNine]",
              cmdline = "[CMDLine]",
              path = "[Path]",
            })[entry.source.name]
            vim_item.kind = string.format("%s %s", require("utils").navic_icon[vim_item.kind], vim_item.kind)
            return vim_item
          end,
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping({
            i = cmp.config.disable,
            c = cmp.config.disable,
            s = cmp.config.disable
          }),
          ['<S-Tab>'] = cmp.mapping({
            i = cmp.config.disable,
            c = cmp.config.disable,
            s = cmp.config.disable
          }),
          ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), { "i" }),
          ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), { "i" }),
          ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i" }),
          ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i" }),
          ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i" }),
          ["<C-a>"] = cmp.mapping(cmp.mapping.complete(), { "i" }),
          ["<CR>"] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm()
              else
                fallback()
              end
            end,
            s = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm()
              else
                fallback()
              end
            end,
            c = function(fallback)
              -- cmp.SelectBehavior.Replace()
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm()
              else
                fallback()
              end
            end,
          }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "cmp_tabnine" },
          { name = "path" },
        }),
      })
      -- NOTE:  `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline({
          ['<Tab>'] = cmp.mapping({
            i = cmp.config.disable,
            c = cmp.config.disable,
            s = cmp.config.disable
          }),
          ['<S-Tab>'] = cmp.mapping({
            i = cmp.config.disable,
            c = cmp.config.disable,
            s = cmp.config.disable
          }),
        }),
        sources = cmp.config.sources(
          {
            { name = "path" },
          },
          {
            {
              name = "cmdline",
              option = {
                ignore_cmds = { "Man", "!" },
              },
            },
          }
        ),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end,
  },
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

      -- FIX: Fixing a bug that trigger vim.lsp.buf.hover multiple times when using it when running multiple lsp in a single buffer
      vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
        config = config or {}
        config.focus_id = ctx.method
        config.border = require("utils").border
        if not (result and result.contents) then
          return
        end
        local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
        markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
        if vim.tbl_isempty(markdown_lines) then
          return
        end
        return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
      end

      -- NOTE: Styling
      require("lspconfig.ui.windows").default_options.border = require("utils").border

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = require("utils").border,
      })

      -- NOTE: Diagnostic Sign
      vim.diagnostic.config({
        virtual_text = { prefix = " ", source = "always" },
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

      -- NOTE: Nvim notify

      local client_notifs = {}
      local function get_notif_data(client_id, token)
        if not client_notifs[client_id] then client_notifs[client_id] = {} end
        if not client_notifs[client_id][token] then client_notifs[client_id][token] = {} end
        return client_notifs[client_id][token]
      end
      local spinner_frames = require("utils").spinner_frames
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

      local success_icon = require("utils").sign_icons.success

      vim.lsp.handlers["$/progress"] = function(_, result, ctx)
        local val = result.value
        if val.title == "Diagnosing" or not val.kind then return end

        local client_id = ctx.client_id
        local notif_data = get_notif_data(client_id, result.token)
        if val.kind == "begin" then
          notif_data.notification = vim.notify(format_message(val.title, val.percentage), "info", {
            title = "Messages",
            icon = spinner_frames[1],
            timeout = false,
            hide_from_history = false,
          })
          notif_data.spinner = 1
          update_spinner(client_id, result.token)
        elseif val.kind == "report" and notif_data and notif_data.notification then
          notif_data.notification = vim.notify(format_message(val.message, val.percentage), "info", {
            title = "Messages",
            replace = notif_data.notification,
            hide_from_history = false,
          })
        elseif val.kind == "end" and notif_data and notif_data.notification then
          notif_data.notification = vim.notify(val.message and format_message(val.message) or "Complete", "info", {
            title = "Messages",
            icon = success_icon,
            replace = notif_data.notification,
            timeout = 1500
          })
          notif_data.spinner = nil
        end
      end
    end
  },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
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
        })
      end

      require("mason-lspconfig").setup({
        ensure_installed = require("utils").lsp_servers,
        handlers = { setupLSP },
        automatic_installation = true,
      })
    end,
  },
}
