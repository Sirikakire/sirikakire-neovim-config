local options = {
  "tabstop=4",
  "shiftwidth=4"
}

for i, option in pairs(options) do
  vim.cmd("set "..option)
end
