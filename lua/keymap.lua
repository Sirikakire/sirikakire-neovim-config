local K = {}

-- NOTE: Non leader keymap
K.setup_keymap = function()
  vim.keymap.set("n", "<C-o>", "a<CR><esc>")
  vim.keymap.set("n", "<C-z>", "")
  vim.keymap.set("n", "<C-a>", "gg<S-V><S-G>")
  vim.keymap.set("n", "<A-9>", "<C-w>-")
  vim.keymap.set("n", "<A-0>", "<C-w>+")
  vim.keymap.set("n", "<A-7>", "<C-w><")
  vim.keymap.set("n", "<A-8>", "<C-w>>")
  vim.keymap.set("n", "<C-h>", "<C-w>h")
  vim.keymap.set("n", "<C-j>", "<C-w>j")
  vim.keymap.set("n", "<C-k>", "<C-w>k")
  vim.keymap.set("n", "<C-l>", "<C-w>l")
  vim.keymap.set("t", "<C-t>", "<C-\\><C-n>")

  -- NOTE: keymap for bufferline plugin
  vim.keymap.set("n", "<A-c>", function()
    local buffer_id = vim.fn.bufnr()

    if buffer_id then
      vim.cmd("<cmd>BufferLineCyclePrev")
      vim.cmd("<cmd>bdelete "..buffer_id)
    end
  end)

  vim.keymap.set("n", "<A-C>", function()
    local buffer_id = vim.fn.bufnr()

    if buffer_id then
      vim.cmd("<cmd>BufferLineCycleNext")
      vim.cmd("<cmd>bdelete "..buffer_id)
    end
  end)
  vim.keymap.set("n", "<A-h>", "<cmd>BufferLineCyclePrev<CR>")
  vim.keymap.set("n", "<A-l>", "<cmd>BufferLineCycleNext<CR>")
  vim.keymap.set("n", "<A-H>", "<cmd>BufferLineMovePrev<CR>")
  vim.keymap.set("n", "<A-L>", "<cmd>BufferLineMoveNext<CR>")

  -- NOTE: keymap for barbar plugin
  --[[ vim.keymap.set("n", "<A-c>", "<cmd>BufferClose<CR>")
  vim.keymap.set("n", "<A-h>", "<cmd>BufferPrevious<CR>")
  vim.keymap.set("n", "<A-l>", "<cmd>BufferNext<CR>")
  vim.keymap.set("n", "<A-H>", "<cmd>BufferMovePrevious<CR>")
  vim.keymap.set("n", "<A-L>", "<cmd>BufferMoveNext<CR>") ]]
end

K.setup_whichkey_keymap = function()
  local wk = require("which-key")

  wk.register({
    ["<leader>gd"] = { "<cmd>%bd|e#<cr>", "Global delete all buffer" },
    ["<leader>gf"] = { vim.lsp.buf.format, "Buffer global format" },
    ["<leader>hn"] = { "<cmd>lua require('notify').notify('Health check vim notify')<CR>", "Health check vim notify" },
    ["<leader>hl"] = { "<cmd>nohlsearch<CR>", "Clear search highlight" },
    ["<leader>hu"] = { package.loaded.gitsigns.undo_stage_hunk, "Undo stage hunk" },
    ["<leader>hb"] = { package.loaded.gitsigns.preview_hunk, "Preview hunk" },
    ["<leader>hp"] = {
      function()
        package.loaded.gitsigns.blame_line({ full = true })
      end,
      "Preview git blame",
    },
    ["<leader>hD"] = {
      function()
        package.loaded.gitsigns.diffthis("~")
      end,
      "Preview git different",
    },
    ["<leader>cp"] = { "<cmd>Copilot panel<CR>", "Open copilot panel" },
    ["<leader>fa"] = { "<cmd>lua require('telescope.builtin').autocommands()<CR>", "List all auto commands" },
    ["<leader>fh"] = { "<cmd>lua require('telescope.builtin').highlights()<CR>", "List all highlights" },
    ["<leader>ff"] = { "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>", "Find files" },
    ["<leader>fg"] = { "<cmd>lua require('telescope.builtin').live_grep({ hidden = true })<CR>", "Live grep" },
    ["<leader>fd"] = { "<cmd>lua require('telescope.builtin').diagnostics()<CR>", "Open workspace diagnostics" },
    ["<leader>fp"] = { "<cmd>lua require('telescope.builtin').git_bcommits()<CR>", "Open buffer git commit list" },
    ["<leader>fr"] = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", "Open references" },
  }, { mode = { "n" } })
end


-- NOTE: Setup keymap for LSP
K.setup_lsp_keymap = function(opts)
  local wk = require("which-key")
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<C-]>", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)

  opts.mode = { "n" }
  wk.register({
    ["<leader>n"] = { vim.diagnostic.goto_next, "Jump to next diagnostic" },
    ["<leader>p"] = { vim.diagnostic.goto_prev, "Jump to previous diagnostic" },
    ["<leader>e"] = { vim.diagnostic.open_float, "Open float vim diagnostic" },
  }, opts)

  opts.mode = { "n", "v" }
  wk.register({
    ["<leader>ca"] = { vim.lsp.buf.code_action, "Open code action" },
  }, opts)
end


-- NOTE: Lazy loading keymap
-- NOTE: Setup keymap for toggleterm
K.setup_toggle_term = {
  { "<leader>ts", "<cmd>TermSelect<CR>", "Open terminal selection" },
  { "<leader>tt", "<cmd>ToggleTerm<CR>", "Open terminal" },
  { "<leader>ti",
    function()
      local user_input = vim.fn.input("Enter terminal number: ")

      if user_input == "" then return end

      if "number" ~= type(tonumber(user_input)) then
        vim.notify("The input must be a number!", "warn")
        return
      end

      vim.cmd(user_input .. "ToggleTerm<CR>")
    end,
    "Open or create terminal by number",
  },
}

-- NOTE: Setup keymap for alternate_toggle
K.setup_alternate_toggle = {
  { "<leader>at", '<cmd>lua require("alternate-toggler").toggleAlternate()<CR>', "Toggle alternate" },
}

-- NOTE: Setup keymap for neotree
K.setup_neotree = {
  { "<C-b>", "<cmd>Neotree . focus<CR>", "Open neotree" }
}

-- NOTE: Setup keymap for wildfire
K.setup_wildfire = {
  { "<CR>", "<cmd>lua require'wildfire'.init_selection()<CR>", "Init wild fire selection" },
  { "<CR>", "<cmd>lua require'wildfire'.node_incremental()<CR>", mode = { "v" }, "Increase wild fire selection" },
  { "<BS>", "<cmd>lua require'wildfire'.node_decremental()<CR>", mode = { "v" }, "Decrease wild fire selection" }
}

return K
