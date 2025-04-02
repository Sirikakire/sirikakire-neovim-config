return {
  -- "hrsh7th/nvim-cmp",
  -- event = "InsertEnter",
  -- dependencies = {
  --   { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
  --   { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" }, { "hrsh7th/cmp-path", event = { "InsertEnter", "CmdlineEnter" } },
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
  --
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
    event = "InsertEnter",
    dependencies = {
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
    opts = {
      enabled = function ()
        local filetypes = {
          "toggleterm",
          "NvimTree",
          "Telescope",
          "TelescopePrompt",
          "Avante",
          "AvanteInput"
        }

        return not vim.tbl_contains(filetypes, vim.bo.filetype)
      end,
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
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
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
          auto_show = true,
          scrollbar = true,
          scrolloff = 2,
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
              { 'kind_icon' },
              { 'label', 'label_description', gap = 1 },
              -- { 'source_name' },
            },
            components = {
              source_name = {
                text = function(ctx) return ctx.source_name:gsub("^%l", string.upper) end,
                highlight = 'BlinkCmpSource',
              },
              kind_icon = {
                text = function(ctx)
                  local kind_icon = require("utils").nv_chad_icons[ctx.kind]
                  return kind_icon
                end,
              },
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
          selection = {
            preselect = true
          }
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
      snippets = {
        preset = 'luasnip',
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
      cmdline = {
        enabled = true,
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
        sources = function()
          local type = vim.fn.getcmdtype()
          if type == '/' or type == '?' then return { 'buffer' }              end
          if type == ':'                then return { 'cmdline', 'path' }     end
          return {}
        end,
        completion = {
          trigger = {
            show_on_blocked_trigger_characters = {},
            show_on_x_blocked_trigger_characters = nil, -- Inherits from top level `completion.trigger.show_on_blocked_trigger_characters` config when not set
          },
          list = {
            selection = {
              preselect = true,
            },
          },
          menu = {
            auto_show = true, -- Inherits from top level `completion.menu.auto_show` config when not set
            draw = {
              columns = {
                { 'kind_icon' },
                { 'label', 'label_description', gap = 1 },
                -- { 'source_name' },
              },
            },
          }
        }
      },
      sources = {
        default = {
          'lsp',
          'snippets',
          'path',
          'buffer',
        },
        providers = {
          lsp = { name = "LSP" },
          snippets = { name = "snippets" },
          path = { name = "path" },
          buffer = {
            name = "buffer",
            max_items = 10,
            opts = {
              get_bufnrs = function()
                local bufs = {}
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                  bufs[vim.api.nvim_win_get_buf(win)] = true
                end
                return vim.tbl_keys(bufs)
              end
            }
          },
        },
      },
    },
    opts_extend = { "sources.default" }
  }
}
