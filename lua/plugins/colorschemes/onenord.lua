return vim.b.colorscheme ~= "onenord" and {} or {
  "rmehri01/onenord.nvim",
  priority = 100,
  config = function()
    require('onenord').setup({
      theme = "light",
      borders = true, -- Split window borders
      fade_nc = false, -- Fade non-current windows, making them more distinguishable
      -- Style that is applied to various groups: see `highlight-args` for options
      -- styles = {
        comments = "italic",
        strings = "NONE",
        keywords = "bold",
        functions = "bold",
        variables = "NONE",
        diagnostics = "underline",
      -- },
      disable = {
        background = false, -- Disable setting the background color
        float_background = false, -- Disable setting the background color for floating windows
        cursorline = false, -- Disable the cursorline
        eob_lines = true, -- Hide the end-of-buffer lines
      },
      -- Inverse highlight for different groups
      inverse = {
        match_paren = false,
      },
      custom_highlights = {}, -- Overwrite default highlight groups
      custom_colors = {}, -- Overwrite default colors
    })
    vim.cmd.colorscheme "onenord"
  end
}

