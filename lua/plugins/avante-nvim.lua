return {
  "yetone/avante.nvim",
  build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" or "make",
  event = "VeryLazy",
  dependencies = {
    "OXY2DEV/markview.nvim"
  },
  version = false, -- Never set this value to "*"! Never!
  keys = require("keymap").avante_keymaps,
  opts = {
    mode = "legacy", -- "agentic" | "legacy"
    instructions_file = "~/.config/nvim/avante.md",
    auto_suggestions_provider = "copilot",
    cursor_applying_provider = "copilot",
    memory_summary_provider = "copilot",
    experimental = {
      check_rtp = false,
    },
    provider = "copilot",
    system_prompt = nil,
    override_prompt_dir = nil,
    rules = {
      project_dir = nil, ---@type string | nil (could be relative dirpath)
      global_dir = nil, ---@type string | nil (absolute dirpath)
    },
    providers = {
      copilot = {
        endpoint = "https://api.githubcopilot.com",
        model = "gpt-4o-mini", -- Model to use, e.g., "claude-3-7-sonnet"
        proxy = nil, -- [protocol://]host[:port] Use this proxy
        allow_insecure = false, -- Allow insecure server connections
        timeout = 30000, -- Timeout in milliseconds
        disable_tools = true,
        extra_request_body = {
          temperature = 0.3,
        }
      },
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-7-sonnet",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0,
          max_tokens = 20480,
        }
      },
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
      auto_suggestions = false, -- Experimental stage
      use_cwd_as_project_root = true,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = true,
      support_paste_from_clipboard = true,
      minimize_diff = false, -- Whether to remove unchanged lines when applying a code block
      enable_token_counting = true, -- Whether to enable token counting. Default to true.
      enable_cursor_planning_mode = true, -- Whether to enable Cursor Planning Mode. Default to false.
      -- enable_claude_text_editor_tool_mode = false, -- Whether to enable Claude Text Editor Tool Mode.
      auto_focus_on_diff_view = true,
      auto_approve_tool_permissions = false, -- Default: show permission prompts for all tools
      enable_fastapply = false, -- Whether to enable fast apply mode
      ---@type boolean | string[] -- true: auto-approve all tools, false: normal prompts, string[]: auto-approve specific tools by name
      auto_check_diagnostics = true,
      allow_access_to_git_ignored_files = true,
      include_generated_by_commit_line = true, -- Controls if 'Generated-by: <provider/model>' line is added to git commit message
      auto_add_current_file = true, -- Whether to automatically add the current file when opening a new chat
      --- popup is the original yes,all,no in a floating window
      --- inline_buttons is the new inline buttons in the sidebar
      ---@type "popup" | "inline_buttons"
      confirmation_ui_style = "popup",
      --- Whether to automatically open files and navigate to lines when ACP agent makes edits
      ---@type boolean
      acp_follow_agent_locations = true,
    },
    prompt_logger = { -- logs prompts to disk (timestamped, for replay/debugging)
      enabled = false, -- toggle logging entirely
      log_dir = vim.fn.stdpath("cache") .. "/avante_prompts", -- directory where logs are saved
      fortune_cookie_on_success = false, -- shows a random fortune after each logged prompt (requires `fortune` installed)
      next_prompt = {
        normal = "<C-n>", -- load the next (newer) prompt log in normal mode
        insert = "<C-n>",
      },
      prev_prompt = {
        normal = "<C-p>", -- load the previous (older) prompt log in normal mode
        insert = "<C-p>",
      },
    },
    history = {
      max_tokens = 0,
      carried_entry_count = nil,
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
    selection = {
      enabled = true,
      hint_display = "delayed",
    },
    hints = { enabled = true },
    windows = {
      fillchars = "eob: ",
      position = "right", -- the position of the sidebar
      wrap = true, -- similar to vim.o.wrap
      width = 40, -- default % based on available width
      height = 30,
      spinner = {
        editing = { "⡀", "⠄", "⠂", "⠁", "⠈", "⠐", "⠠", "⢀", "⣀", "⢄", "⢂", "⢁", "⢈", "⢐", "⢠", "⣠", "⢤", "⢢", "⢡", "⢨", "⢰", "⣰", "⢴", "⢲", "⢱", "⢸", "⣸", "⢼", "⢺", "⢹", "⣹", "⢽", "⢻", "⣻", "⢿", "⣿" },
        generating = { "·", "✢", "✳", "∗", "✻", "✽" }, -- Spinner characters for the 'generating' state
        thinking = { "🤯", "🙄" }, -- Spinner characters for the 'thinking' state
      },
      sidebar_header = {
        enabled = true, -- true, false to enable/disable the header
        align = "center", -- left, center, right for title
        rounded = false,
      },
      input = {
        prefix = "> ",
        height = 3, -- Height of the input window in vertical layout
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
      override_timeoutlen = 500,
    },
    suggestion = {
      debounce = 600,
      throttle = 600,
    },
    disabled_tools = {}, ---@type string[]
    custom_tools = {},
    slash_commands = {},
    shortcuts = {},
    ask_opts = {},
  },
}
