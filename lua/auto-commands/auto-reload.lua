-- Reload buffer when there's external modification.
-- LAYMAN: Reload current file when there are changes outside neovim.

vim.o.autoread=true

vim.api.nvim_create_autocmd({"FocusGained", "BufEnter", "VimResume", "CursorHold"}, {
  pattern = '*',
  command = 'checktime'
})
