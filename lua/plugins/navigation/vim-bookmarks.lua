local M = {
  "MattesGroeger/vim-bookmarks",
}

function M.config()
  api.nvim_set_hl(0, "BookmarkSign", { fg = "#d8a657" })
  api.nvim_set_hl(0, "BookmarkLine", { bg = "#4d4d4d" })
  -- " highlight BookmarkLine ctermbg=194 ctermfg=NONE
  vim.cmd [[
    " let g:bookmark_sign = '⭐'
    let g:bookmark_highlight_lines = 1
  ]]
end

return M
