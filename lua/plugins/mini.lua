-- Library of 40+ independent Lua modules

local M = {
  "echasnovski/mini.nvim",
  version = false,
}

function M.config()
  local statusline = require("mini.statusline")

  statusline.setup()
end

return M
