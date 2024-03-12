return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function ()
      vim.keymap.set("n", "<leader>ti", function ()
        local user_input = vim.fn.input("Enter terminal number: ")

        if (user_input == "") then
          return
        end

        if ('number' ~= type(tonumber(user_input))) then
          vim.notify("The input must be a number!", "warn")
          return
        end

        vim.cmd(user_input.."ToggleTerm<CR>")
      end)

      vim.keymap.set("n", "<leader>ts", ":TermSelect<CR>")
      vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>")
      require("toggleterm").setup({
        shade_terminals = false,
        persist_size = true,
        persist_mode = false,
        start_in_insert = false,
        direction = "float",
        auto_scroll = true,
        title_pos = "center",
        float_opts = {
          border = "single",
        },
      })
    end
  }
}
