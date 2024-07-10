local K = {}

K.disable_keymap_for_filetype = function (filetype, keymaps)
  vim.api.nvim_create_autocmd({ "BufEnter",  "BufNew" }, {
    callback = function()
      if filetype == nil then
        for _key, keymap in pairs(keymaps) do
          vim.keymap.set("n", keymap, "",
            { desc = "This keymap does nothing, I'm remapping it because I usually hit this keymap by mistake" }
          )
        end
        return
      end

      for _key, keymap in pairs(keymaps) do
        if vim.bo.filetype == filetype then
          vim.keymap.set("n", keymap, "",
            { desc = "This keymap does nothing, I'm remapping it because I usually hit this keymap by mistake" }
          )
        else
          vim.cmd("silent! unmap " .. keymap)
        end
      end
    end
  })
end

-- NOTE: Setup custom keymap
K.setup_custom_keymap = function()
  -- NOTE: Useless keymap to not hit by mistake
  K.disable_keymap_for_filetype(nil, { "<C-z>", "K", "<C-b>", "q" })
  K.disable_keymap_for_filetype("toggleterm", { "<C-t>" })

  -- NOTE: Rest of the custom keymaps
  -- vim.keymap.set("n", "<A-h>", "<cmd>bprevious<CR>", { desc = "Navigate to the previous buffer" })
  -- vim.keymap.set("n", "<A-l>", "<cmd>bnext<CR>", { desc = "Navigate to the next buffer" })
  -- vim.keymap.set("n", "<A-c>",
  --   function()
  --     if not vim.fn.bufnr() then return end
  --
  --     local buffer_id = vim.fn.bufnr()
  --     vim.cmd("bprevious")
  --     vim.cmd("bdelete " .. buffer_id)
  --   end,
  --   { desc = "Delete current buffer and then navigate to the previous one" }
  -- )
  -- vim.keymap.set("n", "<A-C>",
  --   function()
  --     if not vim.fn.bufnr() then return end
  --
  --     local buffer_id = vim.fn.bufnr()
  --     vim.cmd("bnext")
  --     vim.cmd("bdelete " .. buffer_id)
  --   end,
  --   { desc = "Delete current buffer and then navigate to the next one" }
  -- )
  vim.keymap.set("n", "<C-o>", "a<CR><esc>", { desc = "Go down by one line" })
  vim.keymap.set("n", "<C-a>", "gg<S-V><S-G>", { desc = "Select all" })
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
  vim.keymap.set("n", "<leader>gd", "<cmd>%bd!|e#<CR>", { desc = "Global delete all buffer" })
  vim.keymap.set("n", "<leader>ow", "<cmd>lua vim.opt.wrap = not vim.opt.wrap._value<CR>", { desc = "Toggle line wrap" })
  vim.keymap.set("n", "<leader>ln", "<cmd>Lazy<CR>", { desc = "Open Lazy.nvim" })

  -- NOTE: Setup keymap if neovide is enabled
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
    vim.keymap.set("n", "<leader>of", "<cmd>lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen<CR>", {
      desc = "Toggle full screen mode"
    })

    vim.keymap.set('n', '<C-v>', '"+P')             -- Paste normal mode
    vim.keymap.set('v', '<C-v>', '"+P')             -- Paste visual mode
    vim.keymap.set('c', '<C-v>', '<C-r><C-o>+')     -- Paste command mode
    vim.keymap.set('i', '<c-v>', '<esc>"+pli')      -- paste insert mode
    vim.keymap.set('t', '<c-v>', '<C-\\><C-n>"+pi') -- paste terminal mode
  end
end

-- NOTE: Setup keymap for Mason nvim
K.mason_keymaps = {
  { "<leader>lm", "<cmd>Mason<CR>", desc = "Open Mason" }
 }
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

  opts.desc = "Buffer global format"
  vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
end

-- NOTE: Setup keymap for flash
K.flash_keymaps = {
  { "f",     mode = { "n", "x", "o" }, function() require("flash").jump() end,   desc = "Flash" },
  { "<c-f>", mode = { "c" },           function() require("flash").toggle() end, desc = "Toggle Flash Search" },
}

-- NOTE: Setup keymap for nvim-notify
K.notify_keymaps = {
  { "<leader>hn", "<cmd>lua require('notify').notify('Health check vim notify', 'info', { title = 'Health check' })<CR>", desc = "Health check vim notify" }
}

