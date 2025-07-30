-- Easily create and manage predefined window layouts, bringing a new edge to your workflow

local M = {
  "folke/edgy.nvim",
  event = "VeryLazy",
  version = false,
  opts = {
    bottom = {
      -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
      {
        ft = "toggleterm",
        size = { height = 0.4 },
        -- exclude floating windows
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      -- {
      --   ft = "quicknote",
      --   title = "Current line note",
      --   size = { height = 0.3 },
      --   -- filter = function(buf, win)
      --   --   return vim.api.nvim_win_get_config(win).relative == ""
      --   -- end,
      -- },
    },
  },
}

function M.init()
  vim.opt.laststatus = 3
  vim.opt.splitkeep = "screen"
end

return M

