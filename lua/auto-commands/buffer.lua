-- Format buffers
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  command = 'setl bufhidden=delete'
})

vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*.*',
  command = 'mkview'
})

vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*.*',
  command = 'silent! loadview'
})

