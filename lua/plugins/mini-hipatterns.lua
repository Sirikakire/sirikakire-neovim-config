return {
  "echasnovski/mini.hipatterns",
  event = { "BufRead", "BufEnter" },
  config = function()
    local hipatterns = require('mini.hipatterns')
    hipatterns.setup({
      highlighters = {
        -- Highlight standalone 'FIX', 'HACK', 'TODO', 'NOTE'
        fix = { pattern = '%f[%w]()FIX()%f[%W]', group = 'MiniHipatternsFixme' },
        hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
        todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
        note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
      delay = {
        -- How much to wait for update after every text change
        text_change = 1000,

        -- How much to wait for update after window scroll
        scroll = 50,
      },
    })
  end
}
