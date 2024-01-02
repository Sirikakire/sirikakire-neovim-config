return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets"
    }
  },
  {
    'hrsh7th/cmp-nvim-lsp',
  },
  {
    'hrsh7th/nvim-cmp',
    config = function ()
      require('luasnip.loaders.from_vscode').lazy_load()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      --[[ local kind_icons = {
        Text = "",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰇽",
        Variable = "󰂡",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰅲",
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
        TabNine = '󰂂  '
      }
      cmp.setup {
        window = {
          completion = cmp.config.window.bordered({
            border = "single"
          }),
          documentation = cmp.config.window.bordered({
            border = "single"
          }),
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              nvim_lua = "[Lua]",
              luasnip = "[LuaSnip]",
              latex_symbols = "[Latex]",
              cmp_tabnine = "[TabNine]",
              buffer = "[Buffer]",
            })[entry.source.name]
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            return vim_item
          end
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources(
          {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'cmp_tabnine' },
          }, {
            { name = 'buffer' },
          }
        ),
      }
    end
  },
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason.nvim",
    config = function ()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function ()
      local lsp_servers = {
        "tsserver",
        "lua_ls",
        "angularls",
        "jdtls",
        "cssls",
        "bashls",
        "jsonls",
        "tailwindcss",
        "emmet_ls",
        "cssmodules_ls",
        "html"
        --"ruby_ls"
      }
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
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        end,
      })
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      -- Fixing a bug that trigger vim.lsp.buf.hover multiple times when using it when running multiple lsp in a single buffer
      vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
        config = config or {}
        config.focus_id = ctx.method
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
      --[[ vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true,
      }) ]]
      vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = true,
          signs = true,
          underline = true,
          update_in_insert = true,
          severity_sort = true,
        }
      )
      local border = {
        -- {"│' ", "FloatBorder"},
        -- {"▔", "FloatBorder"},
        -- {"🭽", "FloatBorder"},
        -- {"▕", "FloatBorder"},
        -- {"🭿", "FloatBorder"},
        -- {"▁", "FloatBorder"},
        -- {"🭼", "FloatBorder"},
        -- {"▏", "FloatBorder"}, 
        { "┌", "FloatBorder" },
        { "─", "FloatBorder" },
        { "┐", "FloatBorder" },
        { "│", "FloatBorder" },
        { "┘", "FloatBorder" },
        { "─", "FloatBorder" },
        { "└", "FloatBorder" },
        { "│", "FloatBorder" },
      }
      -- LSP settings (for overriding per client)
      vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
      vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border })
    end
  },
}
