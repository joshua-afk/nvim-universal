-- Package manager for nvim lsp, linters, formatters

local M = {
  "williamboman/mason.nvim",
  dependencies = {
    -- Bridges mason and lspconfig
    "williamboman/mason-lspconfig.nvim",
  }
}

function M.config()
  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })

  -- Auto install lsp packages
  require("mason-lspconfig").setup({
    ensure_installed = {
      -- LSP
      "emmet_ls",
      -- https://github.com/mfussenegger/nvim-lint/issues/462#issuecomment-2291862784
      -- {'eslint_d', version = '13.1.2'},
      -- https://github.com/LazyVim/LazyVim/discussions/2732#discussioncomment-9430435
      -- {'eslint-lsp', version = '4.8.0' },
      "lua_ls",
      "ruby_lsp",
      -- "stylelint_lsp", -- css, less, scss, sass
      "ts_ls",

      -- Linter
      -- "eslint_d",
      -- "stylelint",

      -- Formatter
      "rubocop",
      -- "prettierd",
      -- "stylua",
    },
  })
end

return M
