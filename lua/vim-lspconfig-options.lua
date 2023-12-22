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

--[[local lsp_zero = require('lsp-zero')
lsp_zero.setup()
lsp_zero.cmp_action()
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)
]]--

-- Setup lsp zero for suggesstions
-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- luasnip setup
local luasnip = require 'luasnip'
local cmp = require('cmp')
cmp.setup {
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
    --[[['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }), ]]--
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
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }),
}
-- Setup Mason, Mason lsp config and Lsp config programming languages
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = lsp_servers,
   --[[ handlers = {
        lsp_zero.default_setup,
    },]]--
    automatic_installation = true
})
local lspconfig = require("lspconfig")
for i, lsp in ipairs(lsp_servers) do
    lspconfig[lsp].setup({
        capabilities = capabilities
    })
end
-- Setup keymap
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    end,
})
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
