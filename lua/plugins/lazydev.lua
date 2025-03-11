-- Faster LuaLS setup for Neovim
local M = {
  "folke/lazydev.nvim",
  ft = "lua", -- only load on lua files
  dependencies = {
    { "Bilal2453/luvit-meta", lazy = true },
  },
}

M.opts = {
  library = {
    -- See the configuration section for more details
    -- Load luvit types when the `vim.uv` word is found
    { path = "luvit-meta/library", words = { "vim%.uv" } },
  },
}

return M
