return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup({
        theme = 'hyper',
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { icon = '󰊳 ', desc = 'Update', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              desc = 'Files',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              icon = ' ',
              desc = 'Sidebar',
              action = 'Neotree . focus right',
              key = 'n',
            }
          },
        },
      })        end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  }
}
