return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set({ "n", "v" }, "<leader>cp", ":Copilot panel<CR>")
  end
}
