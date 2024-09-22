return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    cmd = "NvimTreeToggle",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local tree = require("nvim-tree")

      local custom_on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
        vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
      end

      tree.setup({
        git = {
          enable = false,
          ignore = false,
          show_on_dirs = false,
          timeout = 400,
        },
        on_attach = custom_on_attach,
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = false,
            }
          },
          indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
              corner = "└",
              edge = "│",
              item = "│",
              bottom = "─",
              none = " ",
            }
          }
        },
        update_cwd = false,
        update_focused_file = {
          enable = true,
          update_root = false
        },
        view = {
          width = 45
        }
      })
    end
  }
}
