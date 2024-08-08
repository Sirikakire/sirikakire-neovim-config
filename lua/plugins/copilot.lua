return {
  {
    "github/copilot.vim",
    -- keys = require("keymap").copilot_keymaps,
    event = "InsertEnter"
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    keys = require("keymap").copilot_chat_keymaps,
    dependencies = {
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup({
        debug = false, -- Enable debug logging
        proxy = nil, -- [protocol://]host[:port] Use this proxy
        allow_insecure = false, -- Allow insecure server connections

        system_prompt = require('CopilotChat.prompts').COPILOT_INSTRUCTIONS, -- System prompt to use
        model = 'gpt-4o',-- GPT model to use, 'gpt-3.5-turbo', 'gpt-4', or 'gpt-4o'
        temperature = 0.5, -- GPT temperature

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
          return require('CopilotChat.select').visual(source) or require('CopilotChat.select').line(source)
        end,

        -- default prompts
        prompts = {
          Explain = {
            prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.',
            selection = require("CopilotChat.select").buffer
          },
          Review = {
            prompt = '/COPILOT_REVIEW Review the selected code.',
            callback = function(response, source)
              -- see config.lua for implementation
            end,
          },
          Fix = {
            prompt = '/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.',
            selection = require("CopilotChat.select").visual
          },
          Optimize = {
            prompt = '/COPILOT_GENERATE Optimize the selected code to improve performance and readablilty.',
            selection = require("CopilotChat.select").visual
          },
          Docs = {
            prompt = '/COPILOT_GENERATE Please add documentation comment for the selection.',
            selection = require("CopilotChat.select").visual
          },
          Tests = {
            prompt = '/COPILOT_GENERATE Please generate tests for my code.',
            selection = require("CopilotChat.select").visual
          },
          FixDiagnostic = {
            prompt = 'Please assist with the following diagnostic issue in file:',
            selection = require('CopilotChat.select').diagnostics,
          },
          Commit = {
            prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
            selection = require('CopilotChat.select').gitdiff,
          },
          CommitStaged = {
            prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
            selection = function(source)
              return require('CopilotChat.select').gitdiff(source, true)
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
}
