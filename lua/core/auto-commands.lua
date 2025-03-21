api = vim.api

-- Cursor Line
local cursor_line = api.nvim_create_augroup('CursorLine', {clear = true})

api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  group = cursor_line,
  command = 'setlocal cursorline'
})

api.nvim_create_autocmd('WinEnter', {
  pattern = '*',
  group = cursor_line,
  command = 'setlocal cursorline'
})

api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  group = cursor_line,
  command = 'setlocal cursorline'
})

api.nvim_create_autocmd('WinLeave', {
  pattern = '*',
  group = cursor_line,
  command = 'setlocal nocursorline'
})

-- Buffer
api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  command = 'setl bufhidden=delete'
})

api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*.*',
  command = 'mkview'
})

api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*.*',
  command = 'silent! loadview'
})

-- Highlight on yank (See `:help vim.highlight.on_yank()`)
-- local highlight_group = api.nvim_create_augroup('YankHighlight', { clear = true })
--
-- api.nvim_create_autocmd('TextYankPost', {
--   callback = function()
--     vim.highlight.on_yank()
--   end,
--   group = highlight_group,
--   pattern = '*',
-- })
