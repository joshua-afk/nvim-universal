-- Adds indentation guides.
-- Very useful for large projects.

local M = {
  'lukas-reineke/indent-blankline.nvim',
}

function M.config()
  require('ibl').setup({
    indent = {
      char = "▏", -- This is a slightly thinner char than the default one, check :help ibl.config.indent.char
    },
  })
end

return M
