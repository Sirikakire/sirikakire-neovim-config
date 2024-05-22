local U = {}

U.terminal_dark_palette = {
  "#737994", "#e78284", "#a6d189", "#e5c890",
  "#8caaee", "#f4b8e4", "#99d1db", "#c6d0f5",
  "#838ba7", "#e78284", "#a6d189", "#e5c890",
  "#8caaee", "#f4b8e4", "#99d1db", "#c6d0f5",
}

U.terminal_light_palette = {
  "#9ca0b0", "#d20f39", "#40a02b", "#df8e1d",
  "#1e66f5", "#ea76cb", "#04a5e5", "#4c4f69",
  "#8c8fa1", "#d20f39", "#40a02b", "#df8e1d",
  "#1e66f5", "#ea76cb", "#04a5e5", "#4c4f69",
}

U.icons = {
  -- default_icon = { icon = "󰈚", name = "Default" },
  -- c = { icon = "", name = "c" },
  -- css = { icon = "", name = "css" },
  -- dart = { icon = "", name = "dart" },
  -- deb = { icon = "", name = "deb" },
  -- Dockerfile = { icon = "", name = "Dockerfile" },
  -- html = { icon = "", name = "html" },
  -- jpeg = { icon = "󰉏", name = "jpeg" },
  -- jpg = { icon = "󰉏", name = "jpg" },
  -- js = { icon = "󰌞", name = "js" },
  -- kt = { icon = "󱈙", name = "kt" },
  -- lock = { icon = "󰌾", name = "lock" },
  -- lua = { icon = "", name = "lua" },
  -- mp3 = { icon = "󰎆", name = "mp3" },
  -- mp4 = { icon = "", name = "mp4" },
  -- out = { icon = "", name = "out" },
  -- png = { icon = "󰉏", name = "png" },
  -- py = { icon = "", name = "py" },
  -- ["robots.txt"] = { icon = "󰚩", name = "robots" },
  -- toml = { icon = "", name = "toml" },
  -- ts = { icon = "󰛦", name = "ts" },
  -- ttf = { icon = "", name = "TrueTypeFont" },
  -- rb = { icon = "", name = "rb" },
  -- rpm = { icon = "", name = "rpm" },
  -- vue = { icon = "󰡄", name = "vue" },
  -- woff = { icon = "", name = "WebOpenFontFormat" },
  -- woff2 = { icon = "", name = "WebOpenFontFormat2" },
  -- xz = { icon = "", name = "xz" },
  -- zip = { icon = "", name = "zip" },
  java = { icon = "", color = "#e46368", name = "Java" },
  [".gitignore"] = { icon = "", color = "#428850", name = "GitIgnore" },
  js = { icon = "󰌞", color = "#f7cd6d", name = "JavaScript" },
  json = { icon = "", color = "#f7cd6d", name = "JSON" },
  ts = { icon = "󰛦", color = "#87b2e2", name = "TypeScript" },
  html = { icon = "", color = "#de7558", name = "Html" },
  rb = { icon = "", color = "#ef757c", name = "Rb" },
  rake = { icon = "", color = "#ef757c", name = "Rake" },
  rakefile = { icon = "", color = "#ef757c", name = "RakeFile" },
  jbuilder = { icon = "", color = "#f7cd6d", name = "Jbuilder" },
  lua = { icon = "", color = "#5166f0", name = "Lua" },
}

U.sign_icons = {
  -- add = ' ',
  -- change = '󱗜 ',
  -- delete = '󰅗 ',
  -- topdelete = ' ',
  -- changedelete = '󰇽 ',
  -- untracked = ' ',
  add = '󰐗 ',
  change = '󰻂 ',
  delete = '󰅙 ',
  topdelete = '󰍶 ',
  changedelete = '󰟃 ',
  untracked = '󰐗 ',

  success = '󰄳 ',
  info = '󰋼 ',
  error = '󰅙 ',
  hint = '󰋗 ',
  warning = '󰀨 ',

  -- success_2 = '󰄳 ',
  warning_2 = ' ',
  -- info_2 = '󰋼 ',
  -- error_2 = '󰅙 ',
  -- hint_2 = '󰋗 ',
  warning_3 = '󰀨 ',

  -- info = '󰀧 ',
  -- warning = '󰬐 ',
  -- error = '󰅗 ',
  -- hint = '󰞋 ',
  -- success = ' ',
}

U.navic_icon = {
  File          = "󰈙 ",
  Module        = " ",
  Namespace     = "󰌗 ",
  Package       = " ",
  Class         = "󰌗 ",
  Method        = "󰆧 ",
  Property      = " ",
  Field         = " ",
  Constructor   = " ",
  Enum          = "󰕘 ",
  Folder        = "󰉋 ",
  Interface     = "󰕘 ",
  Snippet       = " ",
  Function      = "󰊕 ",
  Variable      = "󰆧 ",
  Constant      = "󰏿 ",
  String        = "󰀬 ",
  Number        = "󰎠 ",
  Text          = "󰉿 ",
  Keyword       = "󰌋 ",
  Boolean       = "◩ ",
  Copilot       = " ",
  Codeium       = " ",
  TabNine       = " ",
  Array         = "󰅪 ",
  Object        = "󰅩 ",
  Key           = "󰌋 ",
  Null          = "󰟢 ",
  EnumMember    = " ",
  Struct        = "󰌗 ",
  Event         = " ",
  Operator      = "󰆕 ",
  TypeParameter = "󰊄 ",
}

