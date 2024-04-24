return {
  {
    "SmiteshP/nvim-navic",
    -- event = { "BufEnter", "BufRead" },
    config = function()
      require("nvim-navic").setup({
        icons = require("utils").nv_chad_icons,
        lsp = {
          auto_attach = true,
          preference = nil,
        },
        highlight = false,
        separator = " 󰁕 ",
        depth_limit = 2,
        depth_limit_indicator = "..",
        safe_output = true,
        lazy_update_context = true,
        click = true,
        format_text = function(text)
          return text
        end,
      })
    end
  },
  {
    "hinell/lsp-timeout.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lspTimeoutConfig = {
        stopTimeout  = 1000 * 60 * 2, -- ms, timeout before stopping all LSPs 
        startTimeout = 1000 * 10,     -- ms, timeout before restart
        silent       = false,          -- true to suppress notifications
        filetypes    = {
          ignore = {                -- filetypes to ignore; empty by default
            -- lsp-timeout is disabled completely
          }                         -- for these filetypes
        }
      }
    end
  },
  {
    "VidocqH/lsp-lens.nvim",
    event = { "BufEnter", "BufRead" },
    config = function()
      local SymbolKind = vim.lsp.protocol.SymbolKind

      require 'lsp-lens'.setup({
        enable = true,
        include_declaration = false, -- Reference include declaration
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
            return " " .. latest_author .. (count - 1 == 0 and "" or (" + " .. count - 1))
          end,
        },
        ignore_filetype = {
          "prisma",
          "neo-tree",
          "dashboard",
          "toggleterm"
        },
        target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
        wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct },
      })
    end
  },
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    event = "InsertEnter",
    dependencies = "hrsh7th/nvim-cmp",
  },
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    event = "InsertEnter"
  },
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    event = "InsertEnter"
  },
  {
    "hrsh7th/cmp-buffer",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "hrsh7th/cmp-path",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "hrsh7th/cmp-cmdline",
    event = { "InsertEnter", "CmdlineEnter" },
  },
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
          -- fields = { "abbr", "menu", "kind" },
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              cmp_tabnine = "[TabNine]",
              buffer = "[Buffer]",
              cmdline = "[CMDLine]",
              path = "[Path]",
            })[entry.source.name]
            vim_item.kind = string.format("%s %s", require("utils").nv_chad_icons[vim_item.kind], vim_item.kind)
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
          {
            name = "buffer",
            max_item_count = 3,
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
      -- NOTE: `/` cmdline setup.
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          {
            name = "buffer",
            max_item_count = 5,
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
      })
      -- NOTE:  `:` cmdline setup.
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
    event = "VeryLazy",
    config = function()
      require("lspconfig.ui.windows").default_options.border = require("utils").border
      vim.lsp.set_log_level("off")
    end,
  },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
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
    event = "VeryLazy",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local function setupLSP(lsp_server)
        require("lspconfig")[lsp_server].setup({
          capabilities = capabilities,
        })
      end

      require("mason-lspconfig").setup({
        ensure_installed = require("utils").lsp_servers,
        handlers = {
          setupLSP,
        },
        automatic_installation = true,
      })

      -- NOTE: Mapping keymap for lsp
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
          local opts = { buffer = ev.buf }
          require("keymap").setup_lsp_keymap(opts)
        end,
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = require("utils").border,
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

      -- NOTE: Setup diagnostic highlight and icon
      local sign_icon = require("utils").sign_icons
      local signs = {
        Error = sign_icon.error,
        Warn = sign_icon.warning,
        Hint = sign_icon.hint,
        Info = sign_icon.info,
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        local linehl = "DiagnosticVirtualText" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl, linehl = linehl })
      end
    end,
  },
}
