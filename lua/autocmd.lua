-- NOTE: Setup autocmd and highlight
vim.cmd('autocmd FileType ruby setlocal indentkeys-=.') -- NOTE:  Disable auto indent for ruby
vim.cmd('autocmd BufNewFile,BufRead,BufEnter *.jbuilder set ft=ruby') -- NOTE:  Set filetype for jbuilder as ruby filetype
vim.cmd('autocmd BufEnter * set formatoptions-=cro') -- NOTE:  Disable auto comment on new line

-- NOTE: Setup autocmd for better yank UI
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function ()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 200
    })
  end
})

local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
vim.api.nvim_create_autocmd("User", {
  pattern = "NvimTreeSetup",
  callback = function()
    local events = require("nvim-tree.api").events
    events.subscribe(events.Event.NodeRenamed, function(data)
      if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
        data = data
        Snacks.rename.on_rename_file(data.old_name, data.new_name)
      end
    end)
  end,
})
-- vim.ui_attach(
--   vim.api.nvim_create_namespace("noice"),
--   { ext_messages = true, ext_cmdline = false, ext_popupmenu = false },
--   function (event, kind, content, syntax)
--     if event == "msg_show" then
--       if kind == "return_prompt" then
--         vim.api.nvim_input("<cr>")
--       end
--       vim.notify(content[1][2], "INFO")
--     end
--
--     if event == "cmdline_show" then
--       print(kind[1][2])
--       vim.cmd.redraw()
--     end
--
--     if event == "cmdline_hide" then
--       print("")
--     end
--
--     return true
--   end
-- )
