-- Mappings reference:
-- https://github.com/kristijanhusak/vim-dadbod-ui?tab=readme-ov-file#mappings

local M = {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
}

function M.init()
  vim.g.db_ui_use_nerd_fonts = 1
end

function M.config()
  vim.cmd [[
    let g:db_ui_default_query = 'select * from "{table}" limit 10'

    let g:db_ui_winwidth = left_sidebar_width
  ]]
end

return M
