-- A file explorer

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
        -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
      end

      tree.setup({
        git = {
          enable = true,
          ignore = false,
          show_on_dirs = true,
          timeout = 400,
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          show_on_open_dirs = true,
          debounce_delay = 50,
          severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
          },
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        modified = {
          enable = true,
          show_on_dirs = true,
          show_on_open_dirs = true,
        },
        on_attach = custom_on_attach,
        renderer = {
          -- allowing  `"none"`, `"icon"`, `"name"` or `"all"`
          highlight_diagnostics = "name",
          highlight_opened_files = "name",
          highlight_git = "name",
          highlight_hidden = "none",
          icons = {
            -- git_placement = "before",
            git_placement = "after",
            modified_placement = "after",
            hidden_placement = "after",
            -- diagnostics_placement = "after",
            -- bookmarks_placement = "after",
            diagnostics_placement = "after",
            bookmarks_placement = "signcolumn",
            padding = " ",
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
              modified = true,
              hidden = true,
              diagnostics = true,
              bookmarks = true,
            },
            glyphs = {
              default = "",
              symlink = "",
              bookmark = "󰆤",
              modified = "●",
              -- hidden = "󰜌",
              hidden = "",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                -- unstaged = "✗",
                -- staged = "✓",
                -- unstaged = "",
                unstaged = "",
                staged = "",
                unmerged = "",
                renamed = "",
                -- renamed = "➜",
                -- untracked = "★",
                untracked = "",
                -- deleted = "",
                deleted = "D",
                -- ignored = "◌",
                ignored = "",
                -- ignored = "",
                -- added = "",
                -- modified = "",
                -- deleted = "",
                -- renamed = "",
                -- untracked = "",
                -- ignored = "",
                -- unstaged = "",
                -- staged = "",
                -- conflict = "",
              },
            },
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
          },
        },
        filters = {
          dotfiles = true
        },
        update_cwd = false,
        update_focused_file = {
          enable = false,
          update_root = false
        },
        view = {
          width = g.left_sidebar_width,
          number = true,
          relativenumber = true,
          signcolumn = "yes",
        }
      })
    end
  }
}
