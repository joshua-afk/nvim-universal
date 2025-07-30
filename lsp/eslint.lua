local file_types = {
  'javascript',
  'javascriptreact',
}

local root_file = {
  '.eslintrc',
  '.eslintrc.js',
  '.eslintrc.cjs',
  '.eslintrc.yaml',
  '.eslintrc.yml',
  '.eslintrc.json',
  'eslint.config.js',
  'eslint.config.mjs',
  'eslint.config.cjs',
  'eslint.config.ts',
  'eslint.config.mts',
  'eslint.config.cts',
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
    },
  },
}

return M
