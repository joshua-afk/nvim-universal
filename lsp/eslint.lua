-- NVIM-LSPCONFIG
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#eslint

-- TODO: Check if this depends on MASON `eslint-lsp` installation or if this depends on
-- system or project scoped lsp installation

-- https://github.com/mfussenegger/nvim-lint/issues/462#issuecomment-2291862784
-- {'eslint_d', version = '13.1.2'},
-- https://github.com/LazyVim/LazyVim/discussions/2732#discussioncomment-9430435
-- {'eslint-lsp', version = '4.8.0' },

local file_types = {
  'javascript',
  'javascriptreact',
}

local root_file = {
  '.eslintrc',
  -- '.eslintrc.js',
  -- '.eslintrc.cjs',
  -- '.eslintrc.yaml',
  -- '.eslintrc.yml',
  -- '.eslintrc.json',
  -- 'eslint.config.js',
  -- 'eslint.config.mjs',
  -- 'eslint.config.cjs',
  -- 'eslint.config.ts',
  -- 'eslint.config.mts',
  -- 'eslint.config.cts',
}

local M = {
  cmd = {
    'vscode-eslint-language-server',
    '--stdio'
  },
  filetypes = file_types,
  root_dir = vim.fs.root(0, root_file),
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
    -- https://github.com/neovim/nvim-lspconfig/pull/3183#issuecomment-2140017018
    experimental = {
      useFlatConfig = false,
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
      -- help eslint find the `eslintrc` when it's placed in a subfolder instead of cmd root
      mode = "auto"
    },
  },
}

return M
