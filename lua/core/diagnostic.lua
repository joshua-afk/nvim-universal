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

-- MAPPINGS
-- keymap.set('n', '<leader>j', function()
--   vim.diagnostic.goto_next()
-- end, options)

vim.keymap.set('n', 'gK', function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })

keymap.set('n', 'gk', function()
  vim.diagnostic.open_float()
end, options)

