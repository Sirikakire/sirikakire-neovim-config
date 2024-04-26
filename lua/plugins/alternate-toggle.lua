return {
  "rmagatti/alternate-toggler",
  keys = require("keymap").alternate_toggle_keymaps,
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
