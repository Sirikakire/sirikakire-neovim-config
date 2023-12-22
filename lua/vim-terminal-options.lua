local function navigateToTerminal()
    local currentBufNr = vim.api.nvim_get_current_buf()
    local termBufNr = nil

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then
            termBufNr = buf
            break
        end
    end

    if termBufNr and currentBufNr == termBufNr then
        vim.api.nvim_command('BufferClose!')
    elseif termBufNr then
        vim.api.nvim_command('buffer ' .. termBufNr)
    else
        vim.api.nvim_command("term")
    end
end
vim.keymap.set('n', '<leader>t', function() navigateToTerminal() end)
