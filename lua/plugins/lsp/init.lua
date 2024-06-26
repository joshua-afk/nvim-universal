return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost" },
    dependencies = {
      -- Package manager for nvim lsp, linters, formatters
      "williamboman/mason.nvim",

      -- Bridges mason and lspconfig
      "williamboman/mason-lspconfig.nvim",

      -- Integrate lsp to cmp as source
      "hrsh7th/cmp-nvim-lsp",

      -- Add vscode-like pictograms to nvim lsp
      "onsails/lspkind.nvim",

      -- Docs & completion for nvim lua API
      "folke/neodev.nvim",

      -- LSP Diagnostic (like ale), Code actions, etc.
      "nvimtools/none-ls.nvim",
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      -- local util = require 'lspconfig.util'
      local lspconfig = require('lspconfig')
      local null_ls = require("null-ls")

      -- Initialize neodev
      require('neodev').setup()

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
          "eslint",
          "lua_ls"
        },
      })

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          require("none-ls.diagnostics.eslint"),
        }
      })

      -- Change lsp diagnostic icons
      fn.sign_define("DiagnosticSignError", { text = '', texthl = "DiagnosticSignError" })
      fn.sign_define("DiagnosticSignWarn", { text = '', texthl = "DiagnosticSignWarn" })
      fn.sign_define("DiagnosticSignInfo", { text = '', texthl = "DiagnosticSignInfo" })
      fn.sign_define("DiagnosticSignHint", { text = '', texthl = "DiagnosticSignHint" })

      -- List of lsp servers to configure
      local servers = {
        lua_ls = {},
      }

      -- Default handlers for LSP
      local default_handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      }

      -- nvim-cmp supports additional completion capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local default_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Autoload keymaps when lsp is triggered
      local on_attach = function(_, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      end

      -- Setup lsp servers recursively
      for name, config in pairs(servers) do
        lspconfig[name].setup({
          capabilities = default_capabilities,
          filetypes = config.filetypes,
          handlers = vim.tbl_deep_extend("force", {}, default_handlers, config.handlers or {}),
          on_attach = on_attach,
          settings = config.settings,
        })
      end
    end
  }
}
