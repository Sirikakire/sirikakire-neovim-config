return {
  "rmagatti/alternate-toggler",
  keys = require("keymap").setup_alternate_toggle,
  config = function ()
    require("alternate-toggler").setup {
      alternates = {
        ["true"] = "false",
        ["True"] = "False",
        ["TRUE"] = "FALSE",
        ["Yes"] = "No",
        ["YES"] = "NO",
        ["1"] = "0",
        ["<"] = ">",
        ["<="] = ">=",
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        ['"'] = "'",
        ['""'] = "''",
        ["+"] = "-",
        ["==="] = "!=="
      }
    }
  end
}
