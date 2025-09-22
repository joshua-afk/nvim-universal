local options = { noremap = true, silent = true }

vim.diagnostic.config {
  signs = true,
  underline = true,
  update_in_insert = true,
  virtual_lines = false,
  virtual_text = false,
  float = {
    border = 'rounded',
    focusable = true,
  }
}
