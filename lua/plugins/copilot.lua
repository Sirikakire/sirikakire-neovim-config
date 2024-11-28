return {
  {
    "zbirenbaum/copilot.lua",
    keys = require("keymap").copilot_keymaps,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = {
        enabled = true,
        auto_refresh = true,
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
    branch = "canary",
    keys = require("keymap").copilot_chat_keymaps,
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    config = function ()
      local select = require('CopilotChat.select')
      require("CopilotChat").setup({
        debug = false, -- Enable debug logging
        proxy = nil, -- [protocol://]host[:port] Use this proxy
        allow_insecure = false, -- Allow insecure server connections
        chat_autocomplete = true,
        system_prompt = require('CopilotChat.prompts').COPILOT_INSTRUCTIONS, -- System prompt to use
        model = 'gpt-4o-mini',-- GPT model to use, 'gpt-3.5-turbo', 'gpt-4', or 'gpt-4o'
        temperature = 0.2, -- GPT temperature

        question_header = '# Sirikakire  :', -- Header to use for user questions
        answer_header = '# Copilot  :', -- Header to use for AI answers
        error_header = '# Error 󰅙 :', -- Header to use for errors
        separator = ' ', -- Separator to use in chat

        show_folds = false, -- Shows folds for sections in chat
        show_help = false, -- Shows help message as virtual lines when waiting for user input
        auto_follow_cursor = true, -- Auto-follow cursor in chat
        auto_insert_mode = false, -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
        clear_chat_on_new_prompt = false, -- Clears chat on every new prompt

        context = nil, -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
        history_path = vim.fn.stdpath('data') .. '/copilotchat_history', -- Default path to stored history
        callback = nil, -- Callback to use when ask response is received

        -- default selection (visual or line)
        selection = function(source)
          return select.visual(source) or select.line(source)
        end,

        -- default prompts
        prompts = {
          Explain = {
            prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.',
            selection = select.visual
          },
          Review = {
            prompt = '/COPILOT_REVIEW Review the selected code.',
            callback = function(response, source)
              local ns = vim.api.nvim_create_namespace('copilot_review')
              local diagnostics = {}
              for line in response:gmatch('[^\r\n]+') do
                if line:find('^line=') then
                  local start_line = nil
                  local end_line = nil
                  local message = nil
                  local single_match, message_match = line:match('^line=(%d+): (.*)$')
                  if not single_match then
                    local start_match, end_match, m_message_match = line:match('^line=(%d+)-(%d+): (.*)$')
                    if start_match and end_match then
                      start_line = tonumber(start_match)
                      end_line = tonumber(end_match)
                      message = m_message_match
                    end
                  else
                    start_line = tonumber(single_match)
                    end_line = start_line
                    message = message_match
                  end

                  if start_line and end_line then
                    table.insert(diagnostics, {
                      lnum = start_line - 1,
                      end_lnum = end_line - 1,
                      col = 0,
                      message = message,
                      severity = vim.diagnostic.severity.WARN,
                      source = 'Copilot Review',
                    })
                  end
                end
              end
              vim.diagnostic.set(ns, source.bufnr, diagnostics)
            end,
          },
          Fix = {
            prompt = '/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.',
            selection = select.visual
          },
          Optimize = {
            prompt = '/COPILOT_GENERATE Optimize the selected code to improve performance and readablilty.',
            selection = select.visual
          },
          Docs = {
            prompt = '/COPILOT_GENERATE Please add documentation comment for the selection.',
            selection = select.visual
          },
          Tests = {
            prompt = '/COPILOT_GENERATE Please generate tests for my code.',
            selection = select.visual
          },
          FixDiagnostic = {
            prompt = 'Please assist with the following diagnostic issue in file:',
            selection = select.diagnostics,
          },
          Commit = {
            prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
            selection = select.gitdiff,
          },
          CommitStaged = {
            prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
            selection = function(source)
              return select.gitdiff(source, true)
            end,
          },
        },

        -- default window options
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

        -- default mappings
        mappings = {
          complete = { detail = 'Use @<Tab> or /<Tab> for options.', insert ='<Tab>' },
          close = { normal = 'q', insert = '<C-c>' },
          reset = { normal ='<C-l>', insert = '<C-l>' },
          submit_prompt = { normal = '<CR>', insert = '<C-m>' },
          accept_diff = { normal = '<C-y>', insert = '<C-y>' },
          yank_diff = { normal = 'gy' },
          show_diff = { normal = 'gd' },
          show_system_prompt = { normal = 'gp' },
          show_user_selection = { normal = 'gs' },
        },
      })
    end
  },
  { "AndreM222/copilot-lualine", event = "VeryLazy" }
}
