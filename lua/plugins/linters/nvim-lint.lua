-- GITHUB
-- https://github.com/mfussenegger/nvim-lint

-- NOTE: this linter doesn't do formatter or completion

local M = {
  "mfussenegger/nvim-lint",
}

function M.config()
  local lint = require('lint')

  local local_stylelint = vim.fn.fnamemodify('./node_modules/.bin/stylelint', ':p')
  lint.linters.stylelint.cmd = vim.fn.executable(local_stylelint) == 1 and local_stylelint or 'stylelint'
  lint.linters.stylelint.stdin = false
  lint.linters.stylelint.args = { '--formatter', 'json' }

  lint.linters_by_ft = {
    scss = {'stylelint'},
    ruby = {'rubocop'},
  }
end

return M
