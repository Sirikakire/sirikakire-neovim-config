return {
  "rmagatti/alternate-toggler",
  event = "BufRead",
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
