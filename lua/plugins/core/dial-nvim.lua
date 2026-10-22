-- Plugin alternative that is more Ruby driven:
-- https://github.com/AndrewRadev/switch.vim

local M = {
  "monaqa/dial.nvim",
  enabled = true,
}

function M.config()
  local augend = require("dial.augend")

  require("dial.config").augends:register_group{
    -- default augends used when no group name is specified
    default = {
      augend.constant.alias.bool,     -- boolean value (true <-> false)
      augend.date.alias["%Y/%m/%d"],  -- date (2022/02/19, etc.)
      augend.integer.alias.decimal,   -- nonnegative decimal number (0, 1, 2, 3, ...)
      augend.integer.alias.hex,       -- nonnegative hex number  (0x01, 0x1a1f, etc.)
      augend.semver.alias.semver,     -- Semantic Version
    },
  }
end

-- function M.config()
--   require("dial.config").setup()
-- end

return M
