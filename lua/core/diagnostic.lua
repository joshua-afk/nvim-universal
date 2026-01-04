local icons = require('icons')
local options = { noremap = true, silent = true }

vim.diagnostic.config {
  -- signs = true,
  underline = true,
  update_in_insert = true,
  virtual_lines = false,
  virtual_text = false,
  float = {
    border = 'rounded',
    focusable = true,
  },
  -- h diagnostic-signs
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.ERROR,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.WARN,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.HINT,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.INFO,
    },
  }
}
