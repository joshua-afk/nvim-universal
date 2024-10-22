return {
  -- Package manager for nvim lsp, linters, formatters
  "williamboman/mason.nvim",
  dependencies = {
    -- Bridges mason and lspconfig
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Initialize and setup mason
    require('mason').setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    -- Auto install lsp packages
    require('mason-lspconfig').setup({
      ensure_installed = {
        -- LSP
        "emmet_ls",
        "eslint",
        "lua_ls",
        "stylelint_lsp", -- css, less, scss, sass
        "ts_ls",

        -- Linter
        -- "eslint_d",
        "stylelint",

        -- Formatter
        "prettierd",
        "stylua",
      },
    })
  end
}
