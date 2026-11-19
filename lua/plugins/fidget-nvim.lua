return {
  "j-hui/fidget.nvim",
  event = "VeryLazy",
  config = function()
    require("fidget").setup({
      progress = {
        poll_rate = 0,                -- How and when to poll for progress messages
        suppress_on_insert = true,   -- Suppress new messages while in insert mode
        ignore_done_already = false,  -- Ignore new tasks that are already complete
        ignore_empty_message = false, -- Ignore new tasks that don't contain a message
        clear_on_detach =             -- Clear notification group when LSP server detaches
          function(client_id)
            local client = vim.lsp.get_client_by_id(client_id)
            return client and client.name or nil
          end,
        notification_group =          -- How to get a progress message's notification group key
          function(msg) return msg.lsp_client.name end,
        ignore = {},                  -- List of LSP servers to ignore

        -- Options related to how LSP progress messages are displayed as notifications
        display = {
          render_limit = 16,          -- How many LSP messages to show at once
          done_ttl = 3,               -- How long a message should persist after completion
          done_icon = require("utils").sign_icons.success,            -- Icon shown when all LSP progress tasks are complete
          done_style = "Constant",    -- Highlight group for completed LSP tasks
          progress_ttl = math.huge,   -- How long a message should persist when in progress
          progress_icon = { "dots" },             -- Icon shown when LSP progress tasks are in progress
          -- progress_icon = { pattern = "clock", period = 2 },             -- Icon shown when LSP progress tasks are in progress
          progress_style =            -- Highlight group for in-progress LSP tasks
            "WarningMsg",
          group_style = "Title",      -- Highlight group for group name (LSP server name)
          icon_style = "Question",    -- Highlight group for group icons
          priority = 30,              -- Ordering priority for LSP notification group
          skip_history = true,        -- Whether progress notifications should be omitted from history
          format_message =            -- How to format a progress message
            require("fidget.progress.display").default_format_message,
          format_annote =             -- How to format a progress annotation
            function(msg) return msg.title end,
          format_group_name =         -- How to format a progress notification group's name
            function(group) return tostring(group) end,
          overrides = {               -- Override options from the default notification config
            rust_analyzer = { name = "rust-analyzer" },
          },
        },

        -- Options related to Neovim's built-in LSP client
        lsp = {
          progress_ringbuf_size = 0,  -- Configure the nvim's LSP progress ring buffer size
          log_handler = false,        -- Log `$/progress` handler invocations (for debugging)
        },
      },

      -- Options related to notification subsystem
      notification = {
        poll_rate = 10,               -- How frequently to update and render notifications
        filter = vim.log.levels.TRACE, -- Minimum notifications level
        history_size = 128,           -- Number of removed messages to retain in history
        override_vim_notify = true,  -- Automatically override vim.notify() with Fidget
        configs =                     -- How to configure notification groups when instantiated
          { default = require("fidget.notification").default_config },
        redirect =                    -- Conditionally redirect notifications to another backend
          function(msg, level, opts)
            if opts and opts.on_open then
              return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
            end
          end,

        -- Options related to how notifications are rendered as text
        view = {
          stack_upwards = true,       -- Display notification items from bottom to top
          icon_separator = " ",       -- Separator between group name and icon
          group_separator = "---",    -- Separator between notification groups
          group_separator_hl = "NormalFloat",
          render_message =            -- How to render notification messages
            function(msg, cnt)
              return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
            end,
        },

        -- Options related to the notification window and buffer
        window = {
          normal_hl = "NormalFloat",      -- Base highlight group in the notification window
          winblend = 0,             -- Background color opacity in the notification window
          border = require("utils").border,            -- Border around the notification window
          zindex = 45,                -- Stacking priority of the notification window
          max_width = 0,              -- Maximum width of the notification window
          max_height = 0,             -- Maximum height of the notification window
          x_padding = 1,              -- Padding from right edge of window boundary
          y_padding = 0,              -- Padding from bottom edge of window boundary
          align = "bottom",           -- How to align the notification window
          relative = "editor",        -- What the notification window position is relative to
          tabstop = 8,
          avoid = { "NvimTree", "xcodebuild-nvim" }
        },
      },

      -- Options related to logging
      logger = {
        level = vim.log.levels.OFF,  -- Minimum logging level
        max_size = 0,             -- Maximum log file size, in KB
        float_precision = 0.01,       -- Limit the number of decimals displayed for floats
        path =                        -- Where Fidget writes its logs to
          string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
      },
    })

    -- NOTE: Chuyển message mặc định của Vim (qua ui2, bật ở init.lua) sang fidget.
    -- Giữ nguyên cách hiển thị mặc định cho: search cmdline/count, prompt/confirm, output dạng list
    -- (:ls, :set, :map...), :!shell, wildlist, completion, progress và message quá dài.
    local ok_ui2, ui2_msg = pcall(require, "vim._core.ui2.messages")
    if ok_ui2 and type(ui2_msg.msg_show) == "function" then
      local ui2 = require("vim._core.ui2")
      local levels = vim.log.levels
      local kind_level = {
        emsg = levels.ERROR,
        echoerr = levels.ERROR,
        lua_error = levels.ERROR,
        rpc_error = levels.ERROR,
        wmsg = levels.WARN,
        [""] = levels.INFO,
        echo = levels.INFO,
        echomsg = levels.INFO,
        lua_print = levels.INFO,
        bufwrite = levels.INFO,
        undo = levels.INFO,
        quickfix = levels.INFO,
      }
      local max_lines = 10 -- Message dài hơn thì để ui2 hiển thị (pager) cho dễ đọc
      local orig_msg_show = ui2_msg.msg_show

      ui2_msg.msg_show = function(kind, content, ...)
        local level = kind_level[kind]
        if level and not (ui2.cmd and ui2.cmd.prompt) then
          local parts = {}
          for _, chunk in ipairs(content) do
            parts[#parts + 1] = chunk[2]
          end
          local text = vim.trim(table.concat(parts))
          local _, line_breaks = text:gsub("\n", "")
          if text ~= "" and line_breaks < max_lines then
            vim.schedule(function()
              pcall(vim.notify, text, level)
            end)
            return
          end
        end
        return orig_msg_show(kind, content, ...)
      end
    end
  end
}