U.nv_chad_icons = {
  Namespace     = "󰌗 ",
  Text          = "󰉿 ",
  Method        = "󰆧 ",
  Function      = "󰆧 ",
  Constructor   = " ",
  Field         = "󰜢 ",
  Variable      = "󰀫 ",
  Class         = "󰠱 ",
  Interface     = " ",
  Module        = " ",
  Property      = "󰜢 ",
  Unit          = "󰑭 ",
  Value         = "󰎠 ",
  Enum          = " ",
  Keyword       = "󰌋 ",
  Snippet       = " ",
  Color         = "󰏘 ",
  File          = "󰈚 ",
  Reference     = "󰈇 ",
  Folder        = "󰉋 ",
  EnumMember    = " ",
  Constant      = "󰏿 ",
  Struct        = "󰙅 ",
  Event         = " ",
  Operator      = "󰆕 ",
  TypeParameter = "󰊄 ",
  Table         = " ",
  Object        = "󰅩 ",
  Tag           = " ",
  Array         = "[] ",
  Boolean       = " ",
  Number        = " ",
  Null          = "󰟢 ",
  String        = "󰉿 ",
  Calendar      = " ",
  Watch         = "󰥔 ",
  Package       = " ",
  Copilot       = " ",
  Codeium       = " ",
  TabNine       = " ",
}

U.local_icons = {
  Text          = "  ",
  Method        = "󰆧  ",
  Function      = "󰊕  ",
  Constructor   = "  ",
  Field         = "󰇽  ",
  Variable      = "󰂡  ",
  Class         = "󰠱  ",
  Interface     = "  ",
  Module        = "  ",
  Property      = "󰜢  ",
  Unit          = "  ",
  Value         = "󰎠  ",
  Enum          = "  ",
  Keyword       = "󰌋  ",
  Snippet       = "  ",
  Color         = "󰏘  ",
  File          = "󰈙  ",
  Reference     = "  ",
  Folder        = "󰉋  ",
  EnumMember    = "  ",
  Constant      = "󰏿  ",
  Array         = "[] ",
  Struct        = "  ",
  Event         = "  ",
  Operator      = "󰆕  ",
  TypeParameter = "󰅲  ",
  TabNine       = '󰂂  ',
  Copilot       = '  '
}

U.kind_icons = {
  Text          = '  ',
  Method        = '  ',
  Function      = '  ',
  Constructor   = '  ',
  Field         = '  ',
  Variable      = '  ',
  Class         = '  ',
  Interface     = '  ',
  Module        = '  ',
  Property      = '  ',
  Unit          = '  ',
  Value         = '  ',
  Enum          = '  ',
  Keyword       = '  ',
  Snippet       = '  ',
  Color         = '  ',
  File          = '  ',
  Reference     = '  ',
  Folder        = '  ',
  EnumMember    = '  ',
  Constant      = '  ',
  Struct        = '  ',
  Array         = "[] ",
  Event         = '  ',
  Operator      = '  ',
  TypeParameter = '  ',
  TabNine       = '󰂂  ',
  Copilot       = '  '
}

-- NOTE: Lsp server list
U.lsp_servers = {
  "tsserver",                        -- typescript
  "lua_ls",                          -- lua
  "cssls",                           -- css
  "cssmodules_ls",                   -- css modules
  "somesass_ls",                     -- Sass
  "bashls",                          -- bash
  "jsonls",                          -- json
  "tailwindcss",                     -- tailwindcss
  "emmet_ls",                        -- emmet
  "html",                            -- html
  "solargraph",                      -- ruby
  "dockerls",                        -- docker
  "docker_compose_language_service", -- docker-compose
  "angularls",                       -- angular
  "eslint",                          -- eslint
  "volar"                            -- vue
}

-- NOTE: Treesitter parser list
U.treesitter_parsers = {
  "lua",
  "javascript",
  "typescript",
  "json",
  "ruby",
  "html",
  "css",
  "scss",
  "angular",
  "bash",
  "dockerfile",
  "gitignore",
  "regex",
  "tsx",
  "vim",
  "vimdoc",
  "vue",
  "xml",
  "yaml",
  "markdown",
  "markdown_inline"
}

U.spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

U.border = vim.b.doc_border and {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
  -- { "╔", "FloatBorder" },
  -- { "═", "FloatBorder" },
  -- { "╗", "FloatBorder" },
  -- { "║", "FloatBorder" },
  -- { "╝", "FloatBorder" },
  -- { "═", "FloatBorder" },
  -- { "╚", "FloatBorder" },
  -- { "║", "FloatBorder" },
} or {
  { "", "" },
  { "", "" },
  { "", "" },
  { "", "" },
  { "", "" },
  { "", "" },
  { "", "" },
  { "", "" },
}

return U
