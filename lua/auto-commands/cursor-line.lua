vim.o.cursorline=true

local cursor_line = vim.api.nvim_create_augroup('CursorLine', { clear = true })
vim.api.nvim_create_autocmd({'VimEnter', "WinEnter", "BufWinEnter", "WinLeave"}, {
  pattern = '*',
  group = cursor_line,
  command = 'setlocal cursorline'
})
