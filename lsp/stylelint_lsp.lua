-- NVIM-LSPCONFIG
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#stylelint_lsp

-- NOTES:
-- INSTALL THIS: `npm i -g stylelint-lsp`
--
-- This conflicts with nvim-lint on linting like 'stylelint'. The combination
-- is `lsp + mason` to make this work 

local file_types = {
  "css",
  "less",
  "scss",
  "sass",
}

local root_file = {
  ".git",
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
  ".stylelintrc",
}

local M = {
  cmd = { "stylelint-lsp", "--stdio" },
  filetypes = file_types,
  settings = {
    stylelintplus = {
      -- OPTIONS: https://github.com/bmatcuk/stylelint-lsp?tab=readme-ov-file#settings
      -- autoFixOnFormat = true,
      -- autoFixOnSave = true
    },
  },
  root_dir = vim.fs.root(0, root_file),
}

return M
