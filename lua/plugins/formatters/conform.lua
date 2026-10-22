-- NOTE: this formatter doesn't do linter
-- check `nvim-lint` for linters

local M = {
  "stevearc/conform.nvim",
  enabled = true,
}

function M.config()
  local c = require("conform")
  -- local f = c.formatters

  -- OPTIONS: https://github.com/stevearc/conform.nvim?tab=readme-ov-file#options
  c.setup({
    formatters_by_ft = {
      -- scss = { "stylelint" },
      -- lua = { "stylua", lsp_format = "fallback" },
      -- scss = { "stylelint", "prettierd", "prettier", stop_after_first = true },
      -- ruby = { "rubocop" },
      javascript = { "eslint_d", "eslint" },
      javascriptreact = { "eslint_d", "eslint" },
      -- typescript = { "eslint_d", "eslint" },
      -- typescriptreact = { "eslint_d", "eslint" },
    },
  })
end

return M
