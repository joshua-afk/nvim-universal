-- NVIM-LSPCONFIG
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#stylelint_lsp

-- NOTES:
-- INSTALL THIS: `npm i -g stylelint-lsp`

-- This conflicts with `nvim-lint` when using linter like `stylelint`, which is currently working.
-- This setup uses `lsp` and `mason` together to make this work.

-- Can we make a callback to make this work on every project setup?

local file_types = {
  "css",
  "less",
  "scss",
  "sass",
}

local root_file = {
  ".git",
  ".stylelintrc",
  ".stylelintrc.cjs",
  ".stylelintrc.js",
  ".stylelintrc.json",
  ".stylelintrc.mjs",
  ".stylelintrc.yaml",
  ".stylelintrc.yml",
  "jsconfig.json",
  "package.json",
  "stylelint.config.cjs",
  "stylelint.config.js",
  "stylelint.config.mjs",
}

local M = {
  cmd = { "stylelint-lsp", "--stdio" },
  filetypes = file_types,
  settings = {
    stylelintplus = {
      -- OPTIONS: https://github.com/bmatcuk/stylelint-lsp?tab=readme-ov-file#settings
      autoFixOnFormat = false,
      autoFixOnSave = false,
      cssInJs = false,
      enable = true,
      validateOnSave = false,
      validateOnType = true,
    },
  },
  root_markers = root_file,
}

return M
