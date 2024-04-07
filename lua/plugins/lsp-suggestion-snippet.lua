-- Icon for lsp diagnostics
--[[ local kind_icons = {
  Text = "  ",
  Method = "󰆧  ",
  Function = "󰊕  ",
  Constructor = "  ",
  Field = "󰇽  ",
  Variable = "󰂡  ",
  Class = "󰠱  ",
  Interface = "  ",
  Module = "  ",
  Property = "󰜢  ",
  Unit = "  ",
  Value = "󰎠  ",
  Enum = "  ",
  Keyword = "󰌋  ",
  Snippet = "  ",
  Color = "󰏘  ",
  File = "󰈙  ",
  Reference = "  ",
  Folder = "󰉋  ",
  EnumMember = "  ",
  Constant = "󰏿  ",
  Struct = "  ",
  Event = "  ",
  Operator = "󰆕  ",
  TypeParameter = "󰅲  ",
  TabNine = '󰂂  ',
  Copilot = '  '
} ]]

local kind_icons = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
  TabNine = '󰂂  ',
  Copilot = '  '
}

-- Lsp server list
local lsp_servers = {
  "tsserver", -- typescript
  "lua_ls", -- lua
  "cssls", -- css
  "bashls", -- bash
  "jsonls", -- json
  "tailwindcss", -- tailwindcss
  "emmet_ls", -- emmet
  "cssmodules_ls", -- css modules
  "html", -- html
  "solargraph", -- ruby
  "dockerls", -- docker
  "volar", -- vue
  "docker_compose_language_service", -- docker-compose
  "angularls" -- angular
}

return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function ()
      require("lspsaga").setup({
        ui = {
          border = require(".plugins.border"),
          code_action = ''
        }
      })
    end
  },
  {
    'tzachar/cmp-tabnine',
    build = './install.sh',
    dependencies = 'hrsh7th/nvim-cmp',
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets"
    },
    config = function()
      require('luasnip').filetype_extend("ruby", {"rails"})
      require('luasnip.loaders.from_vscode').lazy_load()
    end
  },
  {
    "github/copilot.vim",
  },
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = function ()
      local cmp = require('cmp')
      cmp.setup {
        -- preselect = cmp.PreselectMode.Item,
        -- completion = { completeopt = 'menu,menuone,noinsert,preview' },
        window = {
          completion = cmp.config.window.bordered({
            border = require(".plugins.border"),
            side_padding = 1,
            col_offset = -3
          }),
          documentation = cmp.config.window.bordered({
            border = require(".plugins.border"),
            side_padding = 1,
            col_offset = -3
          }),
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              cmp_tabnine = "[TabNine]",
              buffer = "[Buffer]",
              cmdline = "[CMDLine]",
              path = "[Path]",
              -- copilot = "[Copilot]"
            })[entry.source.name]
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            return vim_item
          end
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-a>'] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources(
          {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'cmp_tabnine' },
            {
              name = 'buffer',
              option = {
                get_bufnrs = function()
                  local bufs = {}
                  for _, win in ipairs(vim.api.nvim_list_wins()) do
                    bufs[vim.api.nvim_win_get_buf(win)] = true
                  end
                  return vim.tbl_keys(bufs)
                end
              }
            },
            -- { name = 'copilot' }
          }
        ),
      }
      -- `/` cmdline setup.
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          {
            name = 'buffer',
            option = {
              get_bufnrs = function()
                local bufs = {}
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                  bufs[vim.api.nvim_win_get_buf(win)] = true
                end
                return vim.tbl_keys(bufs)
              end
            }
          },
        }
      })    -- `:` cmdline setup.
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
            {
              name = 'cmdline',
              option = {
                ignore_cmds = { 'Man', '!' }
              }
            }
          })
      })
      --[[ cmp.event:on("menu_opened", function()
        vim.b.copilot_suggestion_hidden = true
      end)

      cmp.event:on("menu_closed", function()
        vim.b.copilot_suggestion_hidden = false
      end) ]]
    end
  },
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason.nvim",
    config = function ()
      require("mason").setup({
        ui = {
          border = require(".plugins.border"),
        }
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function ()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local function setupLSP (lsp_server)
        require("lspconfig")[lsp_server].setup({
          capabilities = capabilities
        })
      end

      require('mason-lspconfig').setup({
        ensure_installed = lsp_servers,
        handlers = {
          setupLSP
        },
        automatic_installation = true
      })

      -- Mapping keymap for lsp
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          local opts = { buffer = ev.buf }
          require("keymap").setup(opts)
        end,
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        {
          border = require(".plugins.border")
        }
      )

      -- Fixing a bug that trigger vim.lsp.buf.hover multiple times when using it when running multiple lsp in a single buffer
      vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
        config = config or {}
        config.focus_id = ctx.method
        config.border = require(".plugins.border")
        if not (result and result.contents) then
          return
        end
        local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
        markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
        if vim.tbl_isempty(markdown_lines) then
          return
        end
        return vim.lsp.util.open_floating_preview(markdown_lines, 'markdown', config)
      end

      vim.diagnostic.config({
        virtual_text =  {
          prefix = "",
        },
        virtual_lines = {
          only_current_line = true
        },
        signs = true,
        underline = false,
        update_in_insert = false,
        severity_sort = true,
        float = { border = require(".plugins.border"), source = 'always' },
      })

      -- Setup diagnostic hightlight and icon
      vim.fn.sign_define({
        {
          name = "DiagnosticSignError",
          text = "",
          texthl = "DiagnosticSignError",
          linehl = "ErrorLine",
          numhl = "DiagnosticSignError"
        },
        {
          name = "DiagnosticSignWarn",
          text = "",
          texthl = "DiagnosticSignWarn",
          linehl = "WarningLine",
          numhl = "DiagnosticSignWarn"
        },
        {
          name = "DiagnosticSignInfo",
          text = "",
          texthl = "DiagnosticSignInfo",
          linehl = "InfoLine",
          numhl = "DiagnosticSignInfo"
        },
        {
          name = "DiagnosticSignHint",
          text = "",
          texthl = "DiagnosticSignHint",
          linehl = "HintLine",
          numhl = "DiagnosticSignHint"
        },
      })
    end
  },
}
