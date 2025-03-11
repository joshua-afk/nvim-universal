local M = {
  "tpope/vim-dadbod",
  dependencies = {
    { "kristijanhusak/vim-dadbod-ui",         lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  }
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
