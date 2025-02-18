return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = {
        enabled = false,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>"
        },
        layout = {
          position = "right", -- | top | left | right
          ratio = 0.4
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<tab>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        ["*"] = true,
      },
      copilot_node_command = 'node', -- Node.js version must be > 18.x
      server_opts_overrides = {},
    }
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    keys = require("keymap").copilot_chat_keymaps,
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    config = function ()
      local select = require('CopilotChat.select')
      local prompts = require('CopilotChat.config.prompts')
      local contexts = require('CopilotChat.config.contexts')
      local mappings = require('CopilotChat.config.mappings')
      local base = string.format(
        [[
          When asked for your name, you must respond with "GitHub Copilot".
          Follow the user's requirements carefully & to the letter.
          Follow Microsoft content policies.
          Avoid content that violates copyrights.
          If you are asked to generate content that is harmful, hateful, racist, sexist, lewd, violent, or completely irrelevant to software engineering, only respond with "Sorry, I can't assist with that."
          Keep your answers short and impersonal.
          The user works in an IDE called Neovim which has a concept for editors with open files, integrated unit test support, an output pane that shows the output of running the code as well as an integrated terminal.
          The user is working on a %s machine. Please respond with system specific commands if applicable.
        ]],
        vim.loop.os_uname().sysname
      )

      local COPILOT_INSTRUCTIONS = [[ You are a code-focused AI programming assistant that specializes in practical software engineering solutions. ]] .. base

      local config = {
        system_prompt = COPILOT_INSTRUCTIONS, -- System prompt to use (can be specified manually in prompt via /).
        model = 'o3-mini', -- Default model to use, see ':CopilotChatModels' for available models (can be specified manually in prompt via $).
        agent = 'copilot', -- Default agent to use, see ':CopilotChatAgents' for available agents (can be specified manually in prompt via @).
        context = nil, -- Default context or array of contexts to use (can be specified manually in prompt via #).
        sticky = {
          "#buffers: listed"
        },
        temperature = 0.3, -- GPT result temperature
        headless = false, -- Do not write to chat buffer and use history(useful for using callback for custom processing)
        callback = nil, -- Callback to use when ask response is received

        -- default selection
        selection = function(source)
          return select.visual(source) or select.buffer(source)
        end,
        window = {
          layout = 'float', -- 'vertical', 'horizontal', 'float', 'replace'
          width = 0.8, -- fractional width of parent, or absolute width in columns when > 1
          height = 0.8, -- fractional height of parent, or absolute height in rows when > 1
          -- Options below only apply to floating windows
          relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
          border = require('utils').border, -- 'none', single', 'double', 'rounded', 'solid', 'shadow'          
          row = nil, -- row position of the window, default is centered
          col = nil, -- column position of the window, default is centered
          title = 'Copilot Chat Window  ', -- title of chat window
          footer = nil, -- footer of chat window
          zindex = 1, -- determines if window is on top or below other floating windows
        },
        show_help = false, -- Shows help message as virtual lines when waiting for user input
        show_folds = false, -- Shows folds for sections in chat
        highlight_selection = true, -- Highlight selection
        highlight_headers = false, -- Highlight headers in chat, disable if using markdown renderers (like render-markdown.nvim)
        auto_follow_cursor = true, -- Auto-follow cursor in chat
        auto_insert_mode = false, -- Automatically enter insert mode when opening window and on new prompt
        insert_at_end = false, -- Move cursor to end of buffer when inserting text
        clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
        debug = false, -- Enable debug logging (same as 'log_level = 'debug')
        log_level = 'info', -- Log level to use, 'trace', 'debug', 'info', 'warn', 'error', 'fatal'
        proxy = nil, -- [protocol://]host[:port] Use this proxy
        allow_insecure = false, -- Allow insecure server connections
        chat_autocomplete = true, -- Enable chat autocompletion (when disabled, requires manual `mappings.complete` trigger)
        history_path = vim.fn.stdpath('data') .. '/copilotchat_history', -- Default path to stored history
        question_header = '# Sirikakire  :', -- Header to use for user questions
        answer_header = '# Copilot  :', -- Header to use for AI answers
        error_header = '# Error 󰅙 :', -- Header to use for errors
        separator = '',-- Separator to use in chat
        contexts = contexts,
        prompts = prompts,
        mappings = mappings,
      }
      require('CopilotChat').setup(config)
    end
  },
}
