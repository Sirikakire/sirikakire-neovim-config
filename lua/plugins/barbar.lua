return {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      --'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        insert_at_start = false,
        vim.keymap.set('n', '<A-,>', ':BufferPrevious<CR>'),
        vim.keymap.set('n', '<A-.>', ':BufferNext<CR>'),
        vim.keymap.set('n', '<A-c>', ':BufferClose')
    },
    version = '^1.0.0'
}
