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
        update_cwd = false,
        update_focused_file = {
          enable = true,
          update_root = false
        },
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
        git = {
          enable = false,
          ignore = false,
          show_on_dirs = false,
          timeout = 400,
        },
        view = {
          width = 45
        }
      })
    end
  }
}
