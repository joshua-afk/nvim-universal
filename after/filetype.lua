-- REFERENCE: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/util/dot.lua
vim.filetype.add({
  extension = { rasi = "rasi", rofi = "rasi", wofi = "rasi" },
  filename = {
    ["vifmrc"] = "vim",
  },
  pattern = {
    [".*/kitty/.+%.conf"] = "bash",
  },
})
