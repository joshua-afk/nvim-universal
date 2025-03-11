local M = {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
}

function M.config()
  local bufferline = require('bufferline')
  bufferline.setup({
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          highlight = "Directory",
          separator = true -- use a "true" to enable the default, or set your own character
        }
      }
    }
  })
end

return M
