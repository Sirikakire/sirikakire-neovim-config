return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  keys = require("keymap").avante_keymaps,
  opts = {
    auto_suggestions_provider = "copilot",
    cursor_applying_provider = "copilot",
    provider = "copilot",
    copilot = {
      endpoint = "https://api.githubcopilot.com",
      model = "o3-mini",
      proxy = nil, -- [protocol://]host[:port] Use this proxy
      allow_insecure = false, -- Allow insecure server connections
      timeout = 30000, -- Timeout in milliseconds
      temperature = 0.3,
      disable_tools = true
    },
    dual_boost = {
      enabled = false,
      first_provider = "openai",
      second_provider = "claude",
      prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
      timeout = 60000, -- Timeout in milliseconds
    },
    behaviour = {
      auto_focus_sidebar = true,
      auto_suggestions_respect_ignore = false,
      jump_result_buffer_on_finish = true,
      use_cwd_as_project_root = true,
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = true,
      support_paste_from_clipboard = true,
      minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
      enable_token_counting = false, -- Whether to enable token counting. Default to true.
      enable_cursor_planning_mode = true, -- Whether to enable Cursor Planning Mode. Default to false.
      enable_claude_text_editor_tool_mode = true, -- Whether to enable Claude Text Editor Tool Mode.
    },
    history = {
      max_tokens = 0,
      storage_path = vim.fn.stdpath("state") .. "/avante",
      paste = {
        extension = "png",
        filename = "pasted-%Y-%m-%d-%H-%M-%S",
      },
    },
    mappings = {
      suggestion = {
        accept = "<tab>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    hints = { enabled = true },
    windows = {
      position = "right", -- the position of the sidebar
      wrap = true, -- similar to vim.o.wrap
      width = 40, -- default % based on available width
      height = 30,
      sidebar_header = {
        enabled = false, -- true, false to enable/disable the header
        align = "right", -- left, center, right for title
        rounded = true,
      },
      input = {
        prefix = "> ",
        height = 4, -- Height of the input window in vertical layout
      },
      edit = {
        border = require("utils").border,
        start_insert = false, -- Start insert mode when opening the edit window
      },
      ask = {
        floating = true, -- Open the 'AvanteAsk' prompt in a floating window
        start_insert = false, -- Start insert mode when opening the ask window
        border = require("utils").border,
        focus_on_apply = "ours", -- which diff to focus after applying
      },
    },
    highlights = {
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    diff = {
      autojump = true,
      list_opener = "copen",
      override_timeoutlen = 500,
    },
    suggestion = {
      debounce = 600,
      throttle = 600,
    },
  },
  build = "make",
}
