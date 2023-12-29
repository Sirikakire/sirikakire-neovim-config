return {
  { "rebelot/kanagawa.nvim",
    config = function()
      -- vim.cmd.colorscheme "kanagawa"
    end
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "nightfly"
    end
  },
  {
    "rmehri01/onenord.nvim",
    config = function()
      -- vim.cmd.colorscheme "onenord"
    end
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      --[[ require 'nordic' .load()
      vim.cmd.colorscheme("nordic") ]]
    end
  },
  {
    'AhmedAbdulrahman/aylin.vim', branch = '0.5-nvim',
    config = function()
      -- vim.cmd.colorscheme("aylin")
    end
  },
  {
    "EdenEast/nightfox.nvim",
    config = function ()
      vim.cmd.colorscheme("nightfox")
    end
  }
}
