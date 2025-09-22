local root_file = {
  "tsconfig.json",
  "eslint.config.mjs",
  "jsconfig.json",
  "package.json",
  ".git"
}

local M = {
  -- cmd = {
  --   "typescript-language-server",
  --   "--stdio"
  -- },
  -- init_options = {
  --   hostInfo = "neovim"
  -- },
  -- -- filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  -- root_dir = {
  --   root_pattern = vim.fs.root(0, root_file),
  -- },
  -- settings = {
  --   preferences = {
  --     quotePreference = 'auto'
  --   },
  -- },
  -- single_file_support = false,
}

return M
