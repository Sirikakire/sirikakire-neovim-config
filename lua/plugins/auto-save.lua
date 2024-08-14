return {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle",
  event = { "InsertLeave", "TextChanged" },
  config = function ()
    require("auto-save").setup({
      enabled = true,
      execution_message = {
        enabled = true,
        message = function()
          return ("AutoSave: The file has been written and saved!")
        end,
        dim = 0.18,
        cleaning_interval = 1000,
      },
      trigger_events = {
        immediate_save = { "BufLeave", "FocusLost" },
        defer_save = { "InsertLeave", "TextChanged" },
        cancel_defered_save = { "InsertEnter" },
      },
      write_all_buffers = false,
      noautocmd = false,
      lockmarks = false,
      debounce_delay = 2500,
      debug = false,
    })
  end
}
