return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost" },
    dependencies = {

      -- Integrate lsp to cmp as source
      "hrsh7th/cmp-nvim-lsp",

      -- Add vscode-like pictograms to nvim lsp
      "onsails/lspkind.nvim",

      -- LSP Diagnostic (like ale), Code actions, etc.
      "nvimtools/none-ls.nvim",
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local lspconfig = require('lspconfig')
      local null_ls = require("null-ls")

      local util = require 'lspconfig.util'
      local root_pattern = util.root_pattern

      -- local formatting = null_ls.builtins.formatting
      null_ls.setup({
        sources = {
      --     -- lua
      --     formatting.stylua,
      --
      --     -- js
          null_ls.builtins.formatting.prettierd.with({
            condition = function(utils)
              return utils.has_file({ ".prettierrc.js" })
            end,
          }),
      --     -- require("none-ls.diagnostics.eslint"),
      --     require("none-ls.code_actions.eslint"),
      --
      --     -- ruby
      --     -- null_ls.builtins.diagnostics.rubocop,
        }
      })
      -- Change lsp diagnostic icons
      fn.sign_define("DiagnosticSignError", { text = '', texthl = "DiagnosticSignError" })
      fn.sign_define("DiagnosticSignWarn", { text = '', texthl = "DiagnosticSignWarn" })
      fn.sign_define("DiagnosticSignInfo", { text = '', texthl = "DiagnosticSignInfo" })
      fn.sign_define("DiagnosticSignHint", { text = '', texthl = "DiagnosticSignHint" })

      -- List of lsp servers to configure
      local servers = {
        emmet_ls = {
          filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
          init_options = {
            html = {
              options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
              },
            },
          }
        },
        eslint = {
          -- filetypes = { 'javascript', 'javascriptreact' },
          settings = {
            codeAction = {
              disableRuleComment = {
                enable = false,
                location = "separateLine"
              },
              showDocumentation = {
                enable = false
              }
            },
            codeActionOnSave = {
              enable = false,
              mode = "all"
            },
            format = true,
            nodePath = "",
            onIgnoredFiles = "off",
            packageManager = "yarn",
            problems = {
              shortenToSingleLine = true
            },
            quiet = false,
            rulesCustomizations = {},
            run = "onType",
            useESLintClass = false,
            validate = "on",
            workingDirectory = {
              mode = "location"
            }
          }
        },
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                path = vim.split(package.path, ";")
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim", "g" },
              },
              workspace = {
                -- Make the server aware of Neovim runtime files and plugins
                library = { vim.env.VIMRUNTIME },
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          }
        },
        -- ts_ls = {
        --   init_options = {
        --     hostInfo = "neovim"
        --   },
        --   -- filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        --   root_dir = {
        --     root_pattern("tsconfig.json",  "eslint.config.mjs", "jsconfig.json", "package.json", ".git")
        --   },
        --   settings = {
        --     preferences = {
        --       quotePreference = 'auto'
        --     },
        --   },
        --   single_file_support = false,
        -- },
        stylelint_lsp = {
          filetypes = { "css", "less", "scss", "sass" },
          settings = {
            stylelintplus = {
              autoFixOnFormat = true,
              autoFixOnSave = true
            },
          },
          root_dir = {
            root_pattern("jsconfig.json", "package.json", ".git")
         }
        }
      }

      -- Default handlers for LSP
      local default_handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
      }

      -- nvim-cmp supports additional completion capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local default_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Autoload keymaps when lsp is triggered
      local on_attach = function(_, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        -- local ca = g.mapping_code_action
        -- keymap.set('n', '<c-a>', vim.lsp.buf.code_action, bufopts)
        -- vim.keymap.set(ca.mode, ca.mapping, ca.command, bufopts)
        -- vim.keymap.set('n', 'C', '<cmd>lua vim.lsp.buf.code_action({ apply=true })')
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
          init_options = config.init_options,
        })
      end
    end
  }
}
