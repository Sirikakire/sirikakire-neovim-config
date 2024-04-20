local K = {}

-- Non leader keymap
vim.keymap.set("n", "<C-o>", "a<CR><esc>")
vim.keymap.set("n", "<C-z>", "")
vim.keymap.set("n", "<C-a>", "gg<S-V><S-G>")
vim.keymap.set("n", "<C-b>", ":Neotree . focus<CR>")
vim.keymap.set("n", "<A-9>", "<C-w>-")
vim.keymap.set("n", "<A-0>", "<C-w>+")
vim.keymap.set("n", "<A-7>", "<C-w><")
vim.keymap.set("n", "<A-8>", "<C-w>>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("t", "<C-t>", "<C-\\><C-n>")
vim.keymap.set("n", "<A-c>", function()
  local buffer_id = vim.fn.bufnr()

  if buffer_id then
    vim.cmd(":BufferLineCyclePrev")
    vim.cmd(":bdelete "..buffer_id)
  end
end)
vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<A-H>", ":BufferLineMovePrev<CR>")
vim.keymap.set("n", "<A-L>", ":BufferLineMoveNext<CR>")

-- Leader keymap
local wk = require("which-key")

-- Keymap for only normal mode
wk.register({
	["<leader>gd"] = { ":%bd|e#<cr>", "Global delete all buffer" },
	["<leader>gf"] = { vim.lsp.buf.format, "Buffer global format" },
	["<leader>hn"] = { ":lua require('notify').notify('Health check vim notify')<CR>", "Health check vim notify" },
	["<leader>hl"] = { ":nohlsearch<CR>", "Clear search highlight" },
	["<leader>at"] = { ':lua require("alternate-toggler").toggleAlternate()<CR>', "Toggle alternate" },
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
	["<leader>cp"] = { ":Copilot panel<CR>", "Open copilot panel" },
	["<leader>fa"] = { ":lua require('telescope.builtin').autocommands()<CR>", "List all auto commands" },
	["<leader>fh"] = { ":lua require('telescope.builtin').highlights()<CR>", "List all highlights" },
	["<leader>ff"] = { ":lua require('telescope.builtin').find_files({ hidden = true })<CR>", "Find files" },
	["<leader>fg"] = { ":lua require('telescope.builtin').live_grep({ hidden = true })<CR>", "Live grep" },
	["<leader>fd"] = { ":lua require('telescope.builtin').diagnostics()<CR>", "Open workspace diagnostics" },
	["<leader>fp"] = { ":lua require('telescope.builtin').git_bcommits()<CR>", "Open buffer git commit list" },
	["<leader>fr"] = { ":lua require('telescope.builtin').lsp_references()<CR>", "Open references" },
	["<leader>ts"] = { ":TermSelect<CR>", "Open terminal selection" },
	["<leader>tt"] = { ":ToggleTerm<CR>", "Open terminal" },
	["<leader>ti"] = {
		function()
			local user_input = vim.fn.input("Enter terminal number: ")

			if user_input == "" then
				return
			end

			if "number" ~= type(tonumber(user_input)) then
				vim.notify("The input must be a number!", "warn")
				return
			end

			vim.cmd(user_input .. "ToggleTerm<CR>")
		end,
		"Open or create terminal by number",
	},
}, { mode = { "n" } })

-- Setup keymap for LSP
K.setup = function(opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<C-]>", ":lua require('telescope.builtin').lsp_definitions()<CR>", opts)

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

return K
