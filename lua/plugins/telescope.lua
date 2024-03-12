return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      local Layout = require("nui.layout")
      local Popup = require("nui.popup")
      local TSLayout = require("telescope.pickers.layout")
      local actions = require("telescope.actions")

      require('telescope').setup({
        extension = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          },
        },
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close
            },
          },
        },
        pickers = {
          find_files = {
            theme = "ivy",
            prompt_prefix = "  ",
          },
          live_grep = {
            theme = "ivy",
            prompt_prefix = "  ",
          },
          buffers = {
            theme = "ivy",
            prompt_prefix = "  ",
          },
          diagnostics = {
            theme = "ivy",
            prompt_prefix = "  ",
          },
          git_bcommits = {
            theme = "ivy",
            prompt_prefix = "  ",
          },
          lsp_references = {
            theme = "ivy",
            prompt_prefix = "  ",
          },
        },
        --[[ defaults = {
          create_layout = function(picker)
            local border = {
              results = {
                top_left = "┌",
                top = "─",
                top_right = "┬",
                right = "│",
                bottom_right = "",
                bottom = "",
                bottom_left = "",
                left = "│",
              },
              results_patch = {
                minimal = {
                  top_left = "┌",
                  top_right = "┐",
                },
                horizontal = {
                  top_left = "┌",
                  top_right = "┬",
                },
                vertical = {
                  top_left = "├",
                  top_right = "┤",
                },
              },
              prompt = {
                top_left = "├",
                top = "─",
                top_right = "┤",
                right = "│",
                bottom_right = "┘",
                bottom = "─",
                bottom_left = "└",
                left = "│",
              },
              prompt_patch = {
                minimal = {
                  bottom_right = "┘",
                },
                horizontal = {
                  bottom_right = "┴",
                },
                vertical = {
                  bottom_right = "┘",
                },
              },
              preview = {
                top_left = "┌",
                top = "─",
                top_right = "┐",
                right = "│",
                bottom_right = "┘",
                bottom = "─",
                bottom_left = "└",
                left = "│",
              },
              preview_patch = {
                minimal = {},
                horizontal = {
                  bottom = "─",
                  bottom_left = "",
                  bottom_right = "┘",
                  left = "",
                  top_left = "",
                },
                vertical = {
                  bottom = "",
                  bottom_left = "",
                  bottom_right = "",
                  left = "│",
                  top_left = "┌",
                },
              },
            }

            local results = Popup({
              focusable = false,
              border = {
                style = border.results,
                text = {
                  top = picker.results_title,
                  top_align = "center",
                },
              },
              win_options = {
                winhighlight = "Normal:Normal",
              },
            })

            local prompt = Popup({
              enter = true,
              border = {
                style = border.prompt,
                text = {
                  top = picker.prompt_title,
                  top_align = "center",
                },
              },
              win_options = {
                winhighlight = "Normal:Normal",
              },
            })

            local preview = Popup({
              focusable = false,
              border = {
                style = border.preview,
                text = {
                  top = picker.preview_title,
                  top_align = "center",
                },
              },
            })

            local box_by_kind = {
              vertical = Layout.Box({
                Layout.Box(preview, { grow = 1 }),
                Layout.Box(results, { grow = 1 }),
                Layout.Box(prompt, { size = 3 }),
              }, { dir = "col" }),
              horizontal = Layout.Box({
                Layout.Box({
                  Layout.Box(results, { grow = 1 }),
                  Layout.Box(prompt, { size = 3 }),
                }, { dir = "col", size = "50%" }),
                Layout.Box(preview, { size = "50%" }),
              }, { dir = "row" }),
              minimal = Layout.Box({
                Layout.Box(results, { grow = 1 }),
                Layout.Box(prompt, { size = 3 }),
              }, { dir = "col" }),
            }

            local function get_box()
              local height, width = vim.o.lines, vim.o.columns
              local box_kind = "horizontal"
              if width < 100 then
                box_kind = "vertical"
                if height < 40 then
                  box_kind = "minimal"
                end
              elseif width < 120 then
                box_kind = "minimal"
              end
              return box_by_kind[box_kind], box_kind
            end

            local function prepare_layout_parts(layout, box_type)
              layout.results = TSLayout.Window(results)
              results.border:set_style(border.results_patch[box_type])

              layout.prompt = TSLayout.Window(prompt)
              prompt.border:set_style(border.prompt_patch[box_type])

              if box_type == "minimal" then
                layout.preview = nil
              else
                layout.preview = TSLayout.Window(preview)
                preview.border:set_style(border.preview_patch[box_type])
              end
            end

            local box, box_kind = get_box()
            local layout = Layout({
              relative = "editor",
              position = "50%",
              size = {
                height = "90%",
                width = "90%",
              },
            }, box)

            layout.picker = picker
            prepare_layout_parts(layout, box_kind)

            local layout_update = layout.update
            function layout:update()
              local box, box_kind = get_box()
              prepare_layout_parts(layout, box_kind)
              layout_update(self, box)
            end

            return TSLayout(layout)
          end,
        } ]]
      })
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fp', builtin.git_bcommits, {})
      vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
      require("telescope").load_extension("ui-select")
    end
  }
}
