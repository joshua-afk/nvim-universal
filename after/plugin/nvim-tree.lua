local tree = require("nvim-tree")

-- Options
tree.setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      }
    }
  },
  git = {
    enable = false,
    ignore = false,
    show_on_dirs = false,
    timeout = 400,
  },
  view = {
    width = 30
  }
})

-- Remaps
api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle <cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh <cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile <cr>', { noremap = true })
