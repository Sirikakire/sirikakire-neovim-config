-- Setup lsp zero for suggesstions
local lsp_zero = require('lsp-zero')
lsp_zero.setup()
lsp_zero.cmp_action()
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)
-- Setup lsp cmd for suggesstions
local cmp = require('cmp')
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
    })
})
-- Setup Mason, Mason lsp config and Lsp config programming languages
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
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
    },
    handlers = {
        lsp_zero.default_setup,
    },
    automatic_installation = true
})
local lsconfig = require("lspconfig")
lsconfig.tsserver.setup({})
lsconfig.lua_ls.setup({})
lsconfig.tailwindcss.setup({})
lsconfig.cssls.setup({})
lsconfig.bashls.setup({})
lsconfig.emmet_ls.setup({})
lsconfig.jsonls.setup({})
lsconfig.cssmodules_ls.setup({})
lsconfig.html.setup({})
lsconfig.angularls.setup({})
lsconfig.jdtls.setup({})
-- Setup keymap
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
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
