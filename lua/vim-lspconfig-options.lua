local lsp_zero = require('lsp-zero')
lsp_zero.setup()
lsp_zero.cmp_action()
lsp_zero.extend_lspconfig()
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)
local cmp = require('cmp')
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-Space>'] = cmp.mapping.complete(),
    })
})
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
        require('lsp-zero').default_setup,
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
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    end,
})
