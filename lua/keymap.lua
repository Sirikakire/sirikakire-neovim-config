local K = {}

K.setup_custom_keymap = function()
  -- NOTE: Useless keymap to not hit by mistake
  vim.keymap.set("n", "<C-z>", "", { desc = "This keymap do nothing, I remapping it because I usually hit this keymap by mistake" })
  vim.keymap.set("n", "K", "", { desc = "This keymap do nothing, I remapping it because I usually hit this keymap by mistake" })
  vim.keymap.set("n", "<C-b>", "", { desc = "This keymap do nothing, I remapping it because I usually hit this keymap by mistake" })

  vim.keymap.set("n", "<C-o>", "a<CR><esc>", { desc = "Go down by one line" })
  vim.keymap.set("n", "<C-a>", "gg<S-V><S-G>", { desc = "Go to visual line mode and select all" })
  vim.keymap.set("n", "<A-9>", "<C-w>-", { desc = "Decrease window height" })
  vim.keymap.set("n", "<A-0>", "<C-w>+", { desc = "Increase window height" })
  vim.keymap.set("n", "<A-7>", "<C-w><", { desc = "Decrease window width" })
  vim.keymap.set("n", "<A-8>", "<C-w>>", { desc = "Increase window width" })
  vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to the left window" })
  vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to the bottom window" })
  vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to the above window" })
  vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to the right window" })
  vim.keymap.set({ "n", "v" }, "<C-p>", '"0p', { desc = "Paste the previous yank register" })
  vim.keymap.set("t", "<C-t>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
  vim.keymap.set("n", "<leader>hl", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
  vim.keymap.set("n", "<leader>gd", "cmd>%bd!|e#<cr", { desc = "Global delete all buffer" })
  vim.keymap.set("n", "<A-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Navigate to the previous buffer" })
  vim.keymap.set("n", "<A-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Navigate to the next buffer" })
  vim.keymap.set("n", "<A-H>", "<cmd>BufferLineMovePrev<CR>", { desc = "Move the buffer to the previous" })
  vim.keymap.set("n", "<A-L>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move the buffer to the next" })
  vim.keymap.set("n", "<A-c>", function()
    local buffer_id = vim.fn.bufnr()
    if buffer_id then
      vim.cmd("BufferLineCyclePrev")
      vim.cmd("bdelete "..buffer_id)
    end
  end, { desc = "Delete current buffer and then navigate to the previous one" })
  vim.keymap.set("n", "<A-C>", function()
    local buffer_id = vim.fn.bufnr()
    if buffer_id then
      vim.cmd("BufferLineCycleNext")
      vim.cmd("bdelete "..buffer_id)
    end
  end, { desc = "Delete current buffer and then navigate to the next one" })
  if vim.g.neovide then
    vim.keymap.set("n", "<C-=>", "<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", {
      desc = "Increase scale factor"
    })
    vim.keymap.set("n", "<C-->", "<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", {
      desc = "Decrease scale factor"
    })
    vim.keymap.set("n", "<C-0>", "<cmd>lua vim.g.neovide_scale_factor = 1<CR>", {
      desc = "Reset scale factor"
    })
    vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen<CR>", {
      desc = "Toggle screen mode"
    })
  end
end

-- NOTE: Setup keymap for LSP
K.setup_lsp_keymap = function(opts)
  opts.desc = "Go to definition"
  vim.keymap.set("n", "<C-]>", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)

  opts.desc = "Open hover on cursor"
  vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)

  opts.desc = "Jump to next diagnostic"
  vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, opts)

  opts.desc = "Jump to previous diagnostic"
  vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev, opts)

  opts.desc = "Open float vim diagnostic"
  vim.keymap.set("n", "<leader>j", vim.diagnostic.open_float, opts)

  opts.desc = "Open code action"
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- NOTE Setup keymap for flash
K.flash_keymaps = {
    { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<c-f>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  }

-- NOTE: Setup keymap for nvim-lspconfig
K.nvim_lspconfig_keymaps = {
  { "<leader>gf", vim.lsp.buf.format, desc = "Buffer global format" }
}

-- NOTE: Setup keymap for nvim-notify
K.notify_keymaps = {
  { "<leader>hn", "<cmd>lua require('notify').notify('Health check vim notify')<CR>", desc = "Health check vim notify" }
}

-- NOTE: Setup keymap for telescope
K.telescope_keymaps = {
  { "<leader>fa", "<cmd>lua require('telescope.builtin').autocommands()<CR>", desc = "List all auto commands" },
  { "<leader>fh", "<cmd>lua require('telescope.builtin').highlights()<CR>", desc = "List all highlights" },
  { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>", desc = "Find files" },
  { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep({ hidden = true })<CR>", desc = "Live grep" },
  { "<leader>fd", "<cmd>lua require('telescope.builtin').diagnostics()<CR>", desc = "Open workspace diagnostics" },
  { "<leader>fb", "<cmd>lua require('telescope.builtin').git_bcommits()<CR>", desc = "Open buffer git commit list" },
  { "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", desc = "Open references" },
}


-- NOTE: Setup keymap for gitsigns
K.gitsigns_keymaps = {
  { "<leader>hu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo stage hunk" },
  { "<leader>hb", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
  { "<leader>hp", function() require("gitsigns").blame_line({ full = true }) end, desc = "Preview git blame" },
  { "<leader>hD", function() require("gitsigns").diffthis("~") end, desc = "Preview git different" }
}

-- NOTE: Setup keymap for copilot
K.copilot_keymaps = {
  { "<leader>cp", "<cmd>Copilot panel<CR>", desc = "Open copilot panel" }
}

-- NOTE: Setup keymap for toggle_term
K.toggle_term_keymaps = {
  { "<leader>ts", "<cmd>TermSelect<CR>", desc = "Open terminal selection" },
  { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Open terminal" },
  { "<leader>ti",
    function()
      local user_input = vim.fn.input("Enter terminal number: ")

      if user_input == "" then return end

      if "number" ~= type(tonumber(user_input)) then
        vim.notify("The input must be a number!", "warn")
        return
      end

      vim.cmd(user_input .. "ToggleTerm")
    end,
    desc = "Open or create terminal by number",
  },
}

-- NOTE: Setup keymap for alternate_toggle
K.alternate_toggle_keymaps = {
  { "<leader>at", '<cmd>lua require("alternate-toggler").toggleAlternate()<CR>', desc = "Toggle alternate" },
}

-- NOTE: Setup keymap for neotree
K.neotree_keymaps = {
  { "<leader>e", "<cmd>Neotree . focus<CR>", desc = "Open neotree" }
}

-- NOTE: Setup keymap for wildfire
K.wildfire_keymaps = {
  { "<CR>", "<cmd>lua require'wildfire'.init_selection()<CR>", desc = "Init wild fire selection" },
  { "<CR>", "<cmd>lua require'wildfire'.node_incremental()<CR>", mode = { "v" }, desc = "Increase wild fire selection" },
  { "<BS>", "<cmd>lua require'wildfire'.node_decremental()<CR>", mode = { "v" }, desc = "Decrease wild fire selection" }
}

return K
