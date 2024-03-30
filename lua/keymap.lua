local K = {}

-- Non leader keymap
vim.keymap.set('n', '<C-j>', "a<CR><esc>")
vim.keymap.set('n', '<C-o>', '')
vim.keymap.set('n', '<C-z>', '')
vim.keymap.set('n', '<C-a>', 'gg<S-V><S-G>')
vim.keymap.set('n', 'j', [[v:count?'j':'gj']], { noremap = true, expr = true })
vim.keymap.set('n', 'k', [[v:count?'k':'gk']], { noremap = true, expr = true })
vim.keymap.set('n', '<A-,>', ':BufferPrevious<CR>')
vim.keymap.set('n', '<A-.>', ':BufferNext<CR>')
vim.keymap.set('n', '<A-c>', ':BufferClose')
vim.keymap.set('n', '<C-b>', ':Neotree . focus<CR>')

-- Leader keymap
local wk = require("which-key")

-- Keymap for only normal mode
wk.register(
  {
    ["<leader>hl"] = { ':nohlsearch<CR>', 'Clear search hightlight' },
    ["<leader>at"] = { ':lua require("alternate-toggler").toggleAlternate()<CR>', 'Toggle alternate' },
    ["<leader>hu"] = { package.loaded.gitsigns.undo_stage_hunk, 'Undo stage hunk' },
    ["<leader>hb"] = { package.loaded.gitsigns.preview_hunk, 'Preview hunk' },
    ["<leader>hp"] = { function() package.loaded.gitsigns.blame_line{full=true} end, 'Preview git blame' },
    ["<leader>hD"] = { function() package.loaded.gitsigns.diffthis('~') end, 'Preview git different' },
    ["<leader>cp"] = { ':Copilot panel<CR>', 'Open copilot panel' },
    ["<leader>ff"] = { require('telescope.builtin').find_files, 'Find files' },
    ["<leader>fg"] = { require('telescope.builtin').live_grep, 'Live grep' },
    ["<leader>fd"] = { require('telescope.builtin').diagnostics, 'Open workspace diagnostics' },
    ["<leader>fp"] = { require('telescope.builtin').git_bcommits, 'Open buffer git commit list' },
    ["<leader>fr"] = { require('telescope.builtin').lsp_references, 'Open references' },
    ["<leader>ts"] = { ':TermSelect<CR>', 'Open terminal selection' },
    ["<leader>tt"] = { ':ToggleTerm<CR>', 'Open terminal' },
    ["<leader>ti"] = { function ()
      local user_input = vim.fn.input("Enter terminal number: ")

      if (user_input == "") then
        return
      end

      if ('number' ~= type(tonumber(user_input))) then
        vim.notify("The input must be a number!", "warn")
        return
      end

      vim.cmd(user_input.."ToggleTerm<CR>")
    end, 'Open or create terminal by number' },
  },
  { mode = { "n" } }
)

-- Setup keymap for LSP
local setup = function (opts)
  vim.keymap.set('n', 'K', ':Lspsaga hover_doc<CR>', opts)
  vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, opts)

  opts.mode = { "n" }
  wk.register(
    {
      ["<leader>n"] = { ':Lspsaga diagnostic_jump_next<CR>', 'Jump to next diagnostic' },
      ["<leader>p"] = { ':Lspsaga diagnostic_jump_prev<CR>', 'Jump to previous diagnostic' },
      ["<leader>e"] = { vim.diagnostic.open_float, 'Open float vim diagnostic' }
    },
    opts
  )
  opts.mode = { "n", "v" }
  wk.register(
    {
      ["<leader>ca"] = { ':Lspsaga code_action<CR>', 'Open code action' },
    },
    opts
  )
end

K.setup = setup
return K
