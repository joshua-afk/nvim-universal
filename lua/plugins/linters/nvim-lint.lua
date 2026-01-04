-- GITHUB
-- https://github.com/mfussenegger/nvim-lint

-- NOTE: this linter doesn't do formatter or completion
-- check `conform` for formatters

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
    -- scss = {'stylelint'},
    -- ruby = {'rubocop'},
  }

  local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
  vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function()

      -- try_lint without arguments runs the linters defined in `linters_by_ft`
      -- for the current filetype
      lint.try_lint()

      -- -- You can call `try_lint` with a linter name or a list of names to always
      -- -- run specific linters, independent of the `linters_by_ft` configuration
      -- require("lint").try_lint("cspell")
    end,
  })

end

-- return M
return {} -- disable plugin
