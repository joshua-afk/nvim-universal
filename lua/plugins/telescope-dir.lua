return {
  {
    'princejoogie/dir-telescope.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim'
    },
    config = function()
      local dt = require('dir-telescope')

      dt.setup({
        hidden = true,
        no_ignore = false,
        show_preview = true,
      })
    end
  }
}
