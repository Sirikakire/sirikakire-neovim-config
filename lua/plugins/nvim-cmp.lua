return {
  { "tzachar/cmp-tabnine", build = "./install.sh", event = "InsertEnter" },
  { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
  { "hrsh7th/cmp-path", event = { "InsertEnter", "CmdlineEnter" } },
  { "hrsh7th/cmp-cmdline", event = { "InsertEnter", "CmdlineEnter" } },
  { "hrsh7th/cmp-buffer", event = { "InsertEnter", "CmdlineEnter" } },
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
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
              buffer = "[Buffer]"
            })[entry.source.name]
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
              end
            }
          }
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
        sources = cmp.config.sources( {
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
    end,
  },
}
