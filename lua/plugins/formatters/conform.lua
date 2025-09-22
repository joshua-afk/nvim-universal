local M = {
  "stevearc/conform.nvim",
}

function M.config()
  local c = require("conform")
  local f = c.formatters

  -- OPTIONS: https://github.com/stevearc/conform.nvim?tab=readme-ov-file#options
  c.setup({
    formatters_by_ft = {
      -- lua = { "stylua", lsp_format = "fallback" },
      -- scss = { "stylelint", "prettierd", "prettier", stop_after_first = true },
      -- ruby = { "rubocop" },
      scss = { "stylelint" },
    },
  })
end

return M
