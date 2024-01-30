return {
  'VonHeikemen/fine-cmdline.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  config = function()
    require('fine-cmdline').setup({
      cmdline = {
        prompt = 'CMD: ',
        enable_keymaps = true,
        smart_history = true,
      },
      popup = {
        position = {
          row = '50%',
          col = '50%',
        },
        border = {
          style = 'single',
        },
        win_options = {
          winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
        },
      }
    })
  end
}
