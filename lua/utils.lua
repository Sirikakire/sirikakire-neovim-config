local U = {}

U.local_icons = {
  Text = "  ",
  Method = "󰆧  ",
  Function = "󰊕  ",
  Constructor = "  ",
  Field = "󰇽  ",
  Variable = "󰂡  ",
  Class = "󰠱  ",
  Interface = "  ",
  Module = "  ",
  Property = "󰜢  ",
  Unit = "  ",
  Value = "󰎠  ",
  Enum = "  ",
  Keyword = "󰌋  ",
  Snippet = "  ",
  Color = "󰏘  ",
  File = "󰈙  ",
  Reference = "  ",
  Folder = "󰉋  ",
  EnumMember = "  ",
  Constant = "󰏿  ",
  Struct = "  ",
  Event = "  ",
  Operator = "󰆕  ",
  TypeParameter = "󰅲  ",
  TabNine = '󰂂  ',
  Copilot = '  '
}

U.kind_icons = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
  TabNine = '󰂂  ',
  Copilot = '  '
}

-- Lsp server list
U.lsp_servers = {
  "tsserver", -- typescript
  "lua_ls", -- lua
  "cssls", -- css
  "bashls", -- bash
  "jsonls", -- json
  "tailwindcss", -- tailwindcss
  "emmet_ls", -- emmet
  "cssmodules_ls", -- css modules
  "html", -- html
  -- "solargraph", -- ruby
  "dockerls", -- docker
  "volar", -- vue
  "docker_compose_language_service", -- docker-compose
  "angularls", -- angular
  "eslint"
}

U.null_ls_formatters = {
  "stylua",
  -- "rubocop",
  "prettierd",
  "codespell",
}

U.border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

-- U.border = {
--   { "", "" },
--   { "", "" },
--   { "", "" },
--   { "", "" },
--   { "", "" },
--   { "", "" },
--   { "", "" },
--   { "", "" },
-- }
return U
