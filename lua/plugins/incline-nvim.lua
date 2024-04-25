return {
  "b0o/incline.nvim",
  event = { "BufRead", "BufEnter" },
  config = function ()
    local devicons = require 'nvim-web-devicons'
    local sign_icon = require('utils').sign_icons
    require('incline').setup {
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        if filename == '' then
          filename = '[No Name]'
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)

        local function get_git_diff()
          local icons = {
            removed = sign_icon.delete,
            changed = sign_icon.change,
            added = sign_icon.add,
          }
          local signs = vim.b[props.buf].gitsigns_status_dict
          local labels = {}
          if signs == nil then
            return labels
          end
          for name, icon in pairs(icons) do
            if tonumber(signs[name]) and signs[name] > 0 then
              local hlname = ''

              if name == 'removed' then hlname = 'delete' end
              if name == 'changed' then hlname = 'change' end
              if name == 'added' then hlname = 'add' end

              table.insert(labels, {
                icon .. signs[name] .. ' ',
                group = 'GitSigns' .. hlname
              })
            end
          end
          if #labels > 0 then
            table.insert(labels, { '┃ ' })
          end
          return labels
        end

        local function get_diagnostic_label()
          local icons = {
            error = sign_icon.error,
            warn = sign_icon.warning,
            info = sign_icon.info,
            hint = sign_icon.hint
          }
          local label = {}

          if vim.fn.mode() == 'i' then
            return label
          end

          for severity, icon in pairs(icons) do
            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
            if n > 0 then
              table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
            end
          end
          if #label > 0 then
            table.insert(label, { '┃ ' })
          end
          return label
        end

        return {
          { get_diagnostic_label()  },
          { get_git_diff() },
          { (ft_icon or '') .. ' ', guifg = ft_color, guibg = 'none' },
          { filename .. ' ', gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
          -- border = require("utils").border
          guibg = "NormalFloat"
        }
      end,
      debounce_threshold = {
        falling = 50,
        rising = 10
      },
      hide = {
        cursorline = true,
        focused_win = false,
        only_win = false
      },
      highlight = {
        groups = {
          InclineNormal = {
            default = true,
            group = "NormalFloat"
          },
          InclineNormalNC = {
            default = true,
            group = "NormalFloat"
          }
        }
      },
      ignore = {
        buftypes = "special",
        filetypes = {
          "TelescopePrompt",
          'mason',
          'lazy',
          'neo-tree',
          'toggleterm',
          'dashboard'
        },
        floating_wins = true,
        unlisted_buffers = true,
        wintypes = "special"
      },
      window = {
        margin = {
          horizontal = 0,
          vertical = 0
        },
        options = {
          signcolumn = "no",
          wrap = false
        },
        overlap = {
          borders = true,
          statusline = true,
          tabline = false,
          winbar = false
        },
        padding = 1,
        padding_char = " ",
        placement = {
          horizontal = "right",
          vertical = "top"
        },
        width = "fit",
        winhighlight = {
          active = {
            EndOfBuffer = "None",
            -- Normal = "InclineNormal",
            Normal = "NormalFloat",
            Search = "None"
          },
          inactive = {
            EndOfBuffer = "None",
            -- Normal = "InclineNormalNC",
            Normal = "NormalFloat",
            Search = "None"
          }
        },
        zindex = 50
      }
    }
  end
}
