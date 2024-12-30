return {
  -- "hrsh7th/nvim-cmp",
  -- event = "InsertEnter",
  -- dependencies = {
  --   { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
  --   { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
  --   { "hrsh7th/cmp-path", event = { "InsertEnter", "CmdlineEnter" } },
  --   { "hrsh7th/cmp-nvim-lsp-signature-help", event = "InsertEnter" },
  --   { "hrsh7th/cmp-cmdline", event = { "InsertEnter", "CmdlineEnter" } },
  --   { "hrsh7th/cmp-buffer", event = { "InsertEnter", "CmdlineEnter" } },
  --   {
  --     "L3MON4D3/LuaSnip",
  --     dependencies = { "rafamadriz/friendly-snippets" },
  --     event = "InsertEnter",
  --     opts = { updateevents = "TextChanged,TextChangedI" },
  --     config = function(_, opts)
  --       require("luasnip").config.set_config(opts)
  --       require("luasnip.loaders.from_vscode").lazy_load { exclude = vim.g.vscode_snippets_exclude or {} }
  --       require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }
  --       -- snipmate format
  --       require("luasnip.loaders.from_snipmate").load()
  --       require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }
  --       -- lua format
  --       require("luasnip.loaders.from_lua").load()
  --       require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }
  --       vim.api.nvim_create_autocmd("InsertLeave", {
  --         callback = function()
  --           if
  --             require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
  --             and not require("luasnip").session.jump_active
  --           then
  --             require("luasnip").unlink_current()
  --           end
  --         end,
  --       })
  --     end,
  --   },
  -- },
  -- opts = function ()
  --   local cmp = require("cmp")
  --   local border = require("utils").border
  --   local mapping = {
  --     ["<Tab>"] = cmp.mapping({
  --       i = cmp.config.disable,
  --       c = cmp.config.disable,
  --       s = cmp.config.disable
  --     }),
  --     ["<S-Tab>"] = cmp.mapping({
  --       i = cmp.config.disable,
  --       c = cmp.config.disable,
  --       s = cmp.config.disable
  --     }),
  --     ["<C-n>"] = cmp.mapping({
  --       i = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --       c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --       s = cmp.config.disable
  --     }),
  --     ["<C-p>"] = cmp.mapping({
  --       i = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --       c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --       s = cmp.config.disable
  --     }),
  --     ["<C-d>"] = cmp.mapping({
  --       i = cmp.mapping.scroll_docs(4),
  --       c = cmp.mapping.scroll_docs(4),
  --       s = cmp.mapping.scroll_docs(4)
  --     }),
  --     ["<C-u>"] = cmp.mapping({
  --       i = cmp.mapping.scroll_docs(-4),
  --       c = cmp.mapping.scroll_docs(-4),
  --       s = cmp.mapping.scroll_docs(-4)
  --     }),
  --     ["<C-e>"] = cmp.mapping({
  --       i = cmp.mapping.abort(),
  --       c = cmp.mapping.abort(),
  --       s = cmp.config.disable
  --     }),
  --     ["<C-a>"] = cmp.mapping({
  --       i = cmp.mapping.complete(),
  --       c = cmp.mapping.complete(),
  --       s = cmp.config.disable
  --     }),
  --     ["<CR>"] = cmp.mapping({
  --       i = cmp.mapping.confirm({ select = true }),
  --       c = cmp.mapping.confirm({ select = true }),
  --       s = cmp.mapping.disable
  --     })
  --     -- ["<CR>"] = cmp.mapping({
  --     --   i = function(fallback)
  --     --     if cmp.visible() and cmp.get_active_entry() then
  --     --       cmp.confirm()
  --     --     else fallback() end
  --     --   end,
  --     --   s = function(fallback)
  --     --     if cmp.visible() and cmp.get_active_entry() then
  --     --       cmp.confirm()
  --     --     else fallback() end
  --     --   end,
  --     --   c = function(fallback)
  --     --     if cmp.visible() and cmp.get_active_entry() then
  --     --       cmp.confirm()
  --     --     else fallback() end
  --     --   end,
  --     -- }),
  --   }
  --   -- NOTE:`:` cmdline setup.
  --   cmp.setup.cmdline(":", {
  --     mapping = cmp.mapping.preset.cmdline(mapping),
  --     sources = cmp.config.sources({
  --       { name = "path" } ,
  --       {
  --         name = "cmdline",
  --         option = {
  --           ignore_cmds = { "Man", "!" },
  --         },
  --       }
  --     }),
  --     matching = { disallow_symbol_nonprefix_matching = false }
  --   })
  --   return {
  --     completion = { completeopt = vim.opt.completeopt._value },
  --     window = {
  --       completion = {
  --         border = border,
  --         winhighlight = "Normal:NormalFloat,CursorLine:PmenuSel,Search:None",
  --       },
  --       documentation = {
  --         border = border,
  --         winhighlight = "Normal:NormalFloat,CursorLine:PmenuSel,Search:None",
  --       }
  --     },
  --     formatting = {
  --       -- fields = { "kind", "abbr", "menu" },
  --       format = function(entry, vim_item)
  --         -- vim_item.menu = ({
  --         --   nvim_lsp = "[LSP]",
  --         --   luasnip = "[LuaSnip]",
  --         --   cmp_tabnine = "[TabNine]",
  --         --   cmdline = "[CMDLine]",
  --         --   path = "[Path]",
  --         --   buffer = "[Buffer]"
  --         -- })[entry.source.name]
  --         vim_item.kind = string.format("%s  %s", require("utils").nv_chad_icons[vim_item.kind], vim_item.kind)
  --         return vim_item
  --       end,
  --     },
  --     snippet = {
  --       expand = function(args)
  --         require("luasnip").lsp_expand(args.body)
  --       end,
  --     },
  --     mapping = cmp.mapping.preset.insert(mapping),
  --     performance = {
  --       max_view_entries = 13
  --     },
  --     sources = cmp.config.sources({
  --       { name = "nvim_lsp" },
  --       { name = "luasnip" },
  --       { name = 'nvim_lsp_signature_help' },
  --       { name = "path" },
  --       {
  --         name = "buffer",
  --         option = {
  --           get_bufnrs = function()
  --             local bufs = {}
  --             for _, win in ipairs(vim.api.nvim_list_wins()) do
  --               bufs[vim.api.nvim_win_get_buf(win)] = true
  --             end
  --             return vim.tbl_keys(bufs)
  --           end
  --         }
  --       }
  --     }),
  --   }
  -- end,
  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {},
  },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
      { "hrsh7th/cmp-cmdline", event = { "InsertEnter", "CmdlineEnter" } },
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
    version = '*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = {
        preset = 'none',
        ['<CR>'] = { 'select_and_accept', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        ['<C-d>'] = { 'scroll_documentation_down' },
        ['<C-u>'] = { 'scroll_documentation_up' },
      },
      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
        -- kind_icons = require("utils").nv_chad_icons,
      },
      completion = {
        trigger = {
          prefetch_on_insert = false,
          show_in_snippet = true,
          show_on_keyword = true,
          show_on_trigger_character = true,
          show_on_insert_on_trigger_character = true,
          show_on_accept_on_trigger_character = true,
          show_on_x_blocked_trigger_characters = { "'", '"', '(' },
        },
        accept = {
          create_undo_point = true,
          auto_brackets = {
            enabled = true
          },
        },
        menu = {
          cmdline_position = function()
            if vim.g.ui_cmdline_pos ~= nil then
              local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
              return { pos[1] - 1, pos[2] }
            end
            local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
            return { vim.o.lines - height, 0 }
          end,
          border = require("utils").border,
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          draw = {
            padding = 1,
            gap = 2,
            treesitter = {
              'lsp',
              'luasnip',
              'snippets',
              'path',
              'buffer',
              'cmdline'
            },
            columns = {
              { 'kind_icon', 'kind' },
              { 'label', 'label_description', 'source_name', gap = 1 }
            },
            components = {
              source_name = {
                -- width = { max = 30 },
                text = function(ctx) return "["..ctx.source_name.."]" end,
                highlight = 'BlinkCmpSource',
              },
              kind_icon = {
                text = function(ctx)
                  local kind_icon = require("utils").nv_chad_icons[ctx.kind] .. "  "
                  return kind_icon
                end,
                -- Optionally, you may also use the highlights from mini.icons
                -- highlight = function(ctx)
                --   local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                --   return hl
                -- end,
              }
            }
          }
        },
        documentation = {
          auto_show = true,
          treesitter_highlighting = true,
          auto_show_delay_ms = 200,
          window = {
            border = require("utils").border,
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          },
        },
        ghost_text = { enabled = false },
        list = {
          max_items = 20,
          selection = function(ctx)
            -- return ctx.mode == 'cmdline' and 'auto_insert' or 'preselect'
            return "preselect"
          end
        }
      },
      signature = {
        enabled = true,
        window = {
          treesitter_highlighting = true,
          border = require("utils").border,
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        }
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      snippets = {
        expand = function(snippet)
          require('luasnip').lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require('luasnip').jumpable(filter.direction)
          end
          return require('luasnip').in_snippet()
        end,
        jump = function(direction)
          require('luasnip').jump(direction)
        end,
      },
      sources = {
        default = {
          'lsp',
          'luasnip',
          'snippets',
          'path',
          'buffer'
        },
        providers = {
          lsp = { name = "LSP" },
          luasnip = { name = "luasnip" },
          snippets = { name = "snippets" },
          buffer = { name = "buffer" },
          cmp_cmdline = {
            name = "cmdline",
            module = "blink.compat.source",
          },
        },
        cmdline = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == '/' or type == '?' then return { 'buffer' } end
          -- Commands
          if type == ':' then return { 'cmp_cmdline', 'path' } end
          return {}
        end,
      },
    },
    opts_extend = { "sources.default" }
  }
}
