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
      require("Comment").setup()
    end
  }
}
