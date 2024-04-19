return {
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        ui = {
          border = require("utils").border,
          code_action = "",
        },
      })
    end,
  },
  {
    "VidocqH/lsp-lens.nvim",
    config = function ()
      local SymbolKind = vim.lsp.protocol.SymbolKind

      require'lsp-lens'.setup({
        enable = true,
        include_declaration = false,      -- Reference include declaration
        sections = {
          definition = function(count)
            return "Definitions: " .. count
          end,
          references = function(count)
            return "References: " .. count
          end,
          implements = function(count)
            return "Implements: " .. count
          end,
          git_authors = function(latest_author, count)
            return "  " .. latest_author .. (count - 1 == 0 and "" or (" + " .. count - 1))
          end,
        },
        ignore_filetype = {
          "prisma",
        },
        -- Target Symbol Kinds to show lens information
        target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
        -- Symbol Kinds that may have target symbol kinds as children
        wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct },
      })
    end
  },
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
  },
  {
    "L3MON4D3/LuaSnip",
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
    "github/copilot.vim",
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help"
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        completion = {
          completeopt = "noselect, menu, menuone, noinsert, preview",
        },
        window = {
          completion = cmp.config.window.bordered({
            border = require("utils").border,
            winhighlight = "Normal:NormalFloat,CursorLine:PmenuSel,Search:None",
            -- side_padding = 1,
            -- col_offset = -3,
          }),
          documentation = cmp.config.window.bordered({
            border = require("utils").border,
            winhighlight = "Normal:NormalFloat,CursorLine:PmenuSel,Search:None",
            -- side_padding = 1,
            -- col_offset = -3,
          })
        },
        formatting = {
          -- fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "(LSP)",
              luasnip = "(LuaSnip)",
              cmp_tabnine = "(TabNine)",
              buffer = "(Buffer)",
              cmdline = "(CMDLine)",
              path = "(Path)",
              -- copilot = "[Copilot]"
            })[entry.source.name]
            vim_item.kind = string.format("%s %s", require("utils").kind_icons[vim_item.kind], vim_item.kind)
            return vim_item
          end,
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
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
          { name = 'nvim_lsp_signature_help' },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "cmp_tabnine" },
          { name = "path" },
          -- { name = "copilot" },
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                local bufs = {}
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                  bufs[vim.api.nvim_win_get_buf(win)] = true
                end
                return vim.tbl_keys(bufs)
              end,
            },
          },
        }),
      })
      -- `/` cmdline setup.
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                local bufs = {}
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                  bufs[vim.api.nvim_win_get_buf(win)] = true
                end
                return vim.tbl_keys(bufs)
              end,
            },
          },
        },
      }) -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
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
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig.ui.windows").default_options.border = require("utils").border
      vim.lsp.set_log_level("off")
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = require("utils").border,
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local function setupLSP(lsp_server)
        require("lspconfig")[lsp_server].setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
          end,
        })
      end

      require("mason-lspconfig").setup({
        ensure_installed = require("utils").lsp_servers,
        handlers = {
          setupLSP,
        },
        automatic_installation = true,
      })

      -- Mapping keymap for lsp
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
          local opts = { buffer = ev.buf }
          require("keymap").setup(opts)
        end,
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = require("utils").border,
      })

      -- Fixing a bug that trigger vim.lsp.buf.hover multiple times when using it when running multiple lsp in a single buffer
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

      vim.diagnostic.config({
        virtual_text = {
          prefix = " ",
          source = "always",
        },
        signs = true,
        underline = false,
        update_in_insert = false,
        severity_sort = true,
        float = { border = require("utils").border, source = "always" },
      })

      -- Setup diagnostic highlight and icon
      vim.fn.sign_define({
        {
          name = "DiagnosticSignError",
          text = " ",
          texthl = "DiagnosticSignError",
          linehl = "ErrorLine",
          numhl = "DiagnosticSignError",
        },
        {
          name = "DiagnosticSignWarn",
          text = " ",
          texthl = "DiagnosticSignWarn",
          linehl = "WarningLine",
          numhl = "DiagnosticSignWarn",
        },
        {
          name = "DiagnosticSignInfo",
          text = " ",
          texthl = "DiagnosticSignInfo",
          linehl = "InfoLine",
          numhl = "DiagnosticSignInfo",
        },
        {
          name = "DiagnosticSignHint",
          text = " ",
          texthl = "DiagnosticSignHint",
          linehl = "HintLine",
          numhl = "DiagnosticSignHint",
        },
      })
    end,
  },
}
