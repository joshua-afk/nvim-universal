-- Library of 40+ independent Lua modules

local M = {
  "echasnovski/mini.nvim",
  version = false,
}

function M.config()
  local pairs = require("mini.pairs")
  -- local statusline = require("mini.statusline")
  -- statusline.setup()

  pairs.setup()
end

return M
