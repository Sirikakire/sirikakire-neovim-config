local M = {}

vim.b.win_separator = true
vim.b.syn_all_border_color = false
vim.b.border_color = "#adead8"
vim.b.transparent_background = false
vim.b.syn_all_telescope_border = false

M.setup = function (params)
  if params.win_separator ~= nil then
    vim.b.win_separator = params.win_separator
  end

  if params.syn_all_border_color ~= nil then
    vim.b.syn_all_border_color = params.syn_all_border_color
  end

  if params.border_color ~= nil then
    vim.b.border_color = params.border_color
  end

  if params.transparent_background ~= nil then
    vim.b.transparent_background = params.transparent_background
  end

  if params.syn_all_telescope_border ~= nil then
    vim.b.syn_all_telescope_border = params.syn_all_telescope_border
  end
end

return M
