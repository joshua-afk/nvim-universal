return {
  {
    'numToStr/Comment.nvim',
    dependencies = {
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function()
          enable_autocmd = true
        end
      }
    },
    config = function()
      local prehook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()

      require("Comment").setup({
        pre_hook = prehook,
      })
    end
  }
}
