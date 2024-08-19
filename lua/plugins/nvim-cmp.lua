return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
      { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
      { "hrsh7th/cmp-path", event = { "InsertEnter", "CmdlineEnter" } },
      { "hrsh7th/cmp-cmdline", event = { "InsertEnter", "CmdlineEnter" } },
      { "hrsh7th/cmp-buffer", event = { "InsertEnter", "CmdlineEnter" } },
      {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        event = "InsertEnter",
        opts = { updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require("luasnip.loaders.from_vscode").lazy_load { exclude = vim.g.vscode_snippets_exclude or {} }
          require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }
          -- snipmate format
          require("luasnip.loaders.from_snipmate").load()
          require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }
          -- lua format
          require("luasnip.loaders.from_lua").load()
          require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }
          vim.api.nvim_create_autocmd("InsertLeave", {
            callback = function()
              if
                require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                and not require("luasnip").session.jump_active
              then
                require("luasnip").unlink_current()
              end
            end,
          })
        end,
      },
    },
    opts = function ()
      local cmp = require("cmp")
      local border = require("utils").border
      -- NOTE:`:` cmdline setup.
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
        sources = cmp.config.sources({
          { name = "path" } ,
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
      return {
        completion = {
          completeopt = "noselect, menu, menuone, noinsert, preview",
        },
        window = {
          completion = {
            border = border,
            winhighlight = "Normal:NormalFloat,CursorLine:PmenuSel,Search:None",
          },
          documentation = {
            border = border,
            winhighlight = "Normal:NormalFloat,CursorLine:PmenuSel,Search:None",
          }
        },
        formatting = {
          -- fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            -- vim_item.menu = ({
            --   nvim_lsp = "[LSP]",
            --   luasnip = "[LuaSnip]",
            --   cmp_tabnine = "[TabNine]",
            --   cmdline = "[CMDLine]",
            --   path = "[Path]",
            --   buffer = "[Buffer]"
            -- })[entry.source.name]
            vim_item.kind = string.format("%s  %s", require("utils").nv_chad_icons[vim_item.kind], vim_item.kind)
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
              else fallback() end
            end,
            s = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm()
              else fallback() end
            end,
            c = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm()
              else fallback() end
            end,
          }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
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
              end
            }
          }
        }),
      }
    end,
  },
}
