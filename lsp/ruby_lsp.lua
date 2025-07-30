-- FIX: If the lsp does not work, try re-installing the `ruby-lsp` inside the
--      mason when opening a project. (there might be a better way to do this,
--      like changing the contents of the mason file directly)
local file_types = {
  "ruby",
  "eruby",
}

local root_file = {
  "Gemfile",
  "Gemfile.lock",
  ".git",
}

local M = {
  cmd = { "ruby-lsp" },
  filetypes = file_types,
  root_dir = vim.fs.root(0, root_file),
  init_options = {
    formatter = "auto",
  },
  single_file_support = true,
}

return M