-- NOTE: Setup keymap for telescope
K.telescope_keymaps = {
  { "<leader>fa", "<cmd>lua require('telescope.builtin').autocommands()<CR>",                desc = "List all auto commands" },
  { "<leader>fh", "<cmd>lua require('telescope.builtin').highlights()<CR>",                  desc = "List all highlights" },
  { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>", desc = "Find files" },
  { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>",                   desc = "Live grep" },
  { "<leader>fd", "<cmd>lua require('telescope.builtin').diagnostics()<CR>",                 desc = "Open workspace diagnostics" },
  { "<leader>fc", "<cmd>lua require('telescope.builtin').git_bcommits()<CR>",                desc = "Open buffer git commit list" },
  { "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>",              desc = "Open references" },
}


-- NOTE: Setup keymap for gitsigns
K.gitsigns_keymaps = {
  { "<leader>hu", function() require("gitsigns").undo_stage_hunk() end,           desc = "Undo stage hunk" },
  { "<leader>hb", function() require("gitsigns").preview_hunk() end,              desc = "Preview hunk" },
  { "<leader>hp", function() require("gitsigns").blame_line({ full = true }) end, desc = "Preview git blame" },
  { "<leader>hD", function() require("gitsigns").diffthis("~") end,               desc = "Preview git different" }
}

-- NOTE: Setup keymap of barbar
K.barbar_keymaps = {
  { "<A-h>", "<cmd>BufferPrevious<CR>",     desc = "Navigate to the previous buffer" },
  { "<A-l>", "<cmd>BufferNext<CR>",         desc = "Navigate to the next buffer" },
  { "<A-H>", "<cmd>BufferMovePrevious<CR>", desc = "Move the buffer to the previous" },
  { "<A-L>", "<cmd>BufferMoveNext<CR>",     desc = "Move the buffer to the next" },
  { "<A-c>", "<cmd>BufferClose<CR>",        desc = "Delete current buffer and then navigate to the previous one" },
}

-- NOTE: Setup keymap of bufferline
K.bufferline_keymaps = {
  { "<A-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Navigate to the previous buffer" },
  { "<A-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Navigate to the next buffer" },
  { "<A-H>", "<cmd>BufferLineMovePrev<CR>",  desc = "Move the buffer to the previous" },
  { "<A-L>", "<cmd>BufferLineMoveNext<CR>",  desc = "Move the buffer to the next" },
  {
    "<A-c>",
    function()
      if not vim.fn.bufnr() then return end

      local buffer_id = vim.fn.bufnr()
      vim.cmd("BufferLineCyclePrev")
      vim.cmd("bdelete " .. buffer_id)
    end,
    desc = "Delete current buffer and then navigate to the previous one"
  },
  {
    "<A-C>",
    function()
      if not vim.fn.bufnr() then return end

      local buffer_id = vim.fn.bufnr()
      vim.cmd("BufferLineCycleNext")
      vim.cmd("bdelete " .. buffer_id)
    end,
    desc = "Delete current buffer and then navigate to the next one"
  },
}

-- NOTE: Setup keymap for copilot chat
K.copilot_chat_keymaps = {
  { "<leader>cct", "<cmd>CopilotChatToggle<CR>",   desc = "Open copilot chat" },
  { "<leader>ccr", "<cmd>CopilotChatReset<CR>",    desc = "Open copilot chat reset" },
  { "<leader>cce", "<cmd>CopilotChatExplain<CR>",  mode = { 'n', 'v' },             desc = "Open copilot chat to explain" },
  { "<leader>ccf", "<cmd>CopilotChatFix<CR>",      mode = { 'n', 'v' },             desc = "Open copilot chat to fix" },
  { "<leader>cco", "<cmd>CopilotChatOptimize<CR>", mode = { 'n', 'v' },             desc = "Open copilot chat to optimize" },
  { "<leader>ccd", "<cmd>CopilotChatDocs<CR>",     mode = { 'n', 'v' },             desc = "Open copilot chat to generate docs" },
  {
    "<leader>ccq",
    function()
      local input = vim.fn.input("Copilot  : ")
      if input == "" then return end

      require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
    end,
    desc = "Open copilot chat with input",
  }
}

-- NOTE: Setup keymap for toggle_term
K.toggle_term_keymaps = {
  { "<leader>ts", "<cmd>TermSelect<CR>", desc = "Open terminal selection" },
  { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Open terminal" },
  {
    "<leader>ti",
    function()
      local user_input = vim.fn.input("Enter terminal number  : ")

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

-- NOTE: Setup keymap for lazygit
K.lazygit_keymaps = {
  { "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" }
}

-- NOTE: Setup keymap for nvim tree
K.nvimtree_keymaps = {
  { "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "Open nvim tree" }
}

return K
