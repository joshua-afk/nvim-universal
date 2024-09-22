return {
  {
    'tpope/vim-dadbod',
    dependencies = {
      { 'kristijanhusak/vim-dadbod-ui', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    config = function()
      vim.cmd [[
        let g:db_ui_default_query = 'select * from "{table}" limit 10'

        let g:db_ui_winwidth = 45
      ]]
    end
  }
}
