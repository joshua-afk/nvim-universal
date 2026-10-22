-- NVIM-LSPCONFIG
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ts_ls

-- This enables `GOTO Definition` in React projects

-- TODO: Check if this depends on MASON `ts_ls` installation or if this depends on
-- system or project scoped lsp installation

local file_types = {
  'javascript',
  'javascriptreact',
  'javascript.jsx',
  'typescript',
  'typescriptreact',
  'typescript.tsx',
}

local root_files = {
  '.eslintrc',
  '.git',
  'eslint.config.mjs',
  'jsconfig.json',
  'package-lock.json',
  'package.json',
  'tsconfig.json',
  'yarn.lock',
}

local M = {
  cmd = {
    "typescript-language-server",
    "--stdio"
  },
  init_options = {
    hostInfo = "neovim"
  },
  filetypes = file_types,
  -- root_dir = {
  --   root_pattern = vim.fs.root(0, root_file),
  -- },
  root_dir = function(bufnr, on_dir)
    -- Give the root markers equal priority by wrapping them in a table (nested markers need nvim 0.11.3+)
    -- Use a local copy, reassigning `root_files` would nest it deeper on every call
    local markers = vim.fn.has('nvim-0.11.3') == 1 and { root_files, { '.git' } }
      or vim.list_extend(vim.deepcopy(root_files), { '.git' })
    -- We fallback to the current working directory if no project root is found
    local project_root = vim.fs.root(bufnr, markers) or vim.fn.getcwd()

    on_dir(project_root)
  end,
  settings = {
    -- preferences = {
    --   quotePreference = 'auto'
    -- },
  },
  single_file_support = false,
}

return M
