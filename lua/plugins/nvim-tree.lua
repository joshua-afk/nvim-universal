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
      require("nvim-tree").setup({
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
    end
  }
}
